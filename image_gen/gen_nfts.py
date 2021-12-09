# -*- coding: utf-8 -*-
#!/usr/bin/env python3

import os
import sys
import random
from pathlib import Path
from dotenv import load_dotenv
from PIL import Image, ImageDraw, ImageFont



def create_dest_dir(final_dir):
    """Crete a destination dir for NFTs"""
    try:
        os.mkdir("nfts")
    except FileExistsError:
        return


def get_config(key, env_path=None):
    """Given a key, get the value from the env file.
    Arguments:
        key (str)
    Return:
        value(str)
    """
    env_path = env_path or Path('.') / '.env'
    load_dotenv(dotenv_path=env_path)
    value = os.getenv(key)

    if not value:
        print('📛 Please set {} in .env'.format(key))
        sys.exit(0)
    return value


def open_trait_file(filename):
    """Open a file with a list of trait strings and return that list.
    Arguments:
        filename (str) - file to be open
    Return:
        items(list) - content of the file
    """
    items = []
    try:
        with open(filename, "r") as f:
            items = f.readlines()
            items = [line.rstrip('\n') for line in items]
    except IOError:
        print("Could not open {}".format(filename))
        sys.exit(1)

    return items


def save_image(nft_num, this_nft):
    """Save the the list of strings in a NFT into an image.
    Arguments:
        nft_num(str) - this NFT id
        this_nft(str) - the content of this nft
    """
    img = Image.new('RGB', (600, 600), color=(255, 255, 255))
    d = ImageDraw.Draw(img)

    fnt = ImageFont.truetype("Roboto-Medium.ttf", 30)
    d.text((20, 150), this_nft, font=fnt, fill=(0, 0, 0))
    d.text((550, 30), "#{}".format(str(nft_num)), font=fnt, fill=(0, 0, 0))

    try:
        nft_name = "nft_{}.png".format(str(nft_num))
        img.save(nft_name)
    except:
        print("Could not save {0} with {1}".format(nft_num, this_nft))


def get_traits_list(num_trait_lines):
    """Return a multi-dimensional array with every trait list.
    Arguments:
        num_trait_lines(str) - the number of trait lines in one nft
    Returns:
        the final string for NFT
    """
    trait_file_str = get_config("TRAIT_FILE_STR")
    traits_list = []

    for n in range(int(num_trait_lines)):
        trait_file = trait_file_str.format(n)
        traits_list.append(open_trait_file(trait_file))

    return traits_list


def get_this_nft(num_trait_lines, traits_list):
    """ Get the random content of one NFT.
    Arguments:
        num_trait_lines (str) - the number of trait lines in one nft
        traits_list (list) - multi-dimensional list with all traits
    Return:
        this_nft (list) - what composes the current NFT
    """
    this_nft = []
    for n in range(int(num_trait_lines)):
        this_trait_list = traits_list[n]
        random_trait_n = random.randint(0, len(this_trait_list)-1)
        random_trait_str = this_trait_list[random_trait_n]
        this_nft.append(random_trait_str)

    return "\n".join(this_nft)


def generate_nfts(num_edition, num_trait_lines, traits_list):
    """Create and save NFT images
    Arguments:
        num_edition(str) - num of NFTs to be generated
        num_trait_lines (str) - the number of trait lines in one nft
        traits_list (list) - multi-dimensional list with all traits
    """
    for n in range(1, int(num_edition) + 1):
        this_nft = get_this_nft(num_trait_lines, traits_list)
        save_image(n, this_nft)


def main():

    num_trait_lines = get_config("NUM_TRAIT_LINES")
    final_dir = get_config("FINAL_DIR")
    num_edition = get_config("NUM_EDITION")

    create_dest_dir(final_dir)
    traits_list = get_traits_list(num_trait_lines)

    generate_nfts(num_edition, num_trait_lines, traits_list)


if __name__ == "__main__":
    main()

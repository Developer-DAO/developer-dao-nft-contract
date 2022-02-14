/**
 *Submitted for verification at Etherscan.io on 2021-08-27
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "base64-sol/base64.sol";

// ReentryGuard protects B from accessing A until A is finished

contract Dev is ERC721Enumerable, ReentrancyGuard, Ownable {

        string[] private osses = [
        "Kali Linux",
        "Ubuntu",
        "Windows 1.0",
        "Android Marshmallow",
        "Windows 95",
        "FreeBSD",
        "Slackware Linux",
        "Chromium OS",
        "Windows Vista",
        "Google Chrome OS",
        "macOS",
        "DOS",
        "Linux Mint",
        "GM-NAA I/O"
    ];
    
    string[] private texteditors = [
        "VS Code",
        "Brackets",
        "VIM",
        "Emacs",
        "Brackets",
        "Atom",
        "Notepad++",
        "Pen and Paper",
        "Visual Studio",
        "Sand and Stick",
        "Mental Telepathy",
        "Bluefish",
        "Sublime Text",
        "Dreamweaver",
        "Coda"
    ];
    
    string[] private clothing = [
        "Black Hoodie",
        "White Tanktop",
        "Patagonia Vest",
        "Conference T",
        "Blacked Out",
        "Bulls Jersey",
        "Pink Hoodie",
        "Purple Turtleneck",
        "Bra",
        "Navy Suit",
        "Purple Dress",
        "Platinum Trenchcoat",
        "Bubble Gum Wrapper",
        "Sweat"
    ];
    
    string[] private languages = [
        "TypeScript",
        "JavaScript",
        "Python",
        "Fortran",
        "COBOL",
        "Go",
        "Rust",
        "Swift",
        "PHP",
        "Haskell",
        "Scala",
        "Dart",
        "Java",
        "Julia",
        "C",
        "Kotlin",
        "Velato",
        "ArnoldC",
        "Shakespeare",
        "Piet",
        "Brainfuck",
        "Chicken",
        "Legit",
        "Whitespace"
    ];
    
    string[] private industries = [
        "Government",
        "Black Hat",
        "White Hat",
        "Nonprofit",
        "Money Laundering",
        "Crypto",
        "FAANG",
        "AI Startup",
        "VR",
        "Traveling Consultant",
        "Undercover",
        "Farming",
        "Environmental",
        "Hollywood",
        "Influencer"
    ];
    
    string[] private locations = [
        "Bucharest",
        "Hong Kong",
        "Jackson",
        "Budapest",
        "Sao Paulo",
        "Lagos",
        "Omaha",
        "Gold Coast",
        "Paris",
        "Tokyo",
        "Shenzhen",
        "Saint Petersburg",
        "Buenos Aires",
        "Kisumu",
        "Ramallah",
        "Goa",
        "London",
        "Pyongyang"
    ];
    
    string[] private minds = [
        "Abstract",
        "Analytical",
        "Creative",
        "Concrete",
        "Critical",
        "Convergent",
        "Divergent",
        "Anarchist"
    ];
    
    string[] private vibes = [
        "Optimist",
        "Cosmic",
        "Chill",
        "Hyper",
        "Kind",
        "Hater",
        "Phobia",
        "Generous",
        "JonGold"
    ];
    
    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }
    
    function getOS(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "OS", osses);
    }
    
    function getTextEditor(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "TEXTEDITOR", texteditors);
    }
    
    function getClothing(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "CLOTHING", clothing);
    }
    
    function getLanguage(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "LANGUAGE", languages);
    }

    function getIndustry(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "INDUSTRY", industries);
    }
    
    function getLocation(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "LOCATION", locations);
    }
    
    function getMind(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "MIND", minds);
    }
    
    function getVibe(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "VIBE", vibes);
    }
    
    function pluck(uint256 tokenId, string memory keyPrefix, string[] memory sourceArray) internal pure returns (string memory) {
        uint256 rand = random(string(abi.encodePacked(keyPrefix, toString(tokenId))));
        string memory output = sourceArray[rand % sourceArray.length];
        return output;
    }

    function tokenURI(uint256 tokenId) override public view returns (string memory) {
        string[19] memory parts;
        parts[0] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: black; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="white" /><text x="10" y="20" class="base">';

        parts[1] = getOS(tokenId);

        parts[2] = '</text><text x="10" y="40" class="base">';

        parts[3] = getTextEditor(tokenId);

        parts[4] = '</text><text x="10" y="60" class="base">';

        parts[5] = getClothing(tokenId);

        parts[6] = '</text><text x="10" y="80" class="base">';

        parts[7] = getLanguage(tokenId);

        parts[8] = '</text><text x="10" y="100" class="base">';

        parts[9] = getIndustry(tokenId);

        parts[10] = '</text><text x="10" y="120" class="base">';

        parts[11] = getLocation(tokenId);

        parts[14] = '</text><text x="10" y="140" class="base">';

        parts[15] = getMind(tokenId);

        parts[16] = '</text><text x="10" y="160" class="base">';

        parts[17] = getVibe(tokenId);

        parts[18] = '</text></svg>';

        string memory output = string(abi.encodePacked(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7], parts[8]));
        output = string(abi.encodePacked(output, parts[9], parts[10], parts[11], parts[12], parts[13], parts[14], parts[15], parts[16], parts[17], parts[18]));
        
        string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "Dev #', toString(tokenId), '", "description": "Developers around the world are tired of working and contributing their time and effort to enrich the top 1%. Join the movement that is community owned, building the future from the bottom up.", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)), '"}'))));
        output = string(abi.encodePacked('data:application/json;base64,', json));

        return output;
    }

    function claim(uint256 tokenId) public nonReentrant {
        require(tokenId > 0 && tokenId < 7778, "Token ID invalid");
        _safeMint(_msgSender(), tokenId);
    }
    
    function ownerClaim(uint256 tokenId) public nonReentrant onlyOwner {
        require(tokenId > 7777 && tokenId < 8001, "Token ID invalid");
        _safeMint(owner(), tokenId);
    }
    
    function toString(uint256 value) internal pure returns (string memory) {
    // Inspired by OraclizeAPI's implementation - MIT license
    // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
    
    constructor() ERC721("Devs for Revolution", "DEVS") Ownable() {}
}

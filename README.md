# Developer DAO NFT Contract

## Requirements

- NVM or NodeJS `v14.17.6`

## Local Setup

### Ensure Correct Node Version

Make sure you're on the correct version of NodeJS:

```bash
nvm install;
```

### Install Dependencies

Make sure you're in the `hh` directory:

```bash
cd hh;
yarn;
```

## Running Local Tests

This will use the `hardhat.config.local.js` and run the tests in the `hh/test` folder.

```bash
yarn test:local;
```

## Running Docker

### Building Docker Image

This will build your local docker container image for local

```bash
# make sure you're in the project root, _NOT_ in hh
docker build . -t devdaolocal;
```

### Running Docker Image

**NOTE:** This is still a WIP and still needs to be finalized

```bash
docker run -it -d -p 8545:8545 --name devdao devdaolocal;
```

To remove docker:

```bash
docker rm -f devdao;
```



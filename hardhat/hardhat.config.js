require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();
  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

const pk = process.env.dapk

module.exports = {
  solidity: "0.8.4",
  networks: {
    hardhat: {},
    rinkeby: {
      url: "https://rinkeby.infura.io/v3/7228b494adf94a63bab07ea737183033",
      accounts: [`0x${pk}`]
    },
    mainnet: {
      url: "https://mainnet.infura.io/v3/7228b494adf94a63bab07ea737183033",
      accounts: [`0x${pk}`]
    }
  },
};

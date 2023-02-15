require('dotenv').config();
require("@nomiclabs/hardhat-ethers");
import "@nomicfoundation/hardhat-toolbox";
import { HardhatUserConfig } from "hardhat/config";
const { API_URL, PRIVATE_KEY } = process.env;

const config: HardhatUserConfig = {
	solidity: "0.8.9",
	networks: {
		hardhat: {},
		polygon: {
			url: API_URL,
			accounts: [`0x${PRIVATE_KEY}`]
		}
	}
};

export default config;

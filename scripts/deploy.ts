import { ethers } from "hardhat";

async function main() {

	const nameNFT = "";
	const symbolNFT = ""


	const NFTFractional = await ethers.getContractFactory("NFTFractional");
	const instance = await NFTFractional.deploy(nameNFT, symbolNFT);

	await instance.deployed();

	console.log(`deployed to ${instance.address}`);
}

main()
	.catch((error) => {
		console.error(error);
		process.exitCode = 1;
	});
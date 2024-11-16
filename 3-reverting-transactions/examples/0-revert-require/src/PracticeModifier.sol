// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Goal: Require Owner
// You'll notice that the onlyOwner modifier has been added to each of the configuration functions in this contract. Only problem is, it doesn't currently do anything!
// Update the onlyOwner modifier to require that only the owner address can call these functions without reverting.


contract Contract {
	uint configA;
	uint configB;
	uint configC;
	address owner;

	constructor() {
		owner = msg.sender;
	}

	function setA(uint _configA) public onlyOwner {
		configA = _configA;
	}

	function setB(uint _configB) public onlyOwner {
		configB = _configB;
	}

	function setC(uint _configC) public onlyOwner {
		configC = _configC;
	}

	modifier onlyOwner {
		// TODO: require only the owner access
        require(msg.sender == owner, "Caller is not the owner");

		// TODO: run the rest of the function body
        _;
	}
}

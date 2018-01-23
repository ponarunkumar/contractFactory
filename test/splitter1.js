var Splitter1 = artifacts.require("./Splitter.sol");

contract ('Splitter1', function(accounts) {
	beforeEach( () => 
		Splitter1.new(_receipient1, _receipient2, {from: _contractOwner})
		.then(instance => instance.contract 
	);

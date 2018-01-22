pragma solidity ^0.4.6;

contract Splitter1 {
    address public owner;
    mapping(address => uint) public balances;
    
    event LogContractOwner(address _owner);
    event LogSenderReceivers(address indexed _sender, address indexed _receiver1, address indexed _receiver2, uint _shareAmount, uint _changeAmount);
    
    function Splitter1() public payable {
        owner = msg.sender;
        LogContractOwner(owner);
    }
    
    function share(address _receiver1, address _receiver2) public payable returns(bool success) {
	require(_receiver1 !=0 && _receiver2 !=0);
        require(msg.value>0);
        uint _shareAmount = msg.value/2;  
        uint _changeAmount = msg.value%2;
        balances[_receiver1] += _shareAmount;
        balances[_receiver2] += _shareAmount;
        if(_changeAmount>0) {
                    balances[msg.sender] += _changeAmount;
        }
        LogSenderReceivers(msg.sender, _receiver1, _receiver2, _shareAmount, _changeAmount);
        return true;
    }
    
}

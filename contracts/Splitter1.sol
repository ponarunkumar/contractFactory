pragma solidity ^0.4.6;

contract Splitter1 {
    address public owner;
    mapping(address => uint) public balances;
    
    event LogContractOwner(address _owner);
    event LogSenderReceivers(address _sender, address _receiver1, address _receiver2);
    
    function Splitter1() public payable {
        owner = msg.sender;
        LogContractOwner(owner);
    }
    
    function share(address _receiver1, address _receiver2) public payable returns(bool success) {
        require(msg.value>0);
        uint _shareAmount = msg.value/2;  
        uint _changeAmount = msg.value%2;
        balances[_receiver1] += _shareAmount;
        balances[_receiver2] += _shareAmount;
        if(_changeAmount>0) {
                    balances[msg.sender] += _changeAmount;
        }
        LogSenderReceivers(msg.sender, _receiver1, _receiver2);
        return true;
    }
    
}

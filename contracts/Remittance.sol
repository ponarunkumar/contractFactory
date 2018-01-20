pragma solidity^0.4.6;

contract Remittance {
    address owner;
    address exchangeOwner;
    mapping(address=>uint) balances;
    
    struct Receipient {
        address account;
        string localCurrency;
        uint amountInEtherToReceive;
    }
    
    event LogContractOwner(address sender);
    
    Receipient[] public receipient;
    
    function Remittance() public {
        owner = msg.sender;
        LogContractOwner(msg.sender);
    }
    
    function compareStrings(string _a, string _b) constant returns (bool success){
        return keccak256(_a) == keccak256(_b);
    }
    
    function remitTo(address _receipient, string _localCurrency) public payable returns(bool success){
        require(msg.value > 0);
        Receipient memory amountReceiver;
        amountReceiver.account = _receipient;
        amountReceiver.localCurrency = _localCurrency;
        amountReceiver.amountInEtherToReceive = msg.value;
        receipient.push(amountReceiver);
        return true;
    }
    
    function depositTo() public returns (bool success) {
        uint _amountInLocalCurrency;
        uint conversionRate;
        for(uint i=0;i<=receipient.length;i++) {
            if(compareStrings(receipient[i].localCurrency, "USD"))
            {
                _amountInLocalCurrency = receipient[i].amountInEtherToReceive * conversionRate;
            }
        }
    }
    
}

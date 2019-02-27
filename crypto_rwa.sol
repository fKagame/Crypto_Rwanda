pragma solidity >=0.4.21 < 0.6.0;
contract Crypto_Rwa{
	string public name = "Crypto_Rwanda";
	string public symbol = "CRwa";
	string public standard = "Crypto_Rwanda v1.0";
	uint256 public totalSupply;
	
	mapping(address => uint256) public balanceOf;
	mapping(address => mapping(address => uint256)) public allowance;
	
	constructor(uint256 initialSupply) public{
	balanceOf[msg.sender] = initialSupply;
	totalSupply = initialSupply;
	}
	
	function transfer(address to, uint256 value) public returns(bool){
		require(balanceOf[msg.sender] >= value);		
		balanceOf[msg.sender] -= value;
		balanceOf[to] += value;
		emit Transfer(msg.sender, to, value);		
		return true;		
	}
	function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
	function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
	event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );	
	
}
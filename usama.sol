 // SPDX-License-Identifier: MIT
pragma solidity 0.8.22;
contract usama{
event Transfer(address  indexed to ,address indexed  from , uint256 amount);
// function token(address to, uint256 )public  {
//     emit newtoken(to, msg.sender,amount);
 
// } 
event Approval(address indexed owner , address indexed spender , uint256 amount);

address public _owner;
string public name="ruman";
string public symbol="RM";
uint256 public Tsupply;
mapping (address => uint256) public balanceOf;
mapping (address => mapping (address => uint256))public allowance;

modifier Onlyowner(){
    require( _owner == msg.sender,"Only the owner can run this contract");
    _;
}

constructor(address owner){
    _owner=owner;
    // mint(msg.sender, 100*10**18);
}
function mint (address to,uint amount)public Onlyowner {
    Tsupply += amount * 10**18;
    balanceOf[to] +=amount * 10**18;
    emit Transfer(address(0), to, amount);
}

function transfer(address _to,uint256 _amount)public returns(bool){
    require(balanceOf[msg.sender]>=_amount,"Failure")
    ;
    balanceOf[msg.sender]-=_amount * 10**18;
    balanceOf[_to] +=_amount * 10**18;
    emit Transfer(msg.sender, _to, _amount);
    return true;

}
function approve(address spender, uint256 amount) public returns (bool) {
    allowance[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return true;
}


function transferFrom(address _from, uint256 _amount) public returns (bool) {
    require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
    require(_amount <= allowance[_from][msg.sender], "Allowance exceeded");
    balanceOf[msg.sender] -= _amount;
    balanceOf[_from] += _amount;
    allowance[_from][msg.sender] -= _amount;
    emit Transfer(msg.sender, _from, _amount);
    return true;
}



}
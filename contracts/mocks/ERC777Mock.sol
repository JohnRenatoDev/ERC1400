pragma solidity ^0.5.0;
import "../token/ERC777/ERC777Mintable.sol";


contract ERC777Mock is ERC777Mintable {

  constructor(
    string memory name,
    string memory symbol,
    uint256 granularity,
    address[] memory controllers,
    address certificateSigner
  )
    public
    ERC777(name, symbol, granularity, controllers, certificateSigner)
  {
  }

  function setControllable(bool _controllable) external onlyOwner {
    _isControllable = _controllable;
  }

  function renounceControl() external onlyOwner {
    _isControllable = false;
  }

  function setControllers(address[] calldata operators) external onlyOwner {
    _setControllers(operators);
  }

  function isRegularAddress(address adr) external view returns(bool) {
    return _isRegularAddress(adr);
  }

  function operatorBurnMock(address from, uint256 value, bytes calldata data, bytes calldata operatorData) external {
    _burn("", msg.sender, from, value, data, operatorData);
  }

}

pragma solidity ^0.5.0;

import "./ERC777.sol";
import "openzeppelin-solidity/contracts/access/roles/MinterRole.sol";


/**
 * @title ERC777Mintable
 * @dev ERC777 issuance logic
 */
contract ERC777Mintable is ERC777, MinterRole {

  /**
   * [NOT MANDATORY FOR ERC777 STANDARD]
   * @dev Mint the amout of tokens for the recipient 'to'.
   * @param to Token recipient.
   * @param value Number of tokens issued.
   * @param data Information attached to the issuance, by the token holder. [CONTAINS THE CONDITIONAL OWNERSHIP CERTIFICATE]
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address to, uint256 value, bytes calldata data)
    external
    isValidCertificate(data)
    onlyMinter
    returns (bool)
  {
    _mint("", msg.sender, to, value, data, "");

    return true;
  }

}

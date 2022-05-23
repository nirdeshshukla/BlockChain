pragma solidity ^0.4.17;

contract EVoting{
  address public owner;
  uint public completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function EVoting() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    EVoting upgraded = EVoting(new_address);
    upgraded.setCompleted(completed_migration);
  }
}
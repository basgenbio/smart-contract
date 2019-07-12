pragma solidity >=0.5.0 <0.6.0;


contract Migrations {
    address public owner;
    uint public last_completed_migration; // solium-disable-line mixedcase

    constructor() public {
        owner = msg.sender;
    }

    modifier restricted() {
        require(msg.sender == owner);
        _;
    }

    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted { // solium-disable-line mixedcase
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}

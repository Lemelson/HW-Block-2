pragma solidity ^0.8.0;

contract Storage {
    struct Item {
        uint id;
        string name;
        uint quantity;
        uint timestamp;
    }

    mapping(uint => Item) public items;

    event ItemAdded(uint indexed id, string name, uint quantity, uint timestamp);
    event ItemRemoved(uint indexed id);

    function addItem(uint _id, string memory _name, uint _quantity, uint _timestamp) public {
        Item memory newItem = Item(_id, _name, _quantity, _timestamp);
        items[_id] = newItem;
        emit ItemAdded(_id, _name, _quantity, _timestamp);
    }

    function removeItem(uint _id) public {
        delete items[_id];
        emit ItemRemoved(_id);
    }
}

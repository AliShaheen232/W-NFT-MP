// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Ownable {
    // _owner is the owner of the Token
    address private _owner;

    /**
     * Event OwnershipTransferred is used to log that a ownership change of the token has occured
     */
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

     modifier onlyOwner() {
        require(
            _owner == msg.sender,
            "Ownable: only owner can call this function"
        );
        // This _; is not a TYPO, It is important for the compiler;
        _;
    }

    constructor() {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    /**
     * @notice owner() returns the currently assigned owner of the Token
     *
     */
    function owner() public view returns (address) {
        return _owner;
    }

    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @notice transferOwnership will assign the {newOwner} as owner
     *
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @notice _transferOwnership will assign the {newOwner} as owner
     *
     */
    function _transferOwnership(address newOwner) internal {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}
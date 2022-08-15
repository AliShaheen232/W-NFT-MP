// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ownable.sol"; // compiler version changed to 0.8.4
import "./ERC20.sol";

contract Charles is ERC20, Ownable {
    constructor() ERC20("Charles", "CHR") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}  
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

/**
    @title Does viewing an immutable require a SLOAD? 
 */

contract Parent {
    uint256 immutable a;
    constructor(uint256 _a) public{
        a = _a;
    }
    // No, we still can't use `pure` yet.
    function viewParent() external view returns(uint256){
        return a;  // No SLOAD
    }
}
contract Child is Parent{
    constructor(uint256 _a) Parent(_a) public{}
    
    function viewChild() external view returns(uint256){
        return a; // No SLOAD
    }
}

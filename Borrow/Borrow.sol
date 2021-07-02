/**
 * Created on 2021-07-01 12:56
 * @summary: 
 * @author: abhijit
 */
pragma solidity ^0.8.0

/**
 * @title: 
 */
contract Borrow {
    address owner;
    uint256 fund;          // storage
    mapping(address => uint256) public amountBorrowed;          // storage

    /*
    	check if automatic initialization happens
    */
    constructor() public {
        owner = msg.sender;
        fund = 0;
    }


    /**
     * @dev: 
     * @param qty
     */
    function depositFund(uint256 qty) public payable {
        // can only accessed by contract owner
        require(owner == msg.sender, "fund can only be deposited by the contract owner.");

        // update the fund balance in storage
        fund += qty;


    }

    /**
     * @dev: 
     * @param borrower
     * @param qty
     */
    function borrowMoney(address borrower, uint256 qty) public {
        // permission by borrower
        require(msg.sender == borrower, "permission only granted by the borrower itself.");

        // can only be done by non-owner of contract
        require(borrower != owner, "fund can only be borrowed by the customer.");

        require(qty > 0, "quantity requested has to be positive");
        require(qty < fund, "quantity requested must be less than or equal to the fund balance");

        // reduce the fund balance by borrowed amount
        amountBorrowed[borrower] += qty;

        /*
		transfer the quantity to the borrower address
        using event
        */

    }






    // Utility functions

}
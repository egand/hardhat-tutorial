pragma solidity ^0.8.13;

contract Token {
    // The `public` modifier makes a variable readable from outside the contract.
    string public name = "My Hardhat Token";
    string public symbol = "MHT";

    // The fixed amount of tokens stored in an unsigned integer type variable.
    uint256 public totalSupply = 1000000;

    // An address type variable is used to store ethereum accounts.
    address public owner;

    // A mapping is a key/value map. Here we store each account balance
    mapping(address => uint256) balances;

    constructor() {
        // The totalSupply is assigned to transaction sender, which is the account
        // that is deploying the contract.
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    /**
     * A function to transfer tokens.
     *
     */
    // the external modifier makes a function only callable from outside the contract
    function transfer(address to, uint256 amount) external {
        // Check if the transaction sender has enough tokens.
        // If `require`'s first argument evaluates to `false` then the
        // transaction will revert.
        require(balances[msg.sender] >= amount, "Not enough tokens");

        // transfer the amount
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    // The `view` modifier indicates that it doesn't modify the contract's
    // state, which allows us to call it without executing a transaction.
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}
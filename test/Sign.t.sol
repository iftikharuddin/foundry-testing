pragma solidity ^0.8.18;

import "forge-std/Test.sol";

contract SignTest is Test {
    // private key = 123
    // public key = vm.addr(private key)
    // message = "secret message"
    // message hash = keccak256(message)
    // vm.sign(private key, message hash)
    function testSignature() public {
        uint256 privateKey = 123;
        // Computes the address for a given private key.
        address ifti = vm.addr(privateKey); // get the public key

        // Test valid signature
        bytes32 messageHash = keccak256("Signed by Iftikhar");

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privateKey, messageHash);
        address signer = ecrecover(messageHash, v, r, s);

        assertEq(signer, ifti);

        // Test invalid message
        bytes32 invalidHash = keccak256("Not signed by ifti");
        signer = ecrecover(invalidHash, v, r, s);

        assertTrue(signer != ifti);
    }
}
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Array {
    uint256 public arrayCount; // keccak256(arrayCount) can be the starting storage of each array
    function makeArray(bytes32[] calldata elements) external view returns (bytes32) {
        assembly {
            //calculate keccak256 of arrayCount;
                // read storage 0's value
                // put the value to memory
                // hash it
            let arrayCountRead := sload(0)
            mstore(0, arrayCountRead)
            let offsetStorage := keccak256(0, 0x20)
            let fmp := mload(0x40)
            //let's try to return offsetStroage
            // mstore(fmp, offsetStorage)
            // return(fmp, 0x20)
            // ok it worked

            //let's check calldataLength
            // mstore(fmp, elements.length)
            // return(fmp, 0x20)
            //ok it worked

            //let's check what's in calldata
            mstore(fmp, calldataload(0))
            return(add(fmp, 0x80), 0x20)

            // return(fmp, 0x20)
            //first 32 bytes show   
            // 0xb3a93cc500000000000000000000000000000000000000000000000000000000
            // which is fn signature

// ["0x3000000000000000000000000000000000000000000000000000000000000000", "0x3000000000000000000000000000000000000000000000000000000000000000", "0x3000000000000000000000000000000000000000000000000000000000000000"]
            // return(add(fmp, 0x20), 0x20)
            //second 32 bytes show 
            // 0x0000000000000000000000000000000000000000000000000000000000000000

            // return(add(fmp, 0x40), 0x20)
            //second 32 bytes show 
            // 0x0000000000000000000000000000000000000000000000000000000000000000

        }
    }
}

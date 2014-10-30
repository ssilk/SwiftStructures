//
//  HashTable.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


class HashTable {
    
    private var bucket: Array<HashNode!>
    
    
    //initialize the bucket with nil values
    init(capacity: Int) {
        self.bucket = Array<HashNode!>(count: capacity, repeatedValue:nil)
        
    }

    
    //add the key using the specified hash
    func addWord(firstname: String, lastname: String) {
        
        var hashindex: Int!
        var fullname: String!
        
        
        //create a hashvalue using the complete name
        fullname = firstname + lastname
        hashindex = self.createHash(fullname)
        
        
        var childToUse: HashNode = HashNode()
        var head: HashNode!
        
        
        childToUse.firstname = firstname
        childToUse.lastname = lastname
        
        
        //check for an existing list
        if (bucket[hashindex] == nil) {
            bucket[hashindex] = childToUse
        }
        
        else {
            
            println("a collision occured. implementing chaining..")
            head = bucket[hashindex]
            
            
            //append new item to the head of the list
            childToUse.next = head
            head = childToUse
            
            
            //update the chained list
            bucket[hashindex] = head
        }

        
    } //end function
    
    
    
    //return the hash value to be used
    func createHash(fullname: String) -> Int! {
        
        var remainder: Int = 0
        var divisor: Int = 0
        

        for key in fullname.unicodeScalars {
            println("the ascii value of \(key) is \(key.value)..")
            divisor += Int(key.value)
        }
        
        /*
        note: modular math is used to calculate a hash value. The bucket count is used
        as the dividend to ensure all possible outcomes are between 0 and 25. This is an example
        of a simple but effective hash algorithm.
        */
        
        remainder = divisor % bucket.count
        

        return remainder - 1
    }
    
    
}
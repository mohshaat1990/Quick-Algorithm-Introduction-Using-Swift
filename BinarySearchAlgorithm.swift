//
//  BinarySearchAlgorithm.swift
//  
//
//  Created by Mohamed Shaat on 3/15/19.
//

import Foundation

func binarySearch<T: Comparable>(_ a:[T],key: T,range: Range<Int>) -> Int? {
    
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex+1 ..< range.upperBound)
        } else {
            return midIndex
        }
    }
    
}

var x = binarySearch([1,2,3,4,5,6], key: 6, range: 0 ..< [1,2,3,4,5,6].count )

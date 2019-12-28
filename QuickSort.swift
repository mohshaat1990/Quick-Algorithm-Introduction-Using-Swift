//
//  QuickSort.swift
//  
//
//  Created by Mohamed Shaat on 3/16/19.
//

import Foundation

func quickSort<T: Comparable>(array: [T]) -> [T] {
    
    if array.isEmpty{ return[]}
    let first = array.first!
    let smallerOrEqual = array.dropFirst().filter{ $0 <= first }
    let larger = array.dropFirst().filter{ $0 > first }
    return quickSort(array: smallerOrEqual) + [first] + quickSort(array:larger)
    
}

let result = quickSort(array:[1,5,6,7,8,9,10])
print(result)

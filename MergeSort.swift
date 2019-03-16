//
//  MergeSort.swift
//  
//
//  Created by Mohamed Shaat on 3/16/19.
//

import Foundation

public class MergeSort <Element: Comparable> {
    
    public func mergeSort(_ array: [Element])-> [Element]{
        /* Recursion needs a base case, which you can also think of as an
         “exit condition”. In this case, the base case is when the array only
         has one element. */
        print(array)
        guard array.count > 1 else {
            return array
        }
        /*
         You’re now calling mergeSort on the left and right halves of the
         original array. As soon as you’ve split the array in half, you’ll try
         to split again.
         */
        let middle = array.count / 2
        let left = mergeSort(Array(array[..<middle ]))
        let right = mergeSort(Array(array[middle...]))
        return merge(left, right)
    }
    
    func merge(_ left: [Element], _ right: [Element] ) -> [Element]{
        /*
         The leftIndex and rightIndex variables track your progress as
         you parse through the two arrays.
         */
        var leftIndex = 0
        var rightIndex = 0
        // The result array will house the combined array.
        var result: [Element] = []
        /*
         Starting from the beginning, you compare the elements in the
         left and right arrays sequentially. If you’ve reached the end of
         either array, there’s nothing else to compare.
         */
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            /*
             The smaller of the two elements goes into the result array. If the
             elements were equal, they can both be added.
             */
            if leftElement <= rightElement {
                result.append(leftElement)
                leftIndex += 1
            }
            if leftElement >= rightElement {
                result.append(rightElement)
                rightIndex += 1
            }
        }
        // append the rest to result array
        if leftIndex < left.count {
            result.append(contentsOf: left[leftIndex...])
        }
        if rightIndex < right.count {
            result.append(contentsOf: right[rightIndex...])
        }
        return result
    }
    
}


let mergeSort = MergeSort<Int>()
let arr = mergeSort.mergeSort([1,5,6,4,2,-1])
print(arr)

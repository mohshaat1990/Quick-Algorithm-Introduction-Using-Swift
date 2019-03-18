//
//  SelectionSort.swift
//  
//
//  Created by Mohamed Shaat on 3/19/19.
//

import Foundation

func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array}
    var a = array
    for x in 0 ..< a.count - 1 {
        var lowest = x
        for y in x + 1 ..< a.count {
          if a[y] < a[lowest] {
            lowest = y
          }
        }
        if x != lowest {
         a.swapAt(x, lowest)
        }
    }
    return a
}

let a = selectionSort([ 5, 8, 3, 4, 6 ])
print(a)

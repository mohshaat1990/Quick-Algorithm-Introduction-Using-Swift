//
//  InsertionSort.swift
//  
//
//  Created by Mohamed Shaat on 3/19/19.
//

func insertionSort(_ array: [Int]) -> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        while y > 0 && a[y] < a[y-1] {
            a.swapAt(y - 1,y)
            y -= 1
        }
    }
    return a
}

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
let arr = insertionSort(list)
print(arr)

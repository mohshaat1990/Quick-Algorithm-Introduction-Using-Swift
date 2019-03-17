# Algorithm Quick Introduction

- ## Introduction 

- ## How to Calclaute Big (O) notation

- ## Divide-and-Conquer

- ## Divide-and-Conquer( Binary Search )

- ## Divide-and-Conquer(  Merge Sort )

- ## Divide-and-Conquer(  Quick Sort )

-  ## Insertion Sort

- ## Heap Sort

- ## Bubble Sort

- ## The Greedy Approach

- ## Dynamic Programming


# Introduction ( algorithms :Efficiency analysis, and Order )

- regardless of how fast computers become or how cheap memory gets , efficiency will always remain an important consideration . if you try to find name "colleen" in the phone book one approach is to check each name in sequence starting with the first name until you find this Name but there is another effective approach is binary search that takes the advantages of the fact that the names in the phone book are sorted and opens the book to where he thinks the C 's are located , if it goes too far into the book , he thumbs back alittle , he continues thumbing back and forth until he locates the page containing "colleen" .

- the time complexity is the computational complexity that describes the amount of time it takes to run an algorithm. Time complexity is commonly estimated by counting the number of elementary operations performed by the algorithm, supposing that each elementary operation takes a fixed amount of time to perform.

-  worst-case time complexity, which is the maximum amount of time required for inputs of a given size.
- average-case complexity, which is the average of the time taken on inputs of a given size (this makes sense because there are only a finite number of possible inputs of a given size). 
-  the time complexity is commonly expressed using big O notation, O(n) , O(nlogn) ,---

# How to Calclaute Big (O) notation

## O(1)

- This function runs in O(1) time (or "constant time") relative to its input. The input array could be 1 item or 1,000 items, but this function would still just require one step.

```swift
func getItemInArray(arr:[String],idex:Int) {
 print("%@",arr[idex])
}
```
## O(n)

- This function runs in O(n) time (or "linear time"), where n is the number of items in the array. If the array has 10 items, we have to print 10 times. If it has 1000 items, we have to print 1000 times.
```swift
func getItemsInArray(arr:[String]) {
 for item in arr {
  print("%@",item)
 }
}
```
## O(n2)

- Here we're nesting two loops. If our array has n items, our outer loop runs n times and our inner loop runs n times for each iteration of the outer loop, giving us n2 total prints. Thus this function runs in O(n2) time (or "quadratic time"). If the array has 10 items, we have to print 100 times. If it has 1000 items, we have to print 1000000 times.

```swift
func printAllPossibleOrderPairs(arr:[String]) {
  for item1 in arr {
    for item2 in arr {
     print("%@ %@ \n",item1,item2)
   }
 }
}
```
- you should drop  the constants When you're calculating the big O complexity of something, you just throw out the constants.This is O(2n), which we just call O(n).
```swift
func PrintArrayTwice(arr:[String]) {
  for item1 in arr {
   print("%@",item1)
  }
  for item2 in arr {
   print("%@",item2)
  }
 }
}
```
- Drop the less significant terms Here our runtime is O(n + n2), which we just call O(n2).

```swift
func printAllNumbersThenAllPairSums(arr:[String]) {
 for item1 in arr {
  for item2 in arr {
   print("%@ %@ \n",item1,item2)
  }
 }
 for item2 in arr {
  print("%@",item2)
 }
}
```
- With Big-O, we're usually talking about the "worst case" In general we'd say this is O(n) runtime and the "worst case" part would be implied. But to be more specific we could say this is worst case O(n) and best case O(1) runtime.

```swift
func findMatch(arr:[String])-> Bool {
 for item in arr {
  if item == "a" {
   return  true
  }
 }
 return false
}
```
----
- # Divide-and-Conquer

- is patterned after the brilliant strategy employed by the french emperor Napoleon in Battle . Napoleon drove against their center and split their forces in two and then divide these two small armies and conguer this small armies that is it divides an instance of problem into two or more smaller instances . the smaller instances are usually instances of the original problem. if solutions to the smaller instances can be obtained readily the solution to the original instance can be obtained by the combining these solutions. we now introduces the divide and conguer approach with examples starting with binary search .

![Screen Shot 2019-03-15 at 10 15 37 PM](https://user-images.githubusercontent.com/11280137/54459632-e460c580-476f-11e9-84ec-330eca65206c.png)

- # Divide-and-Conquer( Binary Search )

- Binary Search locates a key x in a sorted (nondecreasing order) array by first comparing x with the middle item of the array. If they are equal, the algorithm is done.
-  If not, the array is divided into two subarrays, one containing all the items to the left of the middle item and the other containing all the items to the right. If x is smaller than the middle item, this procedure is then applied to the left subarray. Otherwise, it is applied to the right subarray. That is, x is compared with the middle item of the appropriate subarray. If they are equal, the algorithm is done. If not, the subarray is divided in two. This procedure is repeated until x is found or it is determined that x is not in the array.

 - The steps of Binary Search can be summarized as follows.
 
 - (1) If x equals the middle item, quit. Otherwise:
 
 - (2) Divide the array into two subarrays about half as large. If x is smaller than the middle item, choose the left subarray. If x is larger than the middle item, choose the right subarray.
 
- (3) Conquer (solve) the subarray by determining whether x is in that subarray. Unless the subarray is sufficiently small, use recursion to do this.
- (4) Obtain the solution to the array from the solution to the subarray.

![linear-vs-binary-search-best-case](https://user-images.githubusercontent.com/11280137/54461083-3efc2080-4774-11e9-819e-71c910c72300.gif)

![linear-vs-binary-search-worst-case](https://user-images.githubusercontent.com/11280137/54461168-7d91db00-4774-11e9-908e-8d1faa6e9025.gif)

- Binary Search Time Complexity O( Logn ) 

```swift
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
```
- # Divide-and-Conquer( Merge Sort )

- A process related to sorting is merging. By two-way merging we mean combining two sorted arrays into one sorted array. By repeatedly applying the merging procedure, we can sort an array. For example, to sort an array of 16 items, we can divide it into two subarrays, each of size 8, sort the two subarrays, and then merge them to produce the sorted array. In the same way, each subarray of size 8 can be divided into two subarrays of size 4, and these subarrays can be sorted and merged. Eventually, the size of the subarrays will become 1, and an array of size 1 is trivially sorted. This procedure is called “Mergesort.” Given an array with n items (for simplicity, let n be a power of 2), Mergesort involves the following steps:

1. Divide the array into two subarrays each with n/2 items.

2. Conquer (solve) each subarray by sorting it. Unless the array is sufficiently small, use recursion to do this.

3. Combine the solutions to the subarrays by merging them into a single sorted array.

- Merge Sort Time Complexity O(Log n)

![Screen Shot 2019-03-16 at 12 14 08 AM](https://user-images.githubusercontent.com/11280137/54464730-7ec90500-4780-11e9-9305-aff60d70a51f.png)

![Merge-sort-example-300px](https://user-images.githubusercontent.com/11280137/54464790-c6e82780-4780-11e9-845a-e3f48d76034b.gif)

```swift
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
```
- # Divide-and-Conquer(Quicksort)

-  Quicksort is similar to Mergesort in that the sort is accomplished by dividing the array into two partitions and then sorting each partition recursively. 
-  In Quicksort, however, the array is partitioned by placing all items smaller than some pivot item before that item and all items larger than the pivot item after it. 
- The pivot item can be any item, and for convenience we will simply make it the first one. 
- time complexity  n*log(n)
 ![Screen Shot 2019-03-16 at 9 13 42 PM](https://user-images.githubusercontent.com/11280137/54480386-8a740480-4830-11e9-89e0-c2eb90261cd3.png)
 
 
 ![Screen Shot 2019-03-16 at 9 15 47 PM](https://user-images.githubusercontent.com/11280137/54480413-c3ac7480-4830-11e9-8ea1-1f582391424e.png)

```swift
func quickSort<T: Comparable>(array: [T]) -> [T] {
/* Every recursive function needs an escape scenario, else it would go to an infinite loop. 
In this case, we want the recursion to break when the array that is passed is empty.*/
if array.isEmpty{ return[]}

// We need to store the first element of the array to compare it with the smaller or larger number

let first = array.first!
let smallerOrEqual = array.dropFirst().filter{ $0 <= first }
let larger = array.dropFirst().filter{ $0 > first }
// The first and second half would then be recursed and added to the first value.
return quickSort(array: smallerOrEqual) + [first] + quickSort(array:larger)

}
let result = quickSort(array:[1,5,6,7,8,9,10])
print(result)
```
# Insertion Sort

- Insertion sort is a simple sorting algorithm that builds the final sorted array (or list) one item at a time.
- It is much less efficient on large  lists than more advanced algorithms such as quicksort, heapsort, or merge sort. However, insertion sort provides several advantages:
- (1) Efficient for (quite) small data sets, much like other quadratic sorting algorithms
- (2) More efficient in practice than most other simple quadratic (i.e., O(n2)) algorithms such as selection sort or bubble sort
- (3) Adaptive, i.e., efficient for data sets that are already substantially sorted: the time complexity is O(kn) when each element in the input is no more than k places away from its sorted position
- (4) Stable; i.e., does not change the relative order of elements with equal keys
- (5) In-place; i.e., only requires a constant amount O(1) of additional memory space

![Insertion-sort-example-300px](https://user-images.githubusercontent.com/11280137/54499060-7c98af00-4916-11e9-9054-3258cbfdb18c.gif)

![insertionsort](https://user-images.githubusercontent.com/11280137/54499145-40b21980-4917-11e9-8be9-061f594581af.png)

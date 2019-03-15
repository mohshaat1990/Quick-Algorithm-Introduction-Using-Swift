# Algorithm Quick Introduction

- ## Introduction 

- ## How to Calclaute Big (O) notation

- ## Divide-and-Conquer

- ## Binary Search

- ## Merge Sort

- ## Quick Sort

-  ## Insertion Sort

- ## Heap Sort

- ## Bubble Sort

- ## Merge Sort

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

- # Binary Search

- Binary Search locates a key x in a sorted (nondecreasing order) array by first comparing x with the middle item of the array. If they are equal, the algorithm is done.
-  If not, the array is divided into two subarrays, one containing all the items to the left of the middle item and the other containing all the items to the right. If x is smaller than the middle item, this procedure is then applied to the left subarray. Otherwise, it is applied to the right subarray. That is, x is compared with the middle item of the appropriate subarray. If they are equal, the algorithm is done. If not, the subarray is divided in two. This procedure is repeated until x is found or it is determined that x is not in the array.

 - The steps of Binary Search can be summarized as follows.
 
 - (1) If x equals the middle item, quit. Otherwise:
 
 - (2) Divide the array into two subarrays about half as large. If x is smaller than the middle item, choose the left subarray. If x is larger than the middle item, choose the right subarray.
 
- (3) Conquer (solve) the subarray by determining whether x is in that subarray. Unless the subarray is sufficiently small, use recursion to do this.
- (4) Obtain the solution to the array from the solution to the subarray.

![linear-vs-binary-search-best-case](https://user-images.githubusercontent.com/11280137/54461083-3efc2080-4774-11e9-819e-71c910c72300.gif)

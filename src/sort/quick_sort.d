/**
*	## Quick sort is a sorting algorithm that belongs to the "divide and conquer" algorithms.
*	It works by choosing a pivot element from the array and dividing it into two subarrays, where one
*	array contains elements less than the pivot, and the other contains elements greater than the pivot, then the arrays 
*	are sorted recursively and later combined together.
*	### Steps to implement the algorithm:
*	1. If the length of the array is less than two, return it since it does not need to be sorted.
*	2. Choose an element that will serve as the pivot.
*	3. Divide the array into two subarrays with elements less than the pivot and elements greater than the pivot.
*	4. Sort and reduce the array until it reduces to the base case.
*/

int[] quick_sort(int[] arr) {
	import std.algorithm : filter; // filter - needed for selecting elements relative to a specific condition.
	import std.array : array; // array - needed to convert computations into a dynamic array. 
	if(arr.length < 2) { // If the array has less than two elements, return it without sorting, this is the base case.		
		return arr;
	}
	// The pivot will be the first element of the array for convenience (but it is important to understand that the pivot affects the algorithm execution speed).
	int prop = arr[0]; 
	int[] less = arr[1..$].filter!(n => n < prop).array; // Filling the array with elements less than the pivot. 
	int[] great = arr[1..$].filter!(n => n >= prop).array; // Filling the array with elements greater than or equal to the pivot.
	return quick_sort(less) ~ prop ~ quick_sort(great); // Recursively sorting the arrays and combining them.
}

unittest {
	int[] arr = [9, 4, 1, 3, 8, 10, 2, 1];
	assert(quick_sort(arr) == [1, 1, 2, 3, 4, 8, 9, 10]);
}

void main() {}

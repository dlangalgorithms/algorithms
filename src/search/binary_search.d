/*
*	Binary search - is a classic algorithm for finding an element
*	in a sorted array, working in O(log n) time.
*	1. First you need to find the middle in the array. The obtained value will
*	be compared with the target.
*	2. If the target is less than the value of the element in the middle, then the search will continue
*	in the first half of the array, otherwise - in the second.
*	3. The search boils down to redefining the value of the middle
*	element in the selected half.
*	4. The search will continue until the target is found or the array
*	becomes empty.
*/

int binarySearch(int[] array, int target) {
	int left = 0;
	int right = cast(int)array.length-1;
	while(left <= right) {
		// Determining the index of the middle element.
		int middle = (left + right) / 2; 
		if(array[middle] > target) {
			right = middle - 1; // Search continues in the first half of the array.
		} else if(array[middle] < target) {
			left = middle + 1; // Search continues in the second half of the array.
		} else if(array[middle] == target) {
			return middle; // Returning the target index.
		}
	}
	return -1; // Failed to find element
}

unittest {
	int[] array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
	assert(binarySearch(array, 3) == 2);
}

void main() {}

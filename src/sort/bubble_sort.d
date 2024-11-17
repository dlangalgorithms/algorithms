import std.stdio;

/**
 * Sorts an array of integers in ascending order using the Bubble Sort algorithm.
 *
 * This algorithm repeatedly steps through the list, compares adjacent elements,
 * and swaps them if they are in the wrong order. The pass through the list is 
 * repeated until the list is sorted.
 *
 * @param arr the array of integers to be sorted
 */
void bubbleSort(int[] arr) {
    // Get the length of the array
    ulong n = arr.length; 

    // Outer loop for each element in the array, except the last one
    for (int i = 0; i < n - 1; i++) {
        // Inner loop for comparing adjacent elements
        // The last i elements are already sorted, so we reduce the range
        for (int j = 0; j < n - 1 - i; j++) {
            // If the current element is greater than the next element, swap them
            if (arr[j] > arr[j + 1]) {
                // Temporary variable to hold the current element during swap
                int temp = arr[j];
                arr[j] = arr[j + 1]; // Assign next element to current position
                arr[j + 1] = temp;   // Assign the temporary variable to next position
            }
        }
    }
}

/*
 TESTS
 */
 unittest{
    int[] data = [64, 34, 25, 12, 22, 11, 90];
    bubbleSort(data);
    assert(data == [11,12,22,25,34,64,90]);
 }


void main() {}
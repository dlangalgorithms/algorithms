import std.stdio;

/*
 * Selection Sort is a comparison-based sorting algorithm.
 * It sorts an array by repeatedly selecting the smallest (or largest) element from the unsorted portion and swapping it with the first unsorted element.
 * This process continues until the entire array is sorted.
 * 
 * 1) First we find the smallest element and swap it with the first element. This way we get the smallest element at its correct position.
 * 2) Then we find the smallest among remaining elements (or second smallest) and move it to its correct position by swapping.
 * 3) We keep doing this until we get all elements moved to correct position.
 *
 * @param arr the array of integers to be sorted
 */
void selection_sort(ulong[] arr) {
    // Get the length of the array
    ulong n = arr.length;

    for (ulong i = 0; i < n-1; i++) {
        // Assume the current position holds the minimum element
        ulong min_index = i;

        // Iterate through the unsorted portion to find the actual minimum
        for (ulong j = i + 1; j < n; j++) {
            // Update min_idx if a smaller element is found
            if (arr[j] < arr[min_index]) min_index = j;
        }

        // Move minimum element to its correct position
        ulong temp = arr[i];
        arr[i] = arr[min_index];
        arr[min_index] = temp;
    }
}

unittest{
   ulong[] data = [64, 34, 25, 12, 22, 11, 90];
   selection_sort(data);
   assert(data == [11,12,22,25,34,64,90]);
}

void main() {}
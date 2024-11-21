import std.stdio;

/*
 * Stalin Sort is a humorous sorting algorithm that modifies the input array in-place.
 * It keeps elements that are in non-decreasing order and removes elements that break this order.
 * 
 * 1) Start with the first element of the array as the base.
 * 2) Iterate through the array, keeping only elements that are greater than or equal to the last kept element.
 * 3) Shift all valid elements to the left, effectively removing invalid ones.
 * 4) Resize the array to include only valid elements.
 *
 * @param arr the array of integers to be sorted
 */
void stalin_sort(ref ulong[] arr) {
    if (arr.length == 0) return; // No action for an empty array

    ulong index = 0; // Position to keep the current element

    for (ulong i = 1; i < arr.length; i++) {
        if (arr[i] >= arr[index]) {
            index++;
            arr[index] = arr[i]; // Keep valid element in place
        }
    }

    arr.length = index + 1; // Truncate the array to contain only valid elements
}

unittest{
   ulong[] data = [64, 34, 25, 12, 22, 11, 90];
   stalin_sort(data);
   assert(data == [64,90]);
}

void main() {}
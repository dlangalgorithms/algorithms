import std.stdio;

/*
 * Insertion sort is a simple sorting algorithm that works by iteratively inserting each element of an unsorted list into its correct position in a sorted portion of the list.
 * It is like sorting playing cards in your hands. You split the cards into two groups: the sorted cards and the unsorted cards.
 * Then, you pick a card from the unsorted group and put it in the right place in the sorted group.
 * 
 * 1) We start with second element of the array as first element in the array is assumed to be sorted.
 * 2) Compare second element with the first element and check if the second element is smaller then swap them.
 * 3) Move to the third element and compare it with the first two elements and put at its correct position
 * 4) Repeat until the entire array is sorted.
 *
 * @param arr the array of integers to be sorted
 */
void insert_sort(ulong[] arr) {
    for (int i = 1; i < arr.length; i++) {
        ulong key = arr[i];
        int j = i - 1;
        // Move elements of arr[0..i-1], that are greater than key, to one position ahead of their current position
        while (j >= 0 && key < arr[j]) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

unittest{
   ulong[] data = [64, 34, 25, 12, 22, 11, 90];
   insert_sort(data);
   assert(data == [11,12,22,25,34,64,90]);
}

void main() {}
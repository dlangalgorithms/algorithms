import std.stdio;
import std.algorithm : swap;

/**
 * Implementation of a Min Heap (Minimum Priority Queue) data structure.
 * A Min Heap is a complete binary tree where the value of each node is 
 * less than or equal to the values of its children.
 */
class MinHeap {
    private int[] harr;      // Array to store heap elements
    private int capacity;    // Maximum capacity of the heap
    private int heap_size;   // Current number of elements in the heap

    /**
     * Constructs a new MinHeap with the specified capacity.
     *
     * @param cap the maximum number of elements the heap can hold
     */
    this(int cap) {
        heap_size = 0;
        capacity = cap;
        harr = new int[cap];
    }

    /**
     * Recursively heapifies a subtree rooted at index i to maintain the min-heap property.
     *
     * @param i the index of the root node of the subtree to heapify
     */
    void minHeapify(int i) {
        int l = left(i);     // Index of left child
        int r = right(i);    // Index of right child
        int smallest = i;    // Assume current node is the smallest
        
        // Compare with left child
        if (l < heap_size && harr[l] < harr[i])
            smallest = l;
        // Compare with right child
        if (r < heap_size && harr[r] < harr[smallest])
            smallest = r;
        // If smallest is not the current node, swap and continue heapifying
        if (smallest != i) {
            swap(harr[i], harr[smallest]);
            minHeapify(smallest);
        }
    }

    /**
     * Returns the index of the parent node for a given index.
     *
     * @param i the index of the child node
     * @return the index of the parent node
     */
    int parent(int i) { return (i - 1) / 2; }

    /**
     * Returns the index of the left child for a given index.
     *
     * @param i the index of the parent node
     * @return the index of the left child node
     */
    int left(int i) { return (2 * i + 1); }

    /**
     * Returns the index of the right child for a given index.
     *
     * @param i the index of the parent node
     * @return the index of the right child node
     */
    int right(int i) { return (2 * i + 2); }

    /**
     * Removes and returns the minimum element (root) from the heap.
     * Maintains the heap property after removal.
     *
     * @return the minimum element in the heap, or int.max if heap is empty
     */
    int extractMin() {
        if (heap_size <= 0)
            return int.max;
        if (heap_size == 1) {
            heap_size--;
            return harr[0];
        }

        int root = harr[0];              // Store the root value
        harr[0] = harr[heap_size - 1];   // Move last element to root
        heap_size--;
        minHeapify(0);                   // Heapify from the root

        return root;
    }

    /**
     * Decreases the value of a key at the specified index to a new value.
     * Adjusts the heap to maintain the min-heap property.
     *
     * @param i the index of the key to decrease
     * @param new_val the new value for the key (must be smaller than current value)
     */
    void decreaseKey(int i, int new_val) {
        harr[i] = new_val;
        // Bubble up the decreased key to maintain heap property
        while (i != 0 && harr[parent(i)] > harr[i]) {
            swap(harr[i], harr[parent(i)]);
            i = parent(i);
        }
    }

    /**
     * Returns the minimum element from the heap without removing it.
     *
     * @return the minimum element in the heap (root element)
     */
    int getMin() { return harr[0]; }

    /**
     * Deletes a key at the specified index from the heap.
     *
     * @param i the index of the key to delete
     */
    void deleteKey(int i) {
        decreaseKey(i, int.min);  // Decrease key to minimum value
        extractMin();             // Extract the now-minimum key
    }

    /**
     * Inserts a new key into the heap.
     * Maintains the heap property after insertion.
     *
     * @param k the key value to insert
     */
    void insertKey(int k) {
        if (heap_size == capacity) {
            writeln("\nOverflow: Could not insertKey");
            return;
        }

        heap_size++;
        int i = heap_size - 1;
        harr[i] = k;

        // Bubble up the new key to maintain heap property
        while (i != 0 && harr[parent(i)] > harr[i]) {
            swap(harr[i], harr[parent(i)]);
            i = parent(i);
        }
    }
}

/**
TESTS 
*/
unittest {
    // Test basic insertion and extraction in order
    auto h = new MinHeap(11);
    h.insertKey(3);
    h.insertKey(2);
    h.insertKey(1);
    assert(h.extractMin() == 1);
    assert(h.extractMin() == 2);
    assert(h.extractMin() == 3);
    assert(h.extractMin() == int.max);  // Test empty heap extraction
    
}

/**
 * Program tests are performed above in the unittest block.
 * The main function is empty as tests are run automatically.
 */
void main() {}

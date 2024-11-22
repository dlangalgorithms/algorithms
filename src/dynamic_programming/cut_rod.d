import std;

/**
 * Calculates the maximum profit that can be obtained by cutting a rod
 * of length n and selling the pieces based on the given price array.
 *
 * @param price an array of integers representing the prices for each 
 *              length of the rod (1-indexed, where price[i-1] is the 
 *              price for a rod of length i).
 * @param n     the total length of the rod.
 * @return      the maximum profit that can be obtained by cutting the rod.
 */
int maxProfitByCuttingRod(int[] price, uint64_t n) {
    // Array to store maximum profits for each length of the rod
    int[] profit = new int[n + 1];

    // Base case: No profit can be made from a rod of length 0
    profit[0] = 0;

    // Iterate over lengths from 1 to n
    for (size_t i = 1; i <= n; i++) {
        int q = int.min; // Initialize maximum profit for this length

        // Check all possible cuts of the rod
        for (size_t j = 1; j <= i; j++) {
            // Calculate profit by making a cut at length j
            q = max(q, price[j - 1] + profit[i - j]);
        }

        // Store the maximum profit for rod length i
        profit[i] = q;
    }

    // Return the maximum profit for the full length of the rod
    return profit[n];
}

/**
TESTS 
*/

unittest {
    // Test case to validate the maxProfitByCuttingRod function
    const int n1 = 8; // Length of the rod
    int[] price1 = [1 , 5, 8, 9, 10, 17 , 17 , 20]; // Prices for each length
    const int max_profit1 = maxProfitByCuttingRod(price1, n1); // Calculate max profit
    const int expected_max_profit1 = 22; // Expected result
    assert(max_profit1 == expected_max_profit1); // Assert that calculated profit matches expected
    writeln(max_profit1); // Output result
}

/**
    Program tests are performed above in the unittest block
 */
void main() {}

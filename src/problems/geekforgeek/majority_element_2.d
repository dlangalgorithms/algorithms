import std;
import std.algorithm : sort;
/*
     * Link: https://www.geeksforgeeks.org/problems/majority-vote/1
     * 
     * Majority Element II
     * Difficulty: Medium
     *
     * Problem:
     * You are given an array of integer int[] where each number represents a vote to a candidate.
     * Return the candidates that have votes greater than one-third of the total votes, If there's not a majority vote, return an empty array. 
     * 
     * Note: The answer should be returned in an increasing format.
     * 
     * Examples:
     * ====================================================
     * Input: int[] array = [2, 1, 5, 5, 5, 5, 6, 6, 6, 6, 6];
     * Output: [5, 6]
     * Explanation: 5 and 6 occur more n/3 times.
     * ====================================================
     * 
     * ====================================================
     * Input: int[] array = [1, 2, 3, 4, 5];
     * Output: []
     * Explanation: no candidate occur more than n/3 times.
     * ====================================================
     * 
     * Constraint:
     * 1 <= arr.size() <= 10^6
     * -10^9 <= arr[i] <= 10^9
     * 
*/

/**
     * Returns an array of major numbers where each number represents a candidate whos amount of votes greater than one-third of the total votes.
     *
     * @param number the number
     * @return the smallest (closest to negative infinity) of given
     * {@code number}
*/
int[] find_majority(int[] array) {
    int[int] counter = new int[int];

    foreach(int num; array) {
        if (num in counter) {
            counter[num]++;
        } else {
            counter[num] = 1;
        }
    }
    
    int[] result = [];
    foreach(key, value; counter) {
        if (value > array.length / 3) result ~= key;
    }

    sort(result); // The answer should be returned in an increasing format.
    return result;
}

unittest {
    assert(find_majority([2, 1, 5, 5, 5, 5, 6, 6, 6, 6, 6]) == [5, 6]);
    assert(find_majority([1, 2, 3, 4, 5]) == []);
    assert(find_majority([1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 6, 6, 6, 7, 8]) == [2]);
    assert(find_majority([1]) == [1]);
    assert(find_majority([1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5]) == []);
}

/*Program tests are performed above in the unittest block*/
int main(){
    return 0;
}
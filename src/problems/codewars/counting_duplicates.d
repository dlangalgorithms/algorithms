import std;
import std.uni : toLower;
/*
 * Link: https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1
 * 
 * Counting Duplicates
 * Difficulty: 6 kyu
 *
 * Problem:
 * Count the number of Duplicates
 * Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string.
 * The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
 * 
 * Examples
 * "abcde" -> 0 # no characters repeats more than once
 * "aabbcde" -> 2 # 'a' and 'b'
 * "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
 * "indivisibility" -> 1 # 'i' occurs six times
 * "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
 * "aA11" -> 2 # 'a' and '1'
 * "ABBA" -> 2 # 'A' and 'B' each occur twice
 * 
 * Tags: Strings, Fundamentals
 * 
*/

/*
 * Returns amount of duplicated chars in the text.
 *
 * @param text just text
 * @return amount of duplicated chars
 * {@code text}
*/
uint duplicate_count(string text) {
    text = toLower(text);
    int[char] map;
    int result = 0;
    
    foreach (c; text) {
        if (c !in map) map[c] = 0;
        map[c]++;
    }
    
    foreach (key, value; map) {
        if (value > 1) result++;
    }
    
    return result;
}

unittest {
    assert(duplicate_count("abcde") == 0);
    assert(duplicate_count("aabbcde") == 2);
    assert(duplicate_count("aabBcde") == 2);
    assert(duplicate_count("indivisibility") == 1);
    assert(duplicate_count("Indivisibilities") == 2);
    assert(duplicate_count("aA11") == 2);
    assert(duplicate_count("ABBA") == 2);
}

// Program tests are performed above in the unittest block
int main(){
    return 0;
}
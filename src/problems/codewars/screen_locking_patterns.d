import std;
import std.algorithm : filter, map;
import std.array : array;
import std.conv : to;

/*
 * Link: https://www.codewars.com/kata/585894545a8a07255e0002f1
 * 
 * Screen Locking Patterns
 * Difficulty: 3 kyu
 *
 * Problem:
 * 
 * You might already be familiar with many smartphones that allow you to use a geometric pattern as a security measure.
 * To unlock the device, you need to connect a sequence of dots/points in a grid by swiping your finger without lifting it as you trace the pattern through the screen.
 * 
 * The image below has an example pattern of 7 dots/points: (A -> B -> I -> E -> D -> G -> C).
 * 
 * IMAGE (https://i.imgur.com/zmPNYdv.png)
 * 
 * For this kata, your job is to implement a function that returns the number of possible patterns starting from a given first point, that have a given length.
 * 
 * More specifically, for a function `count_patterns_from(first_point, length)`, the parameter `first_point` is a single-character string corresponding to the point in the grid (e.g.: `'A'`) where your patterns start, and the parameter `length` is an integer indicating the number of points (length) every pattern must have.
 * 
 * For example, `countPatternsFrom("C", 2)`, should return the number of patterns starting from `'C'` that have `2` two points.
 * The return value in this case would be `5`, because there are 5 possible patterns:
 * 
 * (C -> B), (C -> D), (C -> E), (C -> F) and (C -> H).
 * 
 * Bear in mind that this kata requires returning the number of patterns, not the patterns themselves, so you only need to count them.
 * Also, the name of the function might be different depending on the programming language used, but the idea remains the same.
 * 
 * Rules
 * 1) In a pattern, the dots/points cannot be repeated: they can only be used once, at most.
 * 2) In a pattern, any two subsequent dots/points can only be connected with direct straight lines in either of these ways:
 * 3) Horizontally: like (A -> B) in the example pattern image.
 * 4) Vertically: like (D -> G) in the example pattern image.
 * 5) Diagonally: like (I -> E), as well as (B -> I), in the example pattern image.
 * 6) Passing over a point between them that has already been 'used': like (G -> C) passing over E, in the example pattern image.
 *    This is the trickiest rule.
 *    Normally, you wouldn't be able to connect G to C, because E is between them, however when E has already been used as part the pattern you are tracing, you can connect G to C passing over E, because E is ignored, as it was already used once.
 * 
 * The sample tests have some examples of the number of combinations for some cases to help you check your code.
 * 
 * Fun fact:
 * 
 * In case you're wondering out of curiosity, for the Android lock screen, the valid patterns must have between 4 and 9 dots/points.
 * There are 389112 possible valid patterns in total; that is, patterns with a length between 4 and 9 dots/points.
 * 
 * Tags: Mathematics, Combinatorics, Geometry, Algorithms, Graph Theory
 * 
*/

char[] get_next_possible_dots(char dot, char[] used) {
    char[] possible;
    switch (dot) {
        case 'A':
            possible = ['B', 'D', 'E', 'F', 'H'];
            break;
        case 'B':
            possible = ['A', 'C', 'D', 'E', 'F', 'G', 'I'];
            break;
        case 'C':
            possible = ['B', 'D', 'E', 'F', 'H'];
            break;
        case 'D':
            possible = ['A', 'B', 'C', 'E', 'G', 'H', 'I'];
            break;
        case 'E':
            possible = ['A', 'B', 'C', 'D', 'F', 'G', 'H', 'I'];
            break;
        case 'F':
            possible = ['A', 'B', 'C', 'E', 'G', 'H', 'I'];
            break;
        case 'G':
            possible = ['B', 'D', 'E', 'F', 'H'];
            break;
        case 'H':
            possible = ['A', 'C', 'D', 'E', 'F', 'G', 'I'];
            break;
        case 'I':
            possible = ['B', 'D', 'E', 'F', 'H'];
            break;
        default: return [];
    }

    switch (dot) {
        case 'A':
            if (used.canFind('B')) possible ~= 'C';
            if (used.canFind('D')) possible ~= 'G';
            if (used.canFind('E')) possible ~= 'I';
            break;
        case 'C':
            if (used.canFind('B')) possible ~= 'A';
            if (used.canFind('E')) possible ~= 'G';
            if (used.canFind('F')) possible ~= 'I';
            break;
        case 'G':
            if (used.canFind('D')) possible ~= 'A';
            if (used.canFind('E')) possible ~= 'C';
            if (used.canFind('H')) possible ~= 'I';
            break;
        case 'I':
            if (used.canFind('E')) possible ~= 'A';
            if (used.canFind('F')) possible ~= 'C';
            if (used.canFind('H')) possible ~= 'G';
            break;
        case 'B':
            if (used.canFind('E')) possible ~= 'H';
            break;
        case 'D':
            if (used.canFind('E')) possible ~= 'F';
            break;
        case 'F':
            if (used.canFind('E')) possible ~= 'D';
            break;
        case 'H':
            if (used.canFind('E')) possible ~= 'B';
            break;
        default: break;
    }
    return possible.filter!(x => !used.canFind(x)).map!(c => to!char(c)).array;
}

uint count_patterns(char current, uint remaining_length, char[] used) {
        if (remaining_length == 1) return 1;

        uint count = 0;

        char[] next_dots = get_next_possible_dots(current, used);

        foreach (next_dot; next_dots) {
            count += count_patterns(next_dot, remaining_length - 1, used ~ next_dot);
        }

        return count;
    }

uint count_patterns_from(char first_point, uint length) {
    if (length > 9 || length == 0) return 0;
    if (length == 1) return 1;

    return count_patterns(first_point, length, [first_point]);
}

unittest {
    assert(count_patterns_from('A', 0) == 0);
    assert(count_patterns_from('A', 10) == 0);
    assert(count_patterns_from('B', 1) == 1);
    assert(count_patterns_from('C', 2) == 5);
    assert(count_patterns_from('D', 3) == 37);
    assert(count_patterns_from('E', 4) == 256);
    assert(count_patterns_from('E', 8) == 23280);
}

void main() {}
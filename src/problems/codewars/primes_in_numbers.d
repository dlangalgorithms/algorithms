import std.format;
import std.math : sqrt;
import std.algorithm : sort;

/*
 * Link: https://www.codewars.com/kata/54d512e62a5e54c96200019e
 * 
 * Primes in numbers
 * Difficulty: 5 kyu
 *
 * Problem:
 * Given a positive number n > 1 find the prime factor decomposition of n.
 * The result will be a string with the following form: "(p1**n1)(p2**n2)...(pk**nk)"
 * 
 * With the p(i) in increasing order and n(i) empty if n(i) is 1.
 * 
 * Example:
 * n = 86240 should return "(2**5)(5)(7**2)(11)"
 * 
*/
string primeFactors(long n) {    
    string result;
    int count = 0;
    
    while (n % 2 == 0) {
        n /= 2;
        count++;
    }
    
    if (count > 0) result ~= (count == 1) ? "(2)" : format("(2**%d)", count);
    
    for (int i = 3; i < (sqrt(cast(float)n) + 1); i+=2) {
        count = 0;
        while (n % i == 0) {
            n /= i;
            count++;
        }
        if (count > 0) result ~= (count == 1) ? format("(%d)", i) : format("(%d**%d)", i, count);
    }
    
    if (n > 2) {
        result ~= format("(%d)", n);
    }
    
    return result;
}

unittest {
    assert(primeFactors(7775460) == "(2**2)(3**3)(5)(7)(11**2)(17)");
    assert(primeFactors(7919) == "(7919)");
    assert(primeFactors(17*17*93*677) == "(3)(17**2)(31)(677)");
    assert(primeFactors(933555431) == "(7537)(123863)");
}

void main() {

}
import std;

/*
 * Greatest Common Divisor (GCD) Calculation - Computes the largest positive integer that divides two integers without leaving a remainder. This implementation uses the iterative Euclidean algorithm.
 * 1) Handle the base case: if either input integer is 0, the GCD is defined as 0.
 * 2) Initiate a loop that continues as long as the second integer (b) is not zero.
 * 3) Inside the loop, store the current value of 'b' in a temporary variable 'temp'.
 * 4) Update 'b' to be the remainder of 'a' divided by 'b' (a % b).
 * 5) Update 'a' to be the value stored in 'temp'. This effectively replaces 'a' with the previous 'b', and 'b' with the remainder.
 * 6) When the loop terminates (meaning 'b' has become 0), the value of 'a' holds the GCD of the original two numbers.
 */
long gcd(long a, long b) {
    if (a == 0 || b == 0) {
        return 0;
    }
    while (b != 0) {
        long temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

unittest {
    assert(gcd(48, 18) == 6);
    assert(gcd(56, 98) == 14);
    assert(gcd(101, 10) == 1);
    assert(gcd(54, 24) == 6);
}

void main(){}

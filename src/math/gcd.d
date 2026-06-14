import std;

/*
 * Greatest Common Divisor (GCD) Calculation - Computes the largest positive integer that divides two integers without leaving a remainder. This implementation uses the iterative Euclidean algorithm.
 * 1) if either input int is 0, the GCD is defined as 0.
 * 2) This loop continues until b is zero.
 * 3) @param temp = store the value of b temporarily before updating b to a % b.
 * 4) b = a % b = update b to the remainder of a divided by b, which is the key step in the Euclidean algorithm.
 * 5) a = temp = update a to the previous value of b.
 * 6) in the end return a which is the GCD of the original pair of integers.
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

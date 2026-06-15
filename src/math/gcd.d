import std;

/**
 * Greatest Common Divisor (GCD) Calculation - Computes the largest positive integer that divides two integers without leaving a remainder.
 *
 * ### Step-by-Step:
 * 1. If either input `a` or `b` is 0, return 0.
 * 2. Loop continues until `b` is zero.
 * 3. `temp` = store the value of `b` temporarily before update `b` to `a % b`.
 * 4. `b = a % b` = update `b` to remainder of `a` divided by `b`.
 * 5. `a = temp` = update `a` to previous value of `b`.
 *
 * Params:
 * a = The first integer.
 * b = The second integer.
 *
 * Returns:
 * In the end return `a` which is the GCD of the original pair of integers.
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

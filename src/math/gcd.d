module math.gcd;

/// Calculates the Greatest Common Divisor (GCD) of two integers.
/// Uses the efficient iterative Euclidean algorithm.
///
/// Params:
///     a = The first integer.
///     b = The second integer.
/// Returns:
///     The greatest common divisor of a and b as a long.


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
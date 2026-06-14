module math.lcm;

/// Calculates the Least Common Multiple (LCM) of two integers.
/// Relies on the relationship between GCD and LCM to find the result.
///
/// Params:
///     a = The first integer.
///     b = The second integer.
/// Returns:
///     The least common multiple of a and b as a long.

long lcm(long a , long b){
    if (a == 0 || b == 0) {
        return 0;
    }
    if(a < 0) a = -a;
    if(b < 0) b = -b;

    long result = a * b;
     while (b != 0) {
        long temp = b;
        b = a % b;
        a = temp;
    }
    return result / a;
}

unittest {
    assert(lcm(4, 6) == 12);
    assert(lcm(21, 6) == 42);
    assert(lcm(8, 9) == 72);
    assert(lcm(15, 20) == 60);
}

void main() {}

import std;

/**
 * Least Common Multiple (LCM) Calculation - Computes the smallest positive integer that is divisible by both of two given integers.
 *
 * ### Step-by-Step:
 * 1. If any of inputs `a` or `b` are zero, return 0.
 * 2. If any of inputs are negative number, we take absolute value of that.
 * 3. `result` = store output and multiply two inputs.
 * 4. In while loop, we take GCD of the two inputs.
 *
 * Params:
 * a = The first integer.
 * b = The second integer.
 *
 * Returns:
 * In the end, multiply two inputs, divide by their GCD, and return this result.
 */

 
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

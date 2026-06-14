
import std;

/*
 * Least Common Multiple (LCM) Calculation - Computes the smallest positive integer that is divisible by both of two given integers. This implementation uses the relationship LCM(a, b) = |a * b| / GCD(a, b).
 * 1) In the first condition, if any of the inputs (a, b) are zero, return 0.
 * 2) if any of inputs are negative number, we take the absolute value of that.
 * 3) @param result = to store the output and multiply two inputs
 * 4) in the While loop, we take GCD of the two inputs
 * 5) in the end, we multiply the two inputs, divide by their GCD, and return this.
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

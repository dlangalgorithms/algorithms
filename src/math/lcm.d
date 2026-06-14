
import std;

/*
 * Least Common Multiple (LCM) Calculation - Computes the smallest positive integer that is divisible by both of two given integers. This implementation uses the relationship LCM(a, b) = |a * b| / GCD(a, b).
 * 1) Handle the base case: if either input integer is 0, the LCM is defined as 0.
 * 2) Ensure both input numbers 'a' and 'b' are positive by taking their absolute values if they are negative.
 * 3) Calculate the product of 'a' and 'b' and store it in 'result'. This will be used later.
 * 4) Employ the Euclidean algorithm to find the Greatest Common Divisor (GCD) of 'a' and 'b'. This involves repeatedly taking the remainder until 'b' becomes 0, at which point 'a' holds the GCD.
 * 5) Divide the pre-calculated product ('result') by the GCD found in the previous step. This division yields the LCM.
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

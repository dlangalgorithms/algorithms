/**
 * Calculates the floor of a number.
 * Returns the largest integer value less than or equal to the given number.
 *
 * Params:
 *     x = The floating-point number to process.
 * Returns:
 *     The rounded-down value as a double to prevent integer overflow.
 */
double floor(double x) {    
    double rem = x % 1;
    if( x > 0 && rem != 0) {
        return x - rem;
    } else if (x < 0 && rem != 0) {
        return x - rem - 1;
    } else {
        return x;
    }
}




unittest {
    assert(floor(3.5) == 3);
    assert(floor(-3.5) == -4);
    assert(floor(3.0) == 3);
    assert(floor(-3.0) == -3);
}

void main() {}

/*
 * Floor Calculation - Computes the largest integer value that is less than or equal to a given floating-point number.
 * 1) Calculate the remainder when the input number is divided by 1. This isolates the fractional part.
 * 2) If the input number is positive and has a non-zero remainder, the floor is the number without its fractional part. This is achieved by subtracting the remainder.
 * 3) If the input number is negative and has a non-zero remainder, we need to round down to the next lower integer. This is achieved by subtracting the remainder and then subtracting an additional 1.
 * 4) If the input number is already an integer (remainder is zero), it is returned as is.
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

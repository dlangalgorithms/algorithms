
import std;

/*
 * Ceiling Calculation - Computes the smallest integer value that is greater than or equal to a given floating-point number.
 * 1) Calculate the remainder when the input number is divided by 1. This isolates the fractional part.
 * 2) If the input number is positive and has a non-zero remainder, it means we need to round up. This is achieved by subtracting the remainder and adding 1 to the original number.
 * 3) If the input number is negative and has a non-zero remainder, the ceiling is the number itself without its fractional part. This is achieved by subtracting the remainder.
 * 4) If the input number is already an integer (remainder is zero), it is returned as is.
 */
double ceil(double number){
    double rem = number % 1;
    if( number > 0 && rem != 0) {
        return number - rem + 1;
    } else if (number < 0 && rem != 0) {
        return number - rem;
    } else {
        return number;
    }
}

unittest {

    assert(ceil(10.2) == 11);
    assert(ceil(9) == 9);
    assert(ceil(12.6) == 13);

    assert(ceil(-10.2) == -10);
    assert(ceil(-12.6) == -12);
    assert(ceil(-5.0) == -5);
    
}

void main(){}

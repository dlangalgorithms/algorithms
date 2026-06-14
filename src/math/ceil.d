import std;

/// Calculates the ceiling of a number.
/// Returns the smallest integer value greater than or equal to the given number.
///
/// Params:
///     number = The floating-point number to process.
/// Returns:
///     The rounded-up value as a double to prevent integer overflow.

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

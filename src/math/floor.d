
/**
 * Computes the largest integer value that is less than or equal to a given floating-point number.
 *
 * ### Step-by-Step:
 * 1. `rem` = for get remainder of number when divided by 1.
 * 2. In first if = if number is Positive and `rem != 0` (it has remainder) then `x - rem`.
 * 3. In second if = if number is Negative and `rem != 0` (it has remainder) then `x - rem - 1`.
 * 4. If number is already an integer then return the number as is.
 *
 * Params:
 * x = The floating-point value to evaluate.
 *
 * Returns:
 * If input has no remainder, return `x`. Otherwise if number positive remove remaining and returns it, if negative, subtract one and return it.
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

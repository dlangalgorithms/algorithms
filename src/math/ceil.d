
import std;

/**
 * Computes the smallest integer value that is greater than or equal to a given floating-point number.
 *
 * ### Step-by-Step:
 * 1. `rem` = for get remainder of number when divided by 1.
 * 2. In first if = if number is Positive and `rem != 0` (it has remainder) then `number - rem + 1`.
 * 3. In second if = if number is Negative and `rem != 0` (it has remainder) then `number - rem`.
 * 4. If number is already an integer then return the number as is.
 *
 * Params:
 * number = The floating-point value to evaluate.
 *
 * Returns:
 * If input has no remainder, it returns `number`. Otherwise it removes remaining part, adds one to `number` and returns it.
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

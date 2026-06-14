
import std;

/*
 * Ceiling Calculation - Computes the smallest integer value that is greater than or equal to a given floating-point number.
 * 1) @param rem = for get remainder of number when divided by 1
 * 2) in first if = if number is Positive and rem not zero(it has remainder) then number - rem + 1 (2.2 - 0.2 + 1)
 * 3) in second if = if number is Negative and rem not zero(it has remainder) then number - rem (2.2 - 0.2)
 * 4) if number is already an integer then return the number as is
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

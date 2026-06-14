/*
 * Floor Calculation - Computes the largest integer value that is less than or equal to a given floating-point number.
 * 1) @param rem = for get remainder of number when divided by 1
 * 2)  in first if = if number is Positive and rem not zero(it has remainder) then number - rem
 * 3)  in second if = if number is Negative and rem not zero(it has remainder) then number - rem - 1
 * 4)  if number is already an integer then return the number as is
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

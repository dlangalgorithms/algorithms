import std;

/*
 * Rounding Function - Rounds a floating-point number to the nearest integer. Numbers exactly halfway between two integers are rounded away from zero.
 * 1) @param rem = for get remainder of number when divided by 1
 * 2) in first if = if number is positive and fractional part >= 0.5, round up by subtracting rem and adding 1
 * 3) in second if = if number is positive and fractional part < 0.5, round down by subtracting rem
 * 4) in third if = if number is negative and fractional part > -0.5, round towards zero by subtracting rem
 * 5) in fourth if = if number is negative and fractional part <= -0.5, round away from zero by subtracting rem and 1
 * 6) else = if number is already an integer, return the number as is
 */
double round(double x){
    double rem = x % 1;
    if (rem >= 0.5 && x > 0){
        return x - rem + 1;
    }else if (rem < 0.5 && x > 0){
        return x - rem;
    }else if (rem > -0.5 && x < 0){
        return x - rem;
    }else if (rem <= -0.5 && x < 0){
        return x - rem - 1;
    } else {
        return x;
    }
}


unittest{
    assert(round(10.2) == 10);
    assert(round(9) == 9);
    assert(round(12.6) == 13);

    assert(round(-10.2) == -10);
    assert(round(-12.6) == -13);
    assert(round(-5.0) == -5);
}

void main(){}

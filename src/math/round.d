import std;

/*
 * Rounding Function - Rounds a floating-point number to the nearest integer. Numbers exactly halfway between two integers are rounded away from zero.
 * 1) Calculate the remainder when the input number is divided by 1. This isolates the fractional part.
 * 2) If the fractional part is 0.5 or greater and the number is positive, round up by subtracting the remainder and adding 1.
 * 3) If the fractional part is less than 0.5 and the number is positive, round down by simply subtracting the remainder.
 * 4) If the fractional part is greater than -0.5 (i.e., between -0.499... and 0) and the number is negative, round towards zero by subtracting the remainder.
 * 5) If the fractional part is -0.5 or less and the number is negative, round down (away from zero) by subtracting the remainder and then subtracting an additional 1.
 * 6) If the number is already an integer (remainder is zero), it is returned as is.
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

void main(){
    
}

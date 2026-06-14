import std;

/**
 * Rounds a floating-point number to the nearest integer value.
 * Halfway cases (0.5 or -0.5) are rounded away from zero.
 *
 * Params:
 *     x = The floating-point number to process.
 * Returns:
 *     The rounded value as a double to prevent integer overflow.
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

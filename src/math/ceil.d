import std;

/**
     * Returns the smallest (closest to negative infinity)
     *
     * @param number the number
     * @return the smallest (closest to negative infinity) of given
     * {@code number}
*/

double ceil(double number) {
    if (number - cast(int) number == 0) {
        return number;
    } else if (number - cast(int) number > 0) {
        return cast(int)(number + 1);
    } else {
        return cast(int) number;
    }
}

unittest {

    assert(ceil(10.2) == 11);
    assert(ceil(9) == 9);
    assert(ceil(12.6) == 13);
    
}

/*Program tests are performed above in the unittest block*/
int main(){
    return 0;
}
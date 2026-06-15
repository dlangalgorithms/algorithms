import std;

/**
 * Prime Check - An algorithm to determine if an integer is a prime number.
 *
 * ### Step-by-Step:
 * 1. First if input `n <= 1` return false because it is not prime number.
 * 2. Second if input `n == 2` return true because 2 is a prime number.
 * 3. Third if input `n` is even return false because even numbers greater than 2 are not prime.
 * 4. Start a loop from 3 to square root of `n`, increment by 2. If `n` is divisible by any of these, return false.
 *
 * Params:
 * n = The integer to check.
 *
 * Returns:
 * In the end return true if `n` is not divisible by any number from 2 to square root of `n`.
 */

bool is_prime(int n){
    if(n <= 1) return false;
    if(n == 2) return true;
    if(n % 2 == 0) return false;
    for(int i = 3; i * i <= n; i += 2){
        if(n % i == 0) return false;        
    }
    return true;
}
unittest {
    assert(is_prime(2) == true);
    assert(is_prime(3) == true);
    assert(is_prime(4) == false);
    assert(is_prime(5) == true);
    assert(is_prime(10) == false);
    assert(is_prime(13) == true);
    assert(is_prime(17) == true);
    assert(is_prime(20) == false);
}

void main() {}

import std;

/*
 * Prime Check - A comparison-based algorithm to determine if an integer is a prime number.
 * 1) First, we check the base cases: any number less than or equal to 1 is immediately classified as not prime.
 * 2) The number 2 is evaluated next, as it is the only even prime number in mathematics.
 * 3) All other even numbers are excluded right away by checking if they are divisible by 2.
 * 4) For remaining odd numbers, we iterate through odd factors starting from 3 up to the square root of the number (i * i <= n).
 * 5) If any factor divides the number perfectly, it is classified as composite; otherwise, it is confirmed as a prime number.
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

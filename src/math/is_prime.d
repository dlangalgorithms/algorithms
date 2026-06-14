import std;

/*
 * Prime Check - A comparison-based algorithm to determine if an integer is a prime number.
 * 1) first if input n is one return false because 1 is not a prime number.
 * 2) second if input n is two return true because 2 is a prime number.
 * 3) third if input n is even and greater than 2 return false because all even numbers greater than 2 are not prime.
 * 4) start a loop from 3 to the square root of n, incrementing by 2 (to check only odd numbers). If n is divisible by any of these numbers, return false because it means n has a divisor other than 1 and itself. 
 * 5) in the end return true because if n is not divisible by any number from 2 to the square root of n, it is a prime number.
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

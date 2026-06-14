module math.is_prime;

/// Checks whether a given integer is a prime number.
/// Utilizes trial division up to the square root of the number for efficiency.
///
/// Params:
///     n = The integer to check.
/// Returns:
///     true if the number is prime, false otherwise.

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
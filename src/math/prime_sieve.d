import std;

/**
 * Generates all prime numbers up to a given limit N using the Sieve of Eratosthenes.
 * This algorithm is highly efficient for finding small primes en masse.
 *
 * Params:
 *     n = The upper bound limit (inclusive) to find primes.
 * Returns:
 *     An array of integers containing all prime numbers up to n.
 */
int[] prime_sieve(int n){
    if(n < 2) return [];
    bool[] is_prime = new bool[n + 1];
    is_prime[] = true;
    is_prime[0] = false;
    is_prime[1] = false;
    for(int i = 2; i * i <= n; i++){
        if(is_prime[i]){
            for(int j = i * i; j <= n; j += i){
                is_prime[j] = false;
            }
        }
    }
    int[] primes = [];
    for(int i = 2; i <= n; i++){
        if(is_prime[i]){
            primes ~= i;
        }
    }
    return primes;
}

unittest {
    assert(prime_sieve(10) == [2, 3, 5, 7]);
    assert(prime_sieve(20) == [2, 3, 5, 7, 11, 13, 17, 19]);
    assert(prime_sieve(1) == []);
    assert(prime_sieve(2) == [2]);
}

void main() {}


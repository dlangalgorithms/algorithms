import std;

/*
 * Prime Sieve - Generates all prime numbers up to a specified limit N using the Sieve of Eratosthenes algorithm.
 * 1) Handle the edge case: if N is less than 2, return an empty array as there are no primes below 2.
 * 2) Initialize a boolean array 'is_prime' of size N+1, marking all entries as true, assuming all numbers are potentially prime initially.
 * 3) Explicitly mark 0 and 1 as not prime by setting their corresponding entries in 'is_prime' to false.
 * 4) Iterate from i = 2 up to the square root of N. For each 'i':
 *    a) If 'is_prime[i]' is true (meaning 'i' is considered prime), then mark all multiples of 'i' (starting from i*i) up to N as not prime by setting their 'is_prime' entries to false.
 * 5) After the sieving process, iterate through the 'is_prime' array from 2 to N.
 * 6) Collect all numbers 'i' for which 'is_prime[i]' is true into a result array. These are the prime numbers up to N.
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


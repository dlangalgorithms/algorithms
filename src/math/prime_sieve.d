import std;

/*
 * Prime Sieve - Generates all prime numbers up to a specified limit N using the Sieve of Eratosthenes algorithm.
 * 1) in the first, we check that the input cannot be less than 2 because it is not a prime number
 * 2) @param is_prime = we create a boolean array(One of larger ones from input(n)) To save valid outputs.
 * 3) first we set the entire array to true.
 * 4) we set members 0 and 1 to false Because 0 , 1  are not prime
 * 5) in the loop, we check whether the current number is prime or not, and if not, saved in is_prime array
 * 6) @param primes = to store prime numbers for return
 * 7) in the end, checking values inside out validator array and added in primes array, return primes.
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


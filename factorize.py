##=======================================================
## Nicholas Richardson (20660084)
## CS 116 Winter 2017
## Assignment 08 Question 2
##=======================================================

import math

prime_number = "{0} is prime"

## is_prime(n) Takes a natural n and produces 
##  True if it is prime or false if not
## is_prime: Nat -> Bool

def is_prime(n):
    if n == 2:
        return True
    test = 2
    while test <= math.ceil(math.sqrt(n)):
        if n % test == 0:
            return False
        else:
            test = test + 1
    return True


## factors_of(n) Takes a natural n and produces a list of all the prime factors
##  of n in assending order
## is_prime: Nat -> (listof Nat)

def factors_of(n):
    test = 2
    lst=[]
    while test <= n:
        if is_prime(test) and n % test == 0:
            lst.append(test)
        test += 1
    return lst


## exponent_of(n,factor) Takes a natural n and a factor of n and produces the
##  exponent on factor in the prime factorization of n. Returns 0 if factor is
##  not a factor of n
## exponent_of: Nat Nat -> Nat
## requires 

def exponent_of(n,factor):
    i=0
    while n % factor == 0:
        i+=1
        n = n // factor
    return i


## factorize(n) Takes a number n and produces a dictionary with each key a
##  prime factor of n and the value as the frequency the factor appears in 
##  the prime factorization
## effects: prints the prime factorization of n as an equation
## factorize: Nat -> (dictof Nat Nat)
## requires: n >= 2
## examples:
## factorize(2) => {2:1} and printed "2 is prime"
## factorize(24) => {2: 3, 3: 1} and printed "2*2*2*3=24"
## factorize(2310) => {2: 1, 3: 1, 5: 1, 7: 1, 11: 1} and printed "2*3*5*7*11=2310"

def factorize(n):
    if is_prime(n):
        print(prime_number.format(n))
        return {n:1}
    lst = factors_of(n)
    d = {}
    for factor in lst:
        d[factor]= exponent_of(n,factor)
    output_string = []
    for factor in d:
        for i in range(d[factor]):
            output_string.append(str(factor))
    print("*".join(output_string)+"="+str(n))
    return d
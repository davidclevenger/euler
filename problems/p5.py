# problem 5 - author: davidclevenger
# this is problem is written in Python until
# I comprehend types, modules, and derivables

import numpy as np


def is_prime(n):
    if n % 2 == 0 and n > 2:
        return False
    return all(n % i for i in range(3, int(np.sqrt(n)) + 1, 2))

    return True


def prime_factorization(x):
    factors = {}
    for i in range(x+1, 1, -1):
        if is_prime(i) and x % i == 0:
            factors[i] = int(np.log(x) / np.log(i))
            x /= i * factors[i]

        if x == 1:
            break

    return factors


def merge(d1: dict, d2: dict, f):
    """
    merge two dicts -- shared keys are resolved by f
    """
    all_keys = set()

    out = {}
    for t in d1.keys():
        all_keys.add(t)

    for t in d2.keys():
        all_keys.add(t)

    # FizzBuzz tangent
    for key in all_keys:
        if key in d1.keys() and key in d2.keys():
            out[key] = f(d1[key], d2[key])
        elif key in d1.keys():
            out[key] = d1[key]
        elif key in d2.keys():
            out[key] = d2[key]

    return out


factors = {}
for i in range(2, 21):
    factors = merge(factors, prime_factorization(i), lambda a, b: max(a, b))

prod = 1
for base, exp in factors.items():
    prod *= base ** exp

print(prod)



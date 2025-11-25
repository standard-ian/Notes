### N choose K problem
```
choose 3 from 5 a, b, c, d, e:
f(5, 3)
f(n, k) = f(n-1, k-1) + f(n-1, k)

4 choose 2 (only including 'a'):
abc
acd
abd
ace
ade
abe

4 choose 3 (not concerned w/ 'a'):
bcd
bce
cde
bde

For any recursive n choose k problem, this is the formula:
f(n, k) = f(n-1, k-1) + f(n-1, k)

Base cases:

k == 0 -> 1
k == 1 -> n
k == n -> 1

k must be <= n
```

### Memoization
1. Creating a table for the n choose k problem above. 
2. Fill in the base cases
```
def n_choose_k_memo(n, k) -> int:
    if (k > n):
        raise ValueError("N cannot be larger than K")

    memo = [[-1] * (k + 1) for _ in range (n+1)]
    return nk_memo_rec(n, k, memo)

def nk_memo_rec(n, k, memo) -> int:
    # if my f(n, k) answer is in the table, return this
    if (memo[n][k] != -1):
        return memo[n][k]
        
    else:
        if (k == 0):
            memo[n][k] = 1
            return 1

        if (k == 1):
            memo[n][k] = n
            return n

        if (k == n):
            memo[n][k] = 1
            return 1

        memo[n][k] = nk_memo_rec(n-1, k-1, memo) + nk_memo_rec(n-1, k, memo)
        return memo[n][k]
```

|       |       |       | k     |       |       |
| ----- | ----- | ----- | ----- | ----- | ----- |
|       |       | **0** | **1** | **2** | **3** |
|       | **0** | 1     | 0     | ERR   | ERR   |
|       | **1** | 1     | 1     | ERR   | ERR   |
| **n** | **2** | 1     | 2     | 1     | ERR   |
|       | **3** | 1     | 3     | ERR   | 1     |
|       | **4** | 1     | 4     | ERR   | ERR   |
|       | **5** | 1     | 5     | ERR   | ERR   |

### Tabulation
Fibonacci example, given an upper bounds, determine all fibonacci numbers
Create a table, traverse it looking back while i < n

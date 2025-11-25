```
############################################################

# Week 5 - Memozation/Tabulation practice

#

# Example:

#   Fruit salad stand - fruit costs $5.26

#   If someone pays w/ pennies, and we quickly count them and generate the smallest coin denominations

#   Least exact change

#

#

# What if we were in the Martian Economy? There is still a "penny" representing the same smallest unit.

# However, there are only 3 and 4 cent coins - no nickels, dimes, quarters, dollars

############################################################

  

# param: amount in USD
# return: tuple in format (one, three, four)
def make_change(amount : int) -> int:
    if (not isinstance(amount, int)):
        raise (ValueError("Amount must be an integer"))

    one, three, four = 0, 0, 0
    
    while (amount > 0):
        if (amount % 4 == 2 or amount % 4 == 3):
            three += 1
            amount -= 3

        elif (amount % 4 == 0):
            four += amount / 4
            amount  = 0

        elif (amount < 3):
            one += amount
            amount = 0

    return int(one), int(three), int(four)

  

def make_change_rec(amount : int) -> int:
    if (amount < 3):
        return amount, 0, 0
    if (amount == 4):
        return 0, 0, 1
    if (amount == 3):
        return 0, 1, 0

    one_1, three_1, four_1 = make_change_rec(amount - 4)
    one_2, three_2, four_2 = make_change_rec(amount - 3)
    one_3, three_3, four_3 = make_change_rec(amount - 1)

    one = one_1 + three_1 + four_1
    two = one_2 + three_2 + four_2
    three = one_3 + three_3 + four_3

    if (min(one, two, three) == three):
        return one_3 + 1, three_3, four_3

    if (min(one, two, three) == two):
        return one_2, three_2 + 1, four_2

    return one_1, three_1, four_1 + 1`
```

### Asymptotic Complexity

##### Informal Analysis
$f(n) = \frac{1}{2}n^{2} + 3n + 7$ 

Where n represents the size of the input size. 
1. The highest order term is all that matters.
2. Coefficients and constants are ignored.

This is fine to start out thinking about the complexity, but it's not the formal analysis.
##### Formal Analysis
Applies to both time and space complexity.
Asymptotic Complexity: Analyzing complexity as the size of the input, $n$ gets sufficiently large. 
$f(n)_{\epsilon}O(g(n))$
$f(n)_{\epsilon}O(n^{2})$  where $O(n^{2})$ is $g(n)$ 

Big O notation (upper bounds - worst case):
$f(n)_{\epsilon}O(g(n))\ \exists\ C$ where $C\ \neq 0 | f(n) \leq C \times g(n); \forall n$  sufficiently large and $\forall\ n$ 
$g$ acts as the upper bound

Big $\Omega$ notation (lower bounds - best case):
$f(n)_{\epsilon}\Omega\ (g(n))\ \exists\ C$ where $C\ \neq 0 | f(n) \geq C \times g(n); \forall n$ sufficiently large and $\forall\ n$
$g(n)$ acts as the **lower** bound
i.e. Quicksort cannot yield a better (lower) complexity than $O(n\ log\ n)$

Big $\Theta$ notation (best and worst case posses the same rate of growth):
$f(n)_{\epsilon}\ \Theta\ (g(n))\exists\ C_{1}, C_{2}$ where $C_{1}, C_{2}\ \neq 0 | C_{1}(n)\times g(n) \leq f(n) \leq C_{2}(n)\times g(n); \forall n$ sufficiently large and $\forall\ n \geq n_{0}$
i.e. Merge always runs with $O(log\ n)$

| $n$ | $f(n) = \frac{1}{2}n^{2} + 3n + 7$ | $f(n) = 1 \times n^{2}$ |
| --- | ---------------------------------- | ----------------------- |
| 1   | 10.5                               | 1                       |
| 10  | 87                                 | 100                     |
| 100 | 5307                               | 10,000                  |
We can see that the coefficient of $\frac{1}{2}$ on the left function's $n^{2}$ term severely handicaps the exponential growth, despite it's other $3n$ and constant 7.


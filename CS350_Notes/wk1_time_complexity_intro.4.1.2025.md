For the following, the body of the while loop is dependent on the array length.
It takes 3 constant time operations to complete and runs $n$ times
Then there is the cost of evaluating the while loop condition once at the end when the item is not present and we run out of bounds, then the cost of the return.

It is a linear search with worst case time complexity $3n + 2$  
```
def search_array(array, target):

    i : int = 0

    while (i < int(len(array))):

        if (array[i] == target):

            return i

        i += 1

    return -1
```
However, the constants are basically negligible. It is just $O(n)$ complexity, or a linear rate of growth.
It may seem like the constants play a role, but they are less efficient reduction opportunities compared with just cutting $n$ 

Binary search results in logarithmic time complexity because it uses interval halving. 
```
def search_array(array, target):

    return search_array_rec(array, target, 0, int(len(array)) - 1)

  

def search_array_rec(array, target, low, high):

    if (low > high):

        return -1

    mid = int((low + high) // 2)

    if (array[mid] == target):

        return int(mid)

    if (array[mid] < target):

        return search_array_rec(array, target, mid + 1, high)

    if (array[mid] > target):

        return search_array_rec(array, target, low, mid - 1)
```


With each iteration, the list is cut in half:

	$n(\frac{1}{2})(\frac{1}{2})(\frac{1}{2})...(\frac{1}{2}) = 1$
	$n(\frac{1}{2}^{x}) = 1$
	$\frac{1}{2}^{x} = \frac{1}{n}$
	$2^{x} = n$
	$log_{2}2^{x} = log_{2}n$
	$x * log_{2}2 = log_{2}n$
	$x * 1 = log_{2}n$
	$x = log_{2}n$

It's time complexity will be $O(log_{2}n)$

As an alternative for "Big O" notation we can use functional notation where $f(n)$ and $g(n)$ represent the complexity of the algorithms.
$Linear = O(n) \rightarrow f(n) = n$ 
$Binary = O(n) \rightarrow g(n) = log(n)$ 

|          | $f(n) = n$ | $g(n) = log(n)$ |
| -------- | ---------- | --------------- |
| n = 1    | 1          | 0               |
| n = 10   | 10         | 4               |
| n = 100  | 100        | 7               |
| n = 1000 | 1000       | 10              |
| n= 10000 | 10000      | 14              |

In reality, the functions are:
$Linear = O(n) \rightarrow f(n) = 3n + 3$ 
$Binary = O(n) \rightarrow g(n) = 6 * log(n)$ + 3
These constants make the complexity for different values higher, but the rate of growth as $n$ increases remains the same

|          | $f(n) = 3n + 3$ | $g(n) = 6 log(n) + 3$ |
| -------- | --------------- | --------------------- |
| n = 1    | 6               | 3                     |
| n = 10   | 33              | 27                    |
| n = 100  | 303             | 45                    |
| n = 1000 | 3003            | 63                    |
| n= 10000 | 30003           | 83                    |
Complexity is concerned with the rate of growth as $n$ becomes sufficiently large.

1. Constants do not matter once $n$ grows to be sufficiently large
2. Within one function, the higher order term dominatesA

$O(1) < O(log n) < O(n) < O (n log n) < O(n^{2}) < O(n^{3}) < O(2^{n}) < O(n!)$


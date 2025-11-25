#### Selection Sort
1. Placeholder and index both pointing to the first element.
2. Traverse the entire array and determine the index of the smallest item.
3. Swap the smallest item with the placeholder.
4. Repeat until placeholder is at the last element.
Selection has a complexity of O($n^{2}$). Really, it has complexity of:
$n + (n-1) + (n-2)...+ 1 + 0$ 
By Gauss's theorem, this is actually $\frac{n(n+1)}{2}$ = $\frac{1}{2} (n + n^{2})$
We can ignore the constants when dealing with magnitudes of complexity, so this is in fact O($n^{2}$).

This is not great considering most sorting algos take $O(n * log (n))$

#### Quick Sort
As long as one item is in the correct position, we can recursively place items correctly until sorting is complete.
1. Choose a "pivot" value
2. Recursively look at the upper and lower halves of the current frame and do the same
3. When the subproblem is 1 item, it is already sorted and we can return.
```
#Version 1 (Hoare's):
def partition(array, start, end):
    pivot = array[start]
    low = start + 1
    high = end

    while True:
        while low <= high and array[high] >= pivot:
            high = high - 1

        while low <= high and array[low] <= pivot:
            low = low + 1

        if low <= high:
            array[low], array[high] = array[high], array[low]
        else:
            break

    array[start], array[high] = array[high], array[start]

    return high

def quick_sort(array, start, end):
    if start >= end:
        return

    p = partition(array, start, end)
    quick_sort(array, start, p-1)
    quick_sort(array, p+1, end)

#Version 2 (Lomuto's):
def partition(array : list, start : int, end : int) -> int:
    # store a pivot value stored at array[end]
    pivot : int = array[end]

    # establish position trackers at start of sub-problem
    index : int = start
    pivot_index = start

    # this loop does not include the pivot
    while (index <= end - 1):
        # if an item should be to pivot's left, move it
        if (array[index] <= pivot):

            # swap items at the position trackets
            array[pivot_index], array[index] = array[index], array[pivot_index]

            # increment if a swap occured
            pivot_index += 1
            
        # always increment index
        index += 1
        
    # after pivot index is correctly set, swap it with the actual pivot
    array[pivot_index], array[end] = array[end], array[pivot_index]
    return pivot_index
```

One drawback of quicksort is that some conditions can cause the complexity to become O($n^{2}$) (i.e. if the pivot is at the end of the array)
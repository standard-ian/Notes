Jan 21 2025
Week 3
"Learning Programming Languages"

Linux Quiz - Thursday January 23 2025

First Midterm is Week 5 - February 4 2025

Python:

    Major diffs:
        none instead of nullptr
        dynamically typed - no assigning data types in code
        no function overloading
        functions can be nested
        no int main(void){} required
        input can also prompt the user
        not in control of the memory, everything is a reference

Rethinking variables:
    an object can have a name or no names or many names
    a variable name associates to an object
    a = b means a is now associated with the same object as b
    THE PROGRAMMER IS NOT IN CONTROL OF THE MEMORY

Mutable vs Immutable:

    Immutable:
        cannot be changed
        copied when changed
        strings, args, tuples

    Mutables:
        lists, class objects

Strings:
    []operator can be used to access elements
    [-1] to last element

Lists:
    list is mutable
    lists can be mixed data types
    like strings, can be used with a range, i.e. list[0:2] is the first 2 elements

Arguments:
    In python, if the arguments are mutable, they can be changed in the function. If they are imutable, they are "passed by value"
    Otherwise things like class objects and lists can be changed by functions

Specifications:
    Defines a contract between the implementer of a function and the client.

    It consists of 1. Assumptions: Conditions that must be met by the client
                   2. Guarantees : Conditions that must be met by the function itself

Slicing:
    used to extract sub sequences of arbitrary length.
        i.e:

        some_sequence[start:end]
            or
        'abc'[1:3] = 'bc'
        'abc'[:] is equivalent to 'abc'[0:len('abc')] because ommited values default t0 0:end


Structured types, mutability, and Tuples:
    Tuples are an ordered sequence of elements, like a string but they need not be chars

    Tuples can contain other tuples, they can be concatenated, indexed, and sliced
    Tuples are not mutable

    You can extract multiples, i.e.:

        x, y = (3, 4)

    Lists are like tuples, but mutable. They are less effcient because they are not RO

    can avoid changing the original list by slicing a copy,

    i.e.:

    a = [3,4,5], for i in a[:]

    List comprehension:
        allows modification of existing list into one where a modification is applied to each element.
        i.e.: L = [x**2 for x in range(1,7)]

        Strings, Tuples, and Lists can all be operated on as follows:

        seq[i] returns the i th element in the sequence.
        len(seq) returns the length of the sequence.
        seq1 + seq2 returns the concatenation of the two sequences.
        n * seq returns a sequence that repeats seq n times.
        seq[start:end] returns a slice of the sequence.
        e in seq is True if e is contained in the sequence and False otherwise.
        e not in seq is True if e is not in the sequence and False otherwise.
        for e in seq iterates over the elements of the sequence.

Functions as objects:
    Functions are first class objects, they have types and assgnability, can be elements
    can be used as arguments in other functions

Dictionaries:
    syntax: dict
    like lists, but indicies can be any immutable type, known as keys. no order.

Exception Handling in Python:
    uses try: and except <exception type>:

    i.e.:

    def getRatios(vect1, vect2):
        """
        Assumes: vect1 and vect2 are lists of equal length of numbers
        Returns: a list containing the meaningful values of
                vect1[i]/vect2[i]
        """
        ratios = []
        for index in range(len(vect1)):
            try:
                ratios.append(vect1[index]/float(vect2[index]))
            except ZeroDivisionError:
                ratios.append(float('nan')) #nan = Not a Number
            except:
                raise ValueError('getRatios called with bad arguments')
        return ratios

Assertions:
    Used to confirm an expression evaluates to true, otherwise throws an exception
    "AssertionError"
    Useful for debugging




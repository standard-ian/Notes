February 6 2025
Week 5
Operators in Hierarchies

When you have a member function, it can be called with `object.function_name()`
the data type of `object` is not type converted implicitly. This means that the function's name is located by the compiler based on the the data type. 

If we say `function_name(object)` and it is a non member function, the compiler may do implicit type conversion

Unless the constructor has the keyword `explicit` in front of it, writing a constructor provides the compiler with a means of implicit type conversion from the argument to the object of the constructor.

In terms of operators, this means friend (non member) functions are needed for any overloaded operator with non-class type operands
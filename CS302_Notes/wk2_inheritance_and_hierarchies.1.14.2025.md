Jan 14 2025
Week 2
"Inheritance and Hierarchies"

Public Derivation:
    All base class members directly available to the base class

Protected Derivation:
    All public methods can be used by the derived, but the client cannot access directly

Private Derivation:
    The inheritance stops at this class. using this increases complexity and it should be avoided for the most part.

A derived class always has access to the bases public and protected, no matter the derivataion type.

Assignment operator must be overloaded for every class that manages dynamic memory.

Function overloading is limited to a single class scope.

If a class manages dynamic memory, default constructor, copy constructor, and overloaded asignment operator must be implemented

Copy constructors make a deep copy and initialize an object. Assignment operator must release dynamic memory and avoid self assignmnt.
THEN, deep copy the data (same code as copy constructor), then return the current object.

"Modern C++":
Modern C++ means emplasizing features that are more memory safe and use less C styple concepts

Use Braced initialization
Use nullptr, not NULL
if statement intit - if (initialization; condition)

range based for loop:
    for (auto item : container_name)
        item.do_stuff();

    can also be used with a reference on the iterator to modify or work with the data, not a copy

auto will allow compliler to determine data type. use sparingly

Some containers in the Modern C++ STL (Standard Template Lib):

Templates, Iterator Classes, Containers

Arrays are faaster and use less memory than vectors, but not easily resizable


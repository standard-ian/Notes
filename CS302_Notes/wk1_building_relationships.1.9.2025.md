Jan 9 2025
Week 1
"Building Relationships"

Getting Started w/ Inheritance
The goal of this course is to learn to build multiple classes with distinct responsibilities that can simplify the code.

Relationships:
    Using
        > object exists w/o being included in a clas hierarchy

    Containing ("has-a")
        > i.e. linked list contains a node object, "node" object contains a data object
        > only public functions are accessible, private data only through these

    Specialization ("is-a")
        > can avoid building wrapper functions to gain access to the contained
        > create a derived object, and the public methods from the base classes are available

        Address Book            given the function "book.change_address(arg)" at the Address Book level,
             | (contains)       we'll go to the derived Person class that makde up the book. Not finding the
        -----------             change address funtion, we go to the Address class one hierarchy lower, and find the
          Person                correct function using function overloading to match args and use the right version.
             ^                  function overloading is limited to withing the scope. usage: class <derived> : public <parent>
             | (derived)
          Address               class Person : public Address {};
             ^                  class Address : public Name {};
             | (derived)        class Name {};
           Name

    Classes should have a specific job and not be too specific or general

    Classes can be derived from any other C++ class.

    Derived class with only a single parent creates SINGLE INHERITANCE HIERARCHY

    Derived class always has access to the parents public and protected members

    Use public derivation to allow public methods to be used DIRECTLY by the client of the derived class.

    When a base class and a derived class have the same method, the derived will be used, unless the base scope is specified (Base::method)


Design Steps for Multiple Classes (Example: Property Search Software)
    1. List all the nouns
        i.e:   Location - address, city, state, zip, neighborhood
               Propery - size, rooms, bathrooms, type
               Financial - rent, own, taxes
    2. Group related items
        i.e. Differences belong in the derived classes. (single inheritance)
    3. Push up the commonalities to the base class
        i.e. Common properties are pushed to the "Location" base class
    4. Ensure each class has a job to do
        i.e What is each derived class going to do?
    5. Avoid getters when posible
    6. Data should not be public

Initialization List
    A derived class with a constructor that has an argument should have and initialization list to cause the non-default constructor of the base class to be invoked.
    Without this, the default constructor of the client class is used
    usage: Property(const char *name) : Location(name) {}

Copy Constructor
    The purpose is to copy the data members, this creates a shallow copy, we want deep copies for pointers to dynamic memory.

    Anytime a class manages dynamic memory, a copy constructor is needed, this in turn, needs an initialization list

Assignment Operators and Overloading:

    1. check for self assignment - if (this == &source) return *this; if this pointer for current object matches address of source
    2. de-allocate to make sure we don't leak memory. "correct way to overwrite".
    3. if there is source data to allocate and copy, make the copy using the 'new' keyword.
    4. return *this

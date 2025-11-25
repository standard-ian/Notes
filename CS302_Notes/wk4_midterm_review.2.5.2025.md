February 5 2025
Week 5
"Midterm 1"

Objects are characterized as having state, operations, and identity.

Reading Journals:
    -Rules of abstractions:
    1. design functions and classes such that they can be used without knowledge of the underlying implementations
    2. create a good interface to interact with  the object, one that does not commit to the implementation
    3. good abstraction of ojects  makes code more re-usable and perform with greater longevity
    4. objects should create methods of interaction with their data and not share it directly. this allows error checking to be built in

    -"Has a" (containing) vs "is a" inheritance relationships:
    containing relationships are when one object has another as a part of it. for example a window has a button. inheritance relationships involve a base object retaining shared properties, while derived objects take everything the base has and then add some functionality or data, while still having access to the base (if public/protected)
    -Reuse
    programs should be designed so that classes, algorithms, and data structures can be re-used. this can be achieved by avoiding overly specific code, good design, and follwing rules of abstraction. the standard template library contains excellent examples of reusable interfaces.
    code is rarely used for just one project
    reuse saves time and money and reduces duplication
    imlementation should not be exposed, only a clear and sensible interface
    avoid combining logically unrealted concepts
    divide the program into subsystems

    -Garbage Collection
    refers to the idea of memory being managed (i.e. does the compiler/system automatically allocate and deallocate heap memory, or does the programmer have to do this?)

    -Common Memory Pitfalls
    1. underallocating strings
    2. accessing out of bounds memory
    3. memory leaks (i.e. losing the "handle" to memory)
    4. double free and invalid alloc/delete

Review Powerpoint:
    -Building Inheritance with Abstractions
    relationships available - using, containing, inheritance
    getters mean the object is not managing its own data, and it is being shared without a good interface
    on object may spontaneously change if access to its data is not through the objects own methods/interface
    a hierarchy allows an object to retain shared/common properties, while allowing unique implementations (derivations) to exist on top of those existing base properties .

    -Diffs between Python and C++
    python is dynamically typed (at runtime) by the interpreter. C++ is a stringly typed, compiled language. this affects the rules and syntax around memory, data types, inheritance, object creation, and mutability
    dynamically typed means the type of variable does not need to be known at compile time. the programmer does not need to specify the type of every new variable. instead, it is decided by the interpreter based on the context and usage in the code.
    syntax differences: indentation, colon for loops & functions, no need to type, no do while loops, for loop syntax, main is declared as follows:
    if __name == "__main__":
        main()

    -Single Inheritance
    base class contains shared methods, values. generic and may not contain specific of the derived classes, just what they have in common
    derived classes inherit EVERYTHING. they literally are the base + more
    derived classes can access public and protected sections of the base
    client still only has access to public section
    members/methods of the derived class w/ same name as those in the base class will hide the base components from the compiler. They can be explicitly accessed with the base class name and the scope resolution operator i.e. Base::same_name();

    -Copy constructors and assignment operator
    initializes a new object to the values of another object of the same type. ideally the resulting object should be a deep copy, and not point to the same object as the source. this will need to be manually done if the object manages dynamic memory.
    important because one is always created for every object, but it only does a memberwise copy. if the object contains pointer, the default will set these pointer to the same memory, resulting in double free or other undefined behavior
    making an intentional copy (explicitly calling it), returning/passing by value invokes the copy constructor. STL templates and other re-used code may do this, so objects used in these containers should consider this behavior

Lab manual:
    -Lab2 C++, stl, inheritance
    derivation list class derived : public base
    a derived class constructor needs an initialization list in the default contructor and when the base class manages dyanamic memory and we want to explicity invoke its copy constructor
    vector stl functions: resize() push_back() overloaded [], "at", erase(), clear(), swap() -swaps contents of 2 containers, reserve(), begin(), end(), emplace, append_range(),
    string functions: length(), compare(), overloaded +, append(), copy()

    -Lab3 python
    print with + does not insert automatic space, just concatenates the strings
    print() with no args prints a newline
    print("\n\n\n") prints 4 newlines
    while loop in python has no {}, uses indentation and :
    while condition:
        if condition2:
            #do stuff
            break
    else:
        #do stuff if !condition2

Topic #1 - Abstractions
    Delegate specific responisibilities to each object
    Objects have state, operations, and identity
    An objects state may change over time, but not spontaneously. Operations must be performed through methods.
    OOP specifies the operations an object can enact on its identity, changing its state in a defined way.
    Inheritance models a "subset" relationship
    A class is simply an abstract data type
    We assume an object has no insight into the structure of another. They interact through well designed interfaces.
    Three relationships are:
        1. Use/awareness
        2. Aggregation/containment - "has a"
        3. Inheritance/specialization
    Class should not describe a single object, but collect objects with related behavior
    Recognize commonalities for good inheritance
    Consider relationships at design time to ensure quality and save time later on
    Eliminte classes with too few operations, split up bloated classes
    Responisibilites should stay at the abstraction level
    Classes should be nouns, operations(methods) should be verbs with clear action
    Only return references to objcts that exist priot to the function call
    Classes should have clear purposes and avoid long argument lists.
    Initialization lists belong in constructors and are required in derived constructors that need to explicitly call the constructor of a base class.
    Without this, the default constructor of the base class will be invoked.
    Initialization lists are the only way to tell the compiler which base class constructor should be used when base class constructors have arguments

Topic #2 - Classes and Inheritance
    Client creates an abject of the class type, this invokes a constructor.
    Constructors are expected to allocate memory, destructors to free it.
    A class is a struct with private/protected functionality
    Data should be private
    Member methods for clients should be public
    Member functions are declared in the class interface
    A class is a collection of related objects.

Topic #3 - Modern C++
    Emphasizes reducing C-style concepts - raw pointers, c-style arrays, encourages use of containers
    Objects should manage dynamic mem - constructor and destructor use new and delete
    use nullptr. use {} for init
    use init for loops and conditionals, i.e. for (int element : array_name){\\do stuff};
    auto keyword deduces type - never deduces a reference when used with a function, return type must be clear
    smart pointers - std::unique_ptr<data_type> varname
    iterators  - vector<int>my_list{1,2,3}; vector<int>::iterator item;
    iter = my_list.begin();

Topic #4 - Inheritance
    Function overloading is limited to the current scope. Base class functions will be hidden by derived of the same name, even if argumnents differ
    Only implement a copy constructor when pointers are involved (dynamic heap memory), otherwise the compiler generated default memberwise copy will suffice.
    If you do implement them, they must have an initialozation list to invoke the base class copy constructor
    This is a requirement even if the base class DOES NOT use dynamic memory
    It's good to always write a default constructor, the CC generated one does nothing.
    forbid the copy constrcutor with Object(const Object&) = delete;
    Assignemnt operator should:
        1. Check for self assignment - if (this == &source) return *this;
        2. Deallocate existing dynamic memory owned by "this" -if (stuff_here) delete [] stuff_here;
        3. Deep copy the data (allocate new memory, same as copy constructor) stuff_here = new stuff; copy(stuff_here, source.stuff_here);
        4. Return the current object - return *this;
    can also forbid assignment operator w/ =delete at the end of the prototype.


Intro to Python:
    if __name++ == "__main__"
        main()
    C++ similarities:
        comments, data types, variables, operations, control flow
        relational/equality, break/continue, mod (%)
        classes and single inheritance
    Differences:
        Data types are auto by default
        Varaibles are references to objecs that hold the value
        indentation vs {} for scope
        print("") and input("") vs << and >>
        variables are immutable
        no structure, just write the code
        functions can be nested in their definition
        dynamically typed - no compilation just interpreted at runtime
        no function overloading only care about most recently defined version of a name - same name just overwrites the original
        None instead of nullptr
        floating point div by default. use // for integer
        pass is a nop
        a, b = b, a is completely fine and would swap the values referenced by the variables
        a variable associates to an object, not a memory location
        immutable - cannot be changed (const) faster. copied when changed - strings, arguments, tuples
        mutable - can change the values without copying mem. Class objects are mutable but the address of the object isn't - lists
        string[-1] iis the last element
        lists can be a mix of data types
        def __init__(self): #constructor
            self._stuff = "the stuff"
        def __del__(self): #remove reference to the object
        _ indicates private
        __ indicates public

Pre-Exam Questions:
When you say "where do initialization lists belong?" Do you mean they belong in constructors, or which situations specifically they are needed.
When does a derived class constructor need an initialization list?
If a base class has a default constructor defined explicitly, do we need to call it in out derived classes init list, or will out explicitly defined version be automatically invoked?



### Reading Journals
##### #7
###### Guttag Ch. 6, 16-19
*What is the difference between testing and debugging?*
Testing is running a program to determine what is broken.
Debugging is trying to fix a known problem or something you already know does not work as intended.

*Explain Black-Box testing and give an example in Python.*
This is testing where the test writer has no knowledge of the source code or inner workings of the program. They use a readme or other documentation about how the code is to be used, instead of its implementation to write tests and evaluate what it fails at. 
In general, bounds checking, input validation, and edge cases should be checked here.

*On the other hand, explain Glass-Box testing and give an example in Python.*
This is testing with the intention of trying every path through the code, searching for logic errors or integration issues. These tests are written with knowledge of the underlying code, and should be combined with other testing approaches. It's important to remember that this testing only can test code that's been written and may not account for situations where the programmer overlooked a needed clause.
###### Gregoire Ch. 30
*Describe approaches to unit testing*
1. Keep testability in mind in the design phase
2. Define the scope of tests, granularity and levels of detail examined. Work up from fine to depend on these objects working in a larger context.
3. Brainstorm individual tests, preconditions, expectations, etc.
4. Sample data and expected results. Input data should target edge cases and an example of every possibility the tester can think of.
5. Write tests with specificity so when they fail, they point to a specific object or mechanism.

*What are regression tests?*
Regression testing is returning to test old features when new ones are integrated with them. This helps streamline and automate the process of verifying a new feature, and ensures the old functionality was not broken with something new. These tests should be run after every new integration and will ensure the functionality of old features.
##### #8 Gregoire Ch. 19
*What is the concept of a callback?*
A callback is a callable function object that, usually a first class function of some kind but this could be a first class function, functor, function pointer, overloaded `operator()` or lambda expression.

*What is a lambda expression?*
A small, often one line (in Python, must be 1 line) function right where it is needed. Designed to be temporary in nature, used only generally within the enclosing scope or when defining it as a global or class function doesn't make sense.

*Give an example of the syntax.*
`auto basic_lambda = []{cout << "hello world" << endl;};`
or 
`auto basic_lambda = [](int a, int b) -> int {return a + b;};`

*What does it mean to capture a variable in a lambda expression?*
This means to use the [] at the start of the lambda expression to 'grab' variables either by value, reference, or not at all from the enclosing scope. In Python, this is done implicitly via 'closures'

*Write a function called isLarger as a lambda expression.*
`auto is_larger{[data](int other) -> bool{return other > data;}};`

##### #9 Guttag Ch. 20-21
Conditional probability is using prior evidence to adjust the chances of some related condition being true. `P(A|B)` = probability that A is true, assuming B is true.

Bayes theorem says that probability depends on a degree of belief. This depends on prior evidence. Bayes theorem states $P(A | B) = \frac{P(A) * P(B|A)}{P(B)}$  
Where: 
	$P(A|B)$ = Probability given new evidence
	$P(A)$ = Probability before new evidence
	$P(B|A)$ = Likelihood of evidence if hypothesis is true
	 $P(B)$ = Probability of the evidence

Garbage in garbage out means that if the data in is flawed, the results will be meaningless

### Intermediate Python and Recursion

Immutable variables cannot be changed directly, they are references passed by value unless they are a list or class object.

Adding a node at the end
Remove largest
Return type to reconnect

STUDY Python data structures and recursion - returning the newly modified node
##### Inheritance and Classes
`class Derived(Base):`
Python likes `ThisCaseStyle` for class definitions.
Comma separate multiple parents when using multiple inheritance.
Typehinting `def some_function(param1 : datatype) -> returntype:`
Hint multiple types with `| i.e. def some_func(param : int|str):

All members are public. All member functions must have the argument self. 
`def __init__(self):` to define constructor

Double underscore (dunder) methods and fields are not accessible from outside the class. The interpreter simply does not 'see' them as defined in external context.
Single underscore is not enforced in the same way. It is purely a suggestion like typehinting.
Actually private:
`__private_func()`
`__private_field = None`
No real rules applied:
`_protected_func`
`_protected_field`

use `super().__private_base_method__()`
or `super()._any_base_method()`
To access parent functions. Parent members can be accessed directly.

Python linked lists/trees and recursion
Defining a node Class:
```
class Node:
	def __init__(self):
		self._data = None
		self._left = None
		self._right = None
```

Use pass by pointer to perform recursion with no references.
	
### Parallel Programming
### Functional Programming

STUDY FUNCTIONAL PROGRAMMING LECTURE

Declarative programming is where we specify what the program should do.
An immutable value does not change the core object.
Pure functions have no side effects.
First class functions can be stored, passed, or returned
In C++ all functions are not first class functions, however all functions in Python have the above properties. 
```
def add_nums(x, y):
	return x + y

func = add_nums
print(func(3,2))
```
Higher order functions take functions as parameters or return functions.
Filter, map, and fold are common built-in higher order functions. 
Examples:

Map:
```
#python - called map
# Using map() function result = map(lambda x: x * 2, [1, 2, 3, 4]) # Returns [2, 4, 6, 8]

//C++ - called transform
#include <algorithm> 
#include <vector> 
#include <functional> 
// Using std::transform 
std::vector<int> nums = {1, 2, 3, 4}; 
std::vector<int> result(nums.size()); 
std::transform(nums.begin(), nums.end(), result.begin(), 
				[](int x) { return x * 2; });

or 

// Using std::for_each (modifies in place) 
std::for_each(nums.begin(), nums.end(), [](int& x) { x *= 2; });
```

Filter:
```
#python
# Using filter() function 
result = filter(lambda x: x > 2, [1, 2, 3, 4]) # Returns [3, 4] 

# Using list comprehension (more pythonic) 
result = [x for x in [1, 2, 3, 4] if x > 2]

//C++
#include <algorithm> 
#include <vector> 

// Using std::copy_if 
std::vector<int> nums = {1, 2, 3, 4}; 
std::vector<int> result; 
std::copy_if(nums.begin(), nums.end(), std::back_inserter(result), 
			 [](int x) { return x > 2; }); 
			 
// Using std::remove_if (with erase-remove idiom) 
auto it = std::remove_if(nums.begin(), nums.end(), 
              [](int x) { return x <= 2; }); nums.erase(it, nums.end());
```
Reduce:
```
#python
# Using functools.reduce
from functools import reduce
result = reduce(lambda x, y: x + y, [1, 2, 3, 4])  # Returns 10

# Simple sum without reduce
result = sum([1, 2, 3, 4])

//C++

#include <numeric>
#include <vector>

// Using std::accumulate
std::vector<int> nums = {1, 2, 3, 4};
int result = std::accumulate(nums.begin(), nums.end(), 0, 
                            [](int acc, int x) { return acc + x; });
// result is 10

```
##### Lambda Functions
Inline functions that are first class in both Python and C++
C++:
```
//higher order function that takes a lambda and applies it to every element of a vector, returning the result to the vector.

//lambda uses [] to indicate begining, with optional capture.
std::transform(a_vector.begin(), a_vector.end(), a_vector.begin(), 
               [](int x) {return x + 1;});
```
Python:
```
#uses the lambda keyword followed by a colon

add_one = lambda x : x + 1
a_list = [1, 2, 3]
new_list = list(map(add_one, a_list))
print(new_list)
```
Lambda functions return a compiler generated function type ID in C++. This is different from the value return type specified in the function definition.

Pythons weakness for lambdas is that they must be single expressions (1 line only)

### Java
C++ without some of the harder aspects. No:
	operator overloading
	user defined type conversions
	explicit pointers
	use of delete, new, or destructors
	-> operator or & operator
	pass by reference
Can still dynamically allocate with `new`, but only arrays and class types
int, long, short, etc cannot be dynamically allocated, stack only. 
They're passed and returned by value. 
Class objects and Arrays passed as references (pointers) by VALUE!

C++:
```
1. List object;
2. List *ptr;
3. ptr = new List;

4. int array[5];
5. int *array;
6. array = new int[5];


```
Java:
```
1. Can't do it
2. List ref;
3. ref = new List();

4. Can't do it!
5. int array[]; or int [] array; //no size
6. array = new int[5];
```
In Java, `obj1 = obj2` means two variables are now pointing at the same object. 
We need to create the protected class method `clone()` to perform a deep copy

Everything is part of a class.
Use: `super.funct_name()` to call parent's function
or `super(optional_params)` for parent constructor;
All derivation is public.
Derivation uses single inheritance and derived classes extend the base class.
Dynamic binding is the same as C++, but without the `virtual` keyword.

Clone method is often not used, instead, a copy constructor can be written.

Recursion and Java:
No pass by reference, returning current frame's object to relink on return.
Copy a BST Pass by PointerC++:
```
void copy(node ** dest, node *source)
{
	if (!source)
		return;
	*dest = new node(*source);
	copy(&(*dest) -> get_left(), source -> get_left());
	copy(&(*dest) -> get_right(), source -> get_right());
}
```
Copy a BST Java:
```
protected node copy(node source)
{
	if (source == null)
		return null;
	node root = new node(source);
	root.set_left(copy(source.get_left()));
	root.set_right(copy(source.get_right()));
	return root	
}
```
Java interface: 
Interface means something different in Java. It is like an ABC. We cannot create objects of an interface.
Interface is implemented rather than extended.
Interface can be extended from another interface.
```
interface Stack
{
	public Void push(data to_add);
	public data pop();
	this.root = copy(source.root);
}

class my_list implements Stack
{
	protected int top = 0;
	protected list;
}
```
Generic Programming:
Can create a template that can be used with different objects.
Generics don't work with primitive types, so class types that represent them have to be used.
Operators will work with references to objects, not the objects themselves. For example, == will compare locations (addresses) in memory.
```
class General<T>
{
	private T data;
	public General(T data)
	{
		this.data = data;
	}
	public T Process()
	{
		return this.data;
	}
}
```
### Testing and Verification

STUDY how to write a pytest:
	with raises
	mark_parametrize
	fixture
	
STUDY test driven design
Write tests so that they test one specific thing (unit)
White box testing uses logical evaluation to test paths through the code as a whole
Differs from glass box in that it can simplify the path by only testing logical flow

Glass box should test every path through the code

Black box testing is done without knowledge of the code

##### Defensive Programming
Understand what is required, develop a written specification. Without this it's impossible to tell if programs are doing what is intended. 

Develop software in a way that it can be tested. This starts with modular programming, and incrementally building the software so you can do unit and systems test along the way.

Testing and debugging are not the same. 

Testing is the process of running a program to determine if it does what it is supposed to do,
Debugging is fixing code that doesn't return the expected result.

#### Types of testing
##### Black box testing: 
Develop tests based solely on the specification document, no knowledge of the code

Should test boundary conditions without knowing what types of loops or other syntax constructs are used
These tests should be written before writing the code! Assumptions will be made based on the specification

Example: 
```
Online store 
	- purchase $500, get 5%
	- purchase $1000, get 7%
	- test for positive/negative inputs
	- test 0-499, 500-999, 1000+
	- calculate intended results
	- more than $3000/mo, additional 5% is applied
	- now need to test multiple inputs and agregate the total
	- as specification gets more complex, it introduces ambiquities
	- we need to clarify these BEFORE writing software by asking client questions
```

##### Glass box testing:
Start off with input, and knowledge of the code and make sure every single path through the the program gets "exercised"

Are flags correct? Are logical flow statements directing control correctly? Are the correct values kept and used?

##### Integration Testing:
Test your program as a whole and to make sure that the interactions between the different
pieces work as expected. If it doesn’t, then go back to unit testing
"scenario testing” and  mix of automated tests and manual tests
##### System Testing:
Checking for errors throughout the entire program, making sure the software works as intended with all edge cases.

### Previous Topics
##### Dynamic Binding
Done because we want to call one of many different functions with one line of code.
Upcasting: `Base *ptr = new Derived()`Base class pointer or reference to a derived class
Done to have a single mixed data structure of derived objects (stored as upcasted references/pointers)
Downcasting to identify the class at runtime: `Derived *d_ptr = dynamic_cast<Derived *>(ptr)`
 A `Derived` is a `Base`
 
##### RTTI and Abstract Base Classes
Downcasting is copying a base class pointer/reference to a derived class pointer/reference to determine type. Use `dynamic_cast<Derived *>`
Done to identify what derived type was originally upcast, this is called RTTI
`derived d_ptr{dynamic_cast<derived *>(base_ptr)`

Abstract Base Class - A base class that can be inherited from, and cast to, but not instantiated on it's own.
Having at least one pure virtual function and using dynamic binding makes a class an ABC `void pure_virt_func(args) = 0;`
Pure virtual functions are not implemented in the base class, but should be implemented in the derived classes.

Virtual Helper Member Functions - non-member functions like operator<< can use a virtual overridden member function which is called to perform the desired derived class operation
STUDY THIS SYNTAX!!
Overload the operator for the base, and override a helper function.

Study downcasting! Use dynamic case instead of static so the pointer we cast to is null if it is not the type we want. Focus on upcasting and downcasting, as well as ABC.
##### Operator Overloading
`this_class & this_class::operator=(const tree &source);`

Cast the derived object to the base and assign it the source
Compiler will use the data type of the first operand to determine the scope!
`static_cast<base &>(*this) = source;`
or
`base::operator=(source);`

For a non-member operator
`out << static_cast<const base &>(second_operand);`

STUDY operator+= implementation and other operator overloading implementation
```
Class_object& operator +=(Class_object &operand2)
{
	desired_field += operand2.desired_field;
	return *this
}
```
STUDY how to invoke a non-member parent's operator i.e operator<<

lvalue returns by reference
rvalue returns by value 
lvalue can be on the left hand side of an assignment operator
lvalue must be a member operator
binary operator has 1 arg as a member
unary operator has 1 arg as a non member
`+ and != ` are rvalue operators
check for self assignment with `if (this == &op2)`
##### Templates
##### Exception Handling
If an exception is thrown that isn't directly within a try block, the exception is thrown back to the place the function was called. It allows the error detection to happen in a different place from error handling. 

`catch(...)` means catch all. It should go after all other catch item.
When using raw pointers local to a function and dynamic memory is allocated. in the function, then an exception is thrown. This will cause the stack frames to pop off and cause the destructor to not be properly called. Stuff should all be in classes or using stl memory management, so those class constructors and destructors manage the use of `new` and `delete`

##### Python Basics
##### Modern C++
##### Inheritance
Derivation list: `class Derived : public Base`
Initialization list used to kickstart the base class copy constructor
To cause a base class's assignment operator to be invoked: `Base::operator=(source);`
Without this, the base class data members will remain whatever they were before.

Implement a copy constructor explicitly to be clear about the behavior of the CC
Copy constructor needs an initialization list anytime we're in a derived class. ANY time it is a derived class. 
Without this, base members are initialized to default.

Copy constructor for a tree class:
```
tree(const tree&);
tree(const tree &source) : base(source) {}
```
`
##### Building Relationships C++
Use a loop to traverse a LLL to the end and do something. 
How to remove the last node from a LLL iteratively

BST algorithms

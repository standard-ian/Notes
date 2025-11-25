### Generic Programming ##### Templates
Polymorphic containers who's data types can be instantiated on declaration.

Generally used to create polymorphic containers and allow general code to be written only once for a structure to be used with a variety of data types.

Templates can be declared and defined as follows:
```
//class declaration
template <typename T> //formal argument list includes type dependencies
class My_Template_Class{
	public:
		/...
};

//constructor or another function
template <typename T>
void My_Template<T>::My_Template();

template <typename T>
int My_Template<T>::class_function(const T&);

//function
tempate <typename Q>
bool template_function(const Q&);

```
Operator overloading and templates go hand in hand because the template needs to be able to interact with the underlying data in a standardized way.

Operators and their commonly understood meanings allow the template to used the same operators for different actions without any knowledge of the underlying object's named functions.

Implementing:
```
template <typename DATA>
class Node{
	public:
	private:
		DATA data;
	}; `
```
Allows for polymorphic containers made up of these nodes
##### Operator Overloading
Operator overloading refers to defining the properties of operators (+, =, !, <, etc.) as they apply to a certain object by writing functions with. One of the operands must be of the type of the object.
Cannot change the number of operands, the precedence, or use default arguments.

Should not change the meaning of the operator, its nature, data types, if it is r or l value, or change residual value.

Non member operators should be overloaded as friends.

`left_hand& operator+=(type &right_hand);
of
`some_other_type& operator+(operand &left, operand2 &right);`

Operator overloading allows for polymorphism to invoke object methods with a generalized syntax and promotes reuse and polymorphism and of objects.

### Dynamic Binding
##### Dynamic Binding Rules and Steps
1. Use `virtual` in the base class functions you plan to dynamically bind and that will have the same signature, but perform unique operations throughout the hierarchy as well as the base class destructor.
2. Have a self similar function signature for the overridden functions throughout the hierarchy.
3. A single inheritance structure
4. Perform upcasting with a pointer or reference.
##### Upcasting vs. Downcasting
Upcasting - assign a derived object to the pointer or reference of a base class object.
`const Base &base_ref{Derived()};`
of
```
Derived derived_object;
Base &base_ref{derived_object};
```
or
`Base *base_ptr{new Derived()}`
or
```
Derived derived_object;
Base *base_ptr{&derived_object};
```

Down casting - making a derived class copy of the upcasted object

`Derived *d_ptr{dynamic_cast<Derived*>(base_ptr)}`
or
`const Derived & derived_ref{dynamic_cast<const Derived &>(base_ref)}`
Used when a container of or single base pointer or reference is an upcasted pointer or reference and it needs to be determined what derived object the ref/ptr is.
##### RTTI
Using down casting, then checking the existence of the downcast pointer to determine if the object matches that derived type.
```
Derived_Type1 *d1_ptr{dynamic_cast<Derived_Type1*>(base_ptr)};
if (d1_ptr){
	d1_ptr -> display();
}
Derived_Type2 *d2_ptr{dynamic_cast<Derived_Type2*>(base_ptr)};
if (d2_ptr){
	d2_ptr -> display();
}
Derived_Type3 *d3_ptr{dynamic_cast<Derived_Type3*>(base_ptr)};
if (d3_ptr){
	d3_ptr -> display();
}
```

### gdb, Linux, Vim

### Reading Journals
##### Gregoire:

###### Week 4 (Chapter 9):
1. What does it mean to "Provide operator overloading as a service to your clients"?
		Provide a "universal" method of interacting with the objects you create. One that follows syntactical and semantic conventions
        Make your class simpler for the person using it.
2. What does "nodiscard" mean placed prior to the return type of a function in C++20
		caller must use the return type
        The compiler will not allow the return value to be ignored. Especially useful with some operators becase their return value is how they communicate information back to the caller
3. In what situations can compiler-generated comparison operators be useful and what do we need to do to makes sure these are available for use?
        `operator==`  and `operator<=>` can also be defaulted (Compiler writes them for you) by doing memberwise comparison
		`[[nodiscard]] std::partial_ordering operator <=>(const My_Class&) const = default;`
        will explicitly default <=> AND == (implicitly) as long as all members have an accessible `operator==`

###### Week 5 (Chapter 12):
4. Discuss class template argument deduction and give an example of code that uses this.
    Compiler can deduce template params.
    `pair <int, double> pair1 {1, 2, 3};`
    to avoid writing the type parameters explicitly using a `make_pair()` function.
    `auto pair2{make_pair(1, 2, 3)};`
    or, with CTAD, compiler automatically deduces types based on the constructor arguments:
    `pair pair3 {1, 2, 3}`

5. Explain the process of class template specialization.
    Creates a specific type version of the template.
    use this syntax (note empty <> at template and explicit data type after `Some_Class`):
    ```
    template<>
    class Some_Class<const char*>
    ```
    Which tells the compiler this is a specialization of the `Some_Class` template
    You must then re-write the entire implementation. There is no inheritance of the original class's code.

6. What do we need to be careful about with the return type of function templates?
    The type may not exist (use std::optional) for certain operations, or the return type may be an actual template object instead of the template definition
    If the template mixes the data types and returns that, how can we determine what this is?
    You can use `auto` as the return type, but this strips away const qualifiers
    or `decltype` which does not.
    or , if returning T1 + T2, maybe:

    ```
    template <typename T1, typename T2>
    decltype(std::decval<T1>() + std::declval<T2>()) add (const T1& t1, const T2& t2){
        return t1 + t2;
    }
    ```
7. What does it mean to have a type constrained auto?
    Type constraints can be used to constrain variables defined with `auto`
    The data type being assigned to the `auto` varible must adhere to the Concept preceding:
    `Incrementable auto value1{1};`
    would compile because 1 is an incrementable int, while:
    `Incrementable auto value{"abc"s};`
    will not because a string is not Incrementable

###### Week 6 (Chapter 10):
8. Explain what Gregoire means by the justification for the keyword `virtual`.
9. What is the need for virtual destructors?
    If destructors are not `virtual` in an inheritance structure and a derived class uses dynamic memory, or managed pointers, when the Base destructor is deleted, if it contains the memory of a Derived object (upcast) then it will not free the Derived memory because it "doesn't know" about that function.
    If the base destructor doesn't need to do any work, it can still be explicitly marked virtual:
    `virtual ~Base() = default`
10. Explain the difference between upcasting and downcasting?
    Upcasting - Storing a derived object in a base pointer/reference.
    ```
    Derived derived_object;
    Base *b_ptr{new derived_object};
    b_ptr -> overridden_funct();

    or

    Base **b_ptrs[10];
    for (i = 0; i < 10; ++i){
        int type{};
        cout << "\nChose a type (1/2):";
        cin >> type;
        cin.ignore(100, '\n');
        switch (type){
            case 1:
                b_ptrs[i] = new Derived1()
                break;
            case 2:
                b_ptrs[i] = new Derived2()
                break;
            default:
                break;
        }
    }
    for (auto item : b_ptrs)
        item -> overridden_funct();

    or

    Derived new_derived;
    Base & base_ref{new_derived}
    base_ref.overridden_funct();
    ```
    Downcasting - making a copy of the base pointer or reference that is cast to the Derived Class:
    ```
    const Derived& d_ref{dynamic_cast<const Derived&>(base_ref)};
    Derived *d_ptr{dynamic_cast<Derived *>(b_ptr)};
    ```
11. Explain how Gregoire explains that an abstract base class can prevent some actions.
    An abstract base class prevents an instance of that class from being instantiated. It forces the derived class to implement it's pure virtual methods.



Jan 27 2025
Week 4
"Operator Overloading"

Defining how operators work with our class.
We can use operators instead of working with named functions
Using an object with a template requires the use of overloaded operators so we need to provide this functionality if we want our objects to feel built into the language.

We can also implement the assignemnt operator properly. The default version does a memberwise (shallow) function which can lead to seg faults/double frees.
lvalue means we control the value of the memory

Assignment:
    overloaded as a member, and modifies the current object
    binary operator (2 operands)
    return by reference
    has 1 argument (the second operand)
    doesn't modify the argument

    class class{
        public:
            object& operator=(const class &object);
    };

    object& class::operator=(const class &object){
        //check for self assignemnt
        if (this == &object)
            return *this;

        //check for existing memory
        if (data_member)
            delete [] data_member;

        //perform copy & assign new memory if needed
        //this could be a member functions
        data_member = new data_type
        //copy

        //return dereferenced this pointer
        return *this
    }


Insertion/Extraction:
    overloaded as non-members because they are members of c++ "stream" classes
    they will be "friend" functions
    binary operator (2 operands), but non member function, so 2 arguments
    return value will a reference to the istream/ostream object!
    second argument should be constant reference
    friend function prototypes can sit in the public section of the class declaration
    friend allows the private data members of the class to still be accessible

    class class{
        public:
            friend ostream& operator<<(ostream &out, class &object);
            friend istream& operator>>(istream &in, const class &object);
        private:
            char *str;
            int len;
    };

    istream& operator>>(istream &in, class &object){
        //read into temp static memory
        char temp[SIZE];
        in >> temp; / in.get(temp, SIZE, "\n");
        in.ignore(100 '\n');

        //assign new memory and perform copy to object
        object.len = strlen(temp);
        object.data_member = new char[object.len + 1];
        //copy
        strcpy(object.str, temp);

        return in;
    }

    ostream& operator<<(ostream &out, const class &object){
        out << object.data_member; //no whitespace
        return out;
    }

Plus/Plus equals:
    for string/char* interaction: string + string, string + char*, char* + string
                                  string += char*, string += string
    rvalue operators must return by value (all arithmatic +, -, *, /, etc)
        these do not modify the operands
    lvalue return by reference (+=, -=, *=, %=, etc)
        these DO modify the first operand
    the arithmetic operators with the class object as the left operand are NOT member functions (instead friend functions) because it allows for type conversion to properly take place for BOTH ARGUMENTS.
    as a member function, only one object (the argument) will type convert.
    any time there is a version of the operator with a non class type as the first argument, ALL versions of that operator declaration should be NON-MEMBER

    class class{
        public:
            friend class operator+(const class &left, const char *right);
            friend class operator+(const char *left, const class &right);
            friend class operator+(const class &left, const class &right);
            class &operator+=(const class &in);
            class &operator+=(const char *in);
        private:
            //explicit constructor can skip copy constructor
            //be careful about using this & make it private
            explicit class (char*)
    };

    //makes multiple copies of temp as it returns by value
    class operator+(const class &left, const char *right){
        class temp;
        temp.len = left.len + strlen(right);
        temp.str = new char[temp.len + 1];
        strcpy(temp.str, left.str);
        strcat(temp.str, right);
        return temp;
    }

    //less copies, relies on explicit copy constructor. won't always be safe
    class operator+(const class &left, const char *right){
        char *temp = new char[left.len + strlen(right) + 1];
        strcpy(temp, left.str);
        strcat(temp, right);
        return class(temp); //explicit copy constructor
    }

    //lvalue, safe and more ideal. use class1 += class2 over class1 = class1 + class2
    class& class::operator+=(const class &in){
        len += in.len;
        char *temp = new char[len + 1];
        if (str)
            strcpy(temp, str);
        strcat(temp, in.str);
        delete [] str;
        str = temp;
        return *this;
    }

Relational/Equality:
    if you implement 1, implement the whole set
    neither operator is modified
    overloaded as non member functions, if overloaded as a member, should be const
    rvalue operator, but no copy constructor as return in bool/int
    these all use a compare function and will be very few (usually ~1) lines of code.

    class class{
        public:
            friend bool operator<(const class &left, const char *right);
            friend bool operator<(const char *left, const class &right);
            friend bool operator<(const class &left, const class &right);

            friend bool operator<=(const class &left, const char *right);
            friend bool operator<=(const char *left, const class &right);
            friend bool operator<=(const class &left, const class &right);

            friend bool operator>(const class &left, const char *right);
            friend bool operator>(const char *left, const class &right);
            friend bool operator>(const class &left, const class &right);

            friend bool operator>=(const class &left, const char *right);
            friend bool operator>=(const char *left, const class &right);
            friend bool operator>=(const class &left, const class &right);

            friend bool operator!=(const class &left, const char *right);
            friend bool operator!=(const char *left, const class &right);
            friend bool operator!=(const class &left, const class &right);

            friend bool operator==(const class &left, const char *right);
            friend bool operator==(const char *left, const class &right);
            friend bool operator==(const class &left, const class &right);
    };

    bool operator<(const class &left, const char *right){
        return (strcmp(left.str, right) < 0);
    }
    bool operator<(const class &left, const class &right){
        return (strcmp(left.str, right.str) < 0);
    }

    //now that the above is implemented, we can use it in other implementations
    //okay because no modification/calling of copy constructor

    bool operator>=(const char *left, const class &right){
        return (right < left);
    }

Subscript:
    operator1[operator2]
    must be implemented as member function
    first operand must be argument of the class
    since the first operand is not modified, the function should be const
    residual is an lvalue
    residual value should be data type of the element of the "array", by reference
    does not modify operands

    class class{
        public:
            char &operator[](int index) const;
    };

    //don't provide this operator if you don't want the client accessing private data
    char& class::operator[](int index) const{
        return str[index];
    }

Function Call:
    () or function call operator;
    this is the only operator we can overload with as many argments as we want.
    argument modification, residual data type, const/not all depend on application
    only operator w/ this flexibiltiy
    often used for matricies

    return type class::operator()(arguments);

    float & matrix::operator()(int row, int col) const;

Increment and Decrement:
    ++prefix, postfix++
    unary, no arguments, member function

    prefix:
    residual is lvalue
        counter& counter::operator++()
        counter& counter::operator--()

    //ZERO copies made
    counter& counter::operator++(){
        //add 1
        return *this;
    {

    postfix:
    residual is rvalue different from current object (pre-incremented)
    must return by value
    unused argument of int to differentiate from prefix
        counter counter::operator++(int)
        counter counter::operator--(int)

    //this makes a lot of copies;
    counter counter::operator++(int){
        counter temp(*this)
        //add one to current object
        return temp;
    }

Inheritance and operator overloading:
    derived class functions of the same name as base class functions HIDE the base cass functions, unless explicitly called with the scope resolution operator.
    so, any operator in a derived class hides the operator in the base class
    nearly every class has a default:
        copy constructor
        default constructor
        assignemnt operator

    these default things DO NOT do a deep copy for dynamic memory.
    overloading operators in most other cases behave like any other function

    we must think about what the classes job is and how it relates to the use of overloaded operators.

    the division of labor is needed for true OOP.

    using initialization lists is still needed to kickstart parents.

    best option to access base class operators:

    derived_class & derived_class::operator=(const derived_class &source){
        base_class::operator=(source);
    }

    the derived class should not be doing the job of the base class.
    it should be "kickin" the work down to the base class with above method

    within a class, the operator can be accessed with the "." operator

    for non members


    Member operators:
        +=, =, [], ++
    Friend functions:
        these HAVE to be:
            <<, >> becasue they are istream/ostream
        these should be if an instance w/ 1st arg not the class object type:
            +, -, *, \, %
            <, >, >=, <=, ==, !=
        friends are NOT inherited.
        if we use the derived comparison operator, we  still want to kickstart the base
        but it is not a member, so we use:

        bool operator<(const char *left, const derived_class &right){
            if (left < static_cast <const base&>(right))
        }

        base non-member function:
        ostream& operator<<(ostream &out, const base_class &object){
            out << static_cast <const base_class &>(object);
        }

        suggest comparison member function for which the operators are just a wrapper.
        then we can access the compare function through one of the operand's "compare: member function.
class todo_item
{
    public:
        todo_item();
        todo_item(const todo_item&);
        ~todo_item();
        todo_item& operator=(const todo_item&);

        friend ostream& operator<<(ostream&, const todo_item&);
        friend istream& operator>>(istream&, todo_item&);

        friend bool operator==(const todo_item &left, const todo_item &right);
        friend bool operator==(const string &left, const todo_item &right);
        friend bool operator==(const todo_item &left, const string &right);

        friend bool operator!=(const todo_item &left, const todo_item &right);
        friend bool operator!=(const string &left, const todo_item &right);
        friend bool operator!=(const todo_item &left, const string &right);

    protected:
        char *name;
        int priority;
};



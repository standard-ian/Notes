Jan 30 2025
Week 4
"Templates and Generic C++ Programming"

Function template:
    writing a function once independent of data types
    Parameterization of type dependancies that allows the compiler to generate as many overloaded functions as needed.
    A general purpose template is called a primary function template

Template function:
    A specific instance of a function that is generated

Specialized Template Funciton:
    Specialized versions of a template funciton that work with cases not fitting the normal pattern


Steps to creating a template:
    1. Determine the dependancies
    2. Start the function's definition and prototype with the template keyword
    3. Follow the template keyword with identifiers for each dependancy, preceded by "class" or "typename" i.e. template <typename TYPE>
    4. Supply the function header as normal
    5. Inside the actual function, use the identifier instead of the actual data type.

Class Templates Usage:
    Allow us to apply parametric polymorphism on class-by-class basis
    Isolate dependancies
    Using templates shifts the burden of creating duplicate classes to handle various combinations of data types to the compiler
    Type dependancies can be found by looking for those types that cause a particular class to differ from another class responsible for the same kind of behavior
    Write one class  and allow the compiler to instantiate multiple versions
    The compiler generates as many instances as required to meet the clients demands.
    The syntax for implementing class templates is similar to that of defining and declaring classes themselves. We simply preface the class def or declaration w/ the keyword template followed by a parameterized list of type dependencies.

    This is called a template formal argument list:
    template<typename TYPE, TYPE VALUE>

    template <class TYPE> class_stack
    {
        public:
            stack (int size = 100) : stack_size(size), stack_index(0){
                stack_array = new TYPE[size];
            }
        private:
            TYPE *stack_array;
            const int stack_size;
            int stack index;
        };

        template <class TYPE> void stack<TYPE>::push(const TYPE &item)
        {
            if (stack_index < stack_size){
                //what if there is no default constructor?
                stack_array[stack_index] = item;
                ++stack_index;
            }
        }

        //explicit specialization
        template <> void stack <char *>::push(const char *&item)
        {
            if (stack_index < stack_size){
                stack_array[stack_index] = new char[strlen(item) + 1];
                strcpy(stack_array[stack_index], item);
                ++stack_index;
            }
        }



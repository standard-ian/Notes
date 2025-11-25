Jan 23 2025
Week 3
"Exception Handling"

Exception hadnling allows us to detect error conditions at any point in a program (throw point) then transfer control to another point for processing.

We can separate normal processing from error processing

Improves structure, organization, and reusability

Throw expression consists of the opertaor 'throw' optionally followd by an operand of some type.

    i.e. if (i != 42)
            throw i;

This causes the program to abort whenever exception occurs. C++ aborts at every exception that is not explicitly processed by the program.

An exception triggers a call to the default library function 'terminate'

luckily, we can relace this with our own function:

    void user_terminate(){...}          //user supplied version

    int main(void){
        set_terminate(user_terminate); //install user function

Exception rules:
    1. No arguments
    2. Must not return data
    3. must not return - can only call exit/abort
    4. not allowed to throw its own exception
    5. the header file <exception> is needed to use set_terminate

Example:

    void user_terminate(){  //user supplied terminate
        cout << "user terminate function calling exit" << endl;
        exit(1);            //abnormal exit code
    }

    int main(){
        int i;
        set terminate(user_terminate); //intstall user function
        cout << "Enter an integer\n";
        cin >> i;

        if (i != 42)
            throw i;
        cout << "no throw was executed." << endl;

        cout << "normal exit; i = " << i << endl;
        return 0;
    }

Detecting an exception:
    Specify when we want this to be active.
    Think of this as turning on exception handling for a particular block
    Try block is a compound statement preceded by the try keyword
    Once enterng a try blok, exception handling is in effect until the block is exited
    try blocks establish when exception handling is in effect
    within a try block, we can select and handle different exceptions 'catching' an exception

    Example:

        int main(){
            int i;
            cout << "enter an int\n>";
            cin >> i;

            try{                //turn on error handler
                if (i != 42) //detect error
                    throw i;        //throw exception
                cout << "no execption thrown" << endl   //error condition was not met
            }

            catch (int x){          //go to the matching catch
                cout << "exception handler caled; arg = " << x << endl;
                i = 42 //resolve incorrect value
            }

            cout << "normal exit" << endl;   //all catch blocks skipped, to throw
            return 0;
        }

    A try block surrounds the code that we want skipped if the program throws an exeption

    When an exception is thrown, we can associate an operand of some type with the throw operator

    It is possible to detect multiple errors within a try block

    There is s default catch 'catch(...)' which does not specify a specific type

    (...) means variable number of function arguments (used in C by printf and scanf

Nesting try blocks:
    Try blocks can be nested.

    If a function throws an exception, and is called in a try block, we will skip the rest of the function after the throw, and the rest of the try block after the function call, heading straight to the catch block in the caller.

    Function automatically calls the function's class destructor. If there is dyamic memory without destructors, this is NOT handled. Use OOP, don't micromanage memory.

Exception Specifications:
    An exception specification consists of the throw keyword followed by a list of exception types in parens

    The exception specification is the last item in a function declaration or header
    The list may be empty

    This guarentees that the function will not throw any exceptions.

    A non-empty list guarentees that the function will only throw exceptions of the type(s) specified in the list

    if the exception specification is absent, the function can throw any type of exception


Exception handling with classes:

    struct bad_index{
        long index;
    }

    class dyn_a1 {
        public:
            explicit dyn_a1(INDEX) throw(bad_index); //1D array of size i
            ~dyn_a1() throw(); //destructor
            int &operator[](INDEX) throw(bad_index); //subscript operator
        private:
            dyn_a1(const dyn_a1 &); //prohibit copy constructor
            dyn_a1 &operator=(const dyn_a1 &); //prohibit assign
            INDEX d1; //# of elements in 1D array
            int* a0; //base address of all elements
        };


    //Implementation of dyn_a1 constructor and destructor
    inline dyn_a1::dyn_a1(INDEX i) throw(bad_index) : d1(0) //set to 0 in case exception
    {
        a0 = new int[i];  //total # elements
        d1 = i;
    }

    //Implementation of the destructor
    inline dyn_a1::~dyn_a1()
    {
        delete[] a0; //deallocate all array elements
    }

    //Implementation of subscript operator
    inline int &dyn_a1::operator[](INDEX i) throw()
    {
        if (i<0 || i>=d1) { //check if out of bounds
            bad_index e;    //create bad_index object
            e.index = i;    //save bad index
            throw(e)        //throw bad_index exception
        }
        return (a0[i]); //ith element in 1D array
    }









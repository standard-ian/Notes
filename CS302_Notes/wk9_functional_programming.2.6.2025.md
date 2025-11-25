#### Declarative  vs Imperative Programing
Functional is Declarative. 

#### Functional Programming Qualities
##### Immutable values:
	States don't change. Recursion is required. 
##### Pure functions:
	Only dealing with local values, not changing things outside of it
	No side effects - cannot change things outside the functions scope
	Deterministic - effect of a function is known and defined
	Memoization - store the function's result to increase performance
		Interpreter creates a table of inputs to outputs - deterministic
		Interpreter no longer calls the function and just goes to the table
	First class functions - ability to treat functions like a data type
		They can be returned, passed as params, an stored as variables
##### Higher Order Functions:
	Functions that take other functions as parameters or return other functions
	in C++:
		filter - copy_if, remove_if, transform
			Removes data meeting a specified condition
		map - transform
			Applies a given function to each element
		fold - reduce and accumulate
			Combines elements left the right or right to left respectively

	#call list constructor, 
	#pass in map function, 
	#and apply a lambda function to each
	
	nums = [1, 2, 3, 4, 5]		
	result = list(map(lambda x: x + 1, nums))
	#result = [2, 3, 4, 5, 6]

##### Pure Functional Programming:
	Applies only pure functional concepts
##### C++ and Functional Programming:
	Lambda Functions:
	
		In C++:
		[] - caputre date inside of the enclosing scope, if emmpty, nothing
			[=] - everything by value
			[&] - by reference
			[x] - just x by value
			[&x] - just x by reference
		() - params
		{} - function body
		-> - trailing return type
		
		std::vector<int> aVec = {1, 2, 3, 4, 5};
		std::transform(aVec.begin(), aVec.end(), aVEc.begin(), 
			[](int x){return x + 1;});
			
		generic type function that's being built into an object		
		when this is assigned to a variable, that can be used to call the function as defined in the lambda
		
		to define type of the lambda definition:
			function<return type(arg types)>
			
		anonymous function that can be returned like a data member
		useful when a quick non-reused function is needed
		eliminates the compiler going to the a header for the declaration
		because they can be passed and returned, they are first class
		
		In Python:
		
			#lambda<args> : body
			#can only be one line
			#every function is a first class in Python
			
			addOne = lambda x: x + 1
			aList = [1, 2, 3]
			print(aList)

			testMap = map(addOne, aList)
			print(testMap)
			
			newList = list(map(addOne, testMap))
			print(newList)
			
			#output:
			[1, 2, 3]
			<map object at 0x00000002577DF6910>
			[3, 4, 5]
			
#### Use Cases
	int  FpARR::count()
	{
		return countIter();
	}
	
	int FpARR::counter(int index)
	{
		if(index >= size) 
			return 0;
		return countRec(arrLists[index]) + countIter(index + 1);
	}

	intFpARR::countRec(TestNode * head)
	{
		if(!head)
			return 0;
		return countRec(head -> getNext()) + 1;
	}
	
	//send as argument C++
	intFpArr::iterate(int index, function<int(TestNode*)> &aFunc)
	{
		if(index == size)
			return 0;
			
		return aFunc(arrLists[index]) + iterate(index + 1, aFunc);
	}

	int FpARR::count()
	{
		function<int(TestNode*)> aFunc = [&aFunc](TestNode *head) -> int{
			if(!head) return 0;
			return aFunc(head -> getNext()) + 1;
		};
		return iterate(0, aFunc);
	}
	
	//Can store a function as a data member in a class:
	//cannot have an empty function initialization	
	
	function<int(TestNode*)> lamTest = [](TestNode *empty) -> int{cout << "Nothing set. << endl; return 0;3}

	//need to define where the capture is coming from
	//give it by reference to the capture of the lambda
	//then, can say:
	int FpARR::count()
	{
		lamTest = [&aFunc = this -> lamTest](TestNode *head) -> int {
			if (!head) return 0;
			return aFunc(head -> getNext()) + 1;
		};
		return iterate(0, lamTest)
	}
	
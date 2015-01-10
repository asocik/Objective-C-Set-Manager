#The Objective-C Set Manager
The Objective-C Set manager is an iOS app that creates two sets and allows the user to perform several functions on them. While the overall premise of the program is simple, the main point was to slightly over complicate the problem to learn how Objective-C's implementation of inheritance and polymorphism look like while at the same time learn how to create a basic iOS app. The program contains a super class SetManager, and two subclasses ListSetManager and OCSetManager. ListSetManager implements sets as linked lists while OCSetManager implements sets using a NSMutableArray. Each of the set types support the following functions:

* Set initialization into specified type (list or ordered collection)
* Clearing sets
* Switching two sets
* Deep copy one set into another
* Adding an integer to a set
* Removing an element from a set
* Getting the size of a set
* Getting the index of an element within the set
* Getting the value of an element given an index
* Checking to see if an integer is a member of the set
* Taking the union of two sets
* Printing all of the values in a set

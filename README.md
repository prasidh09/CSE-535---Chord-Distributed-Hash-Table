CSE 535 : Chord Distributed Hash Table
======================================

Chord is a protocol and algorithm for a peer-to-peer distributed hash table. In this project, I intend to focus 
on proving the following properties of chord in TLA making use of assertions:

- “Ordered appendages” which conveys the message that members are ordered correctly within an appendage.

- “Valid Successor List” which claims that if ‘v’ and ‘w’ are members, and if w’s successor 
list skips over ‘v’, then ‘v’ is not in the successor list of any immediate antecedent of ‘w’. 

I have done model checking by translating the Pluscal syntax to TLA+.

What is TLA?

TLA stands for Temporal Logic of Actions and was developed by Leslie Lamport. It is used to describe 
behaviours of concurrent systems.

Link : http://research.microsoft.com/en-us/um/people/lamport/tla/tla.html 

What is PlusCal ?

Pluscal is an algorithm language designed to replace pseudo code and is made use of in model checking.

Link : http://research.microsoft.com/en-us/um/people/lamport/tla/pluscal.html

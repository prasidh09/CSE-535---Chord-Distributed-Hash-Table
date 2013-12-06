CSE 535 : Chord Distributed Hash Table
======================================

Chord is a protocol and algorithm for a peer-to-peer distributed hash table. In this project, I intend to focus 
on proving the following properties of chord in TLA making use of assertions:

- “Ordered appendages” which conveys the message that members are ordered correctly within an appendage.

- “Valid Successor List” which claims that if ‘v’ and ‘w’ are members, and if w’s successor 
list skips over ‘v’, then ‘v’ is not in the successor list of any immediate antecedent of ‘w’. 

I have done model checking by translating the Pluscal syntax to TLA+.

Credits: The implementation was done by Jitender Kalra and me together.

What is TLA?

TLA stands for Temporal Logic of Actions and was developed by Leslie Lamport. It is used to describe 
behaviours of concurrent systems.

The TLA Home Page (Last modified 15 June 2013): http://research.microsoft.com/en-us/um/people/lamport/tla/tla.html 

What is PlusCal ?

Pluscal is an algorithm language designed to replace pseudo code and is made use of in model checking.

The PlusCal Algorithm Language( Last modified 21 April 2011 ): http://research.microsoft.com/en-us/um/people/lamport/tla/pluscal.html

How to setup the TLA tools ?

The TLA toolbox is required to run the program. Steps for installation and download details can be found in the followng link.

TLA+ Proof System((Last Visited Nov 08, 2013): http://tla.msr-inria.inria.fr/tlaps/content/Download/Binaries/Windows.html




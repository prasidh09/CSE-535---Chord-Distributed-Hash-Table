CSE 535 : Chord Distributed Hash Table
======================================

Properties of chord proved in TLA:

- “Ordered appendages” conveys the message that members are ordered correctly within an appendage.

- The invariant “Valid Successor List” claims that if ‘v’ and ‘w’ are members, and if w’s successor 
list skips over ‘v’, then ‘v’ is not in the successor list of any immediate antecedent of ‘w’. 

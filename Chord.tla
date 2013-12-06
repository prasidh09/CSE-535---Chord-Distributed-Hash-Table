------------------------- MODULE Chord1 ------------------------
EXTENDS Naturals, TLC, Sequences
  
CONSTANT N

Nodes == 1..N

(* --algorithm chord
      variables 
      succ = [row \in Nodes |->  9 ];      
      prdc = [row \in Nodes |->  9 ];
      succ2 = [row \in Nodes |-> 9 ];
      newsucc = [row \in Nodes |-> 9 ];
      canfail = 0;
      canjoin = 0;  
      hasbest=0;  

    define
    
        between( x, y, z) ==
            \/ x < y /\ y < z
            \/ x > z /\ \/ x < z
                        \/ y < z
        max(x,y) == IF x < y THEN y ELSE x

        member(x) == \/ succ[x] = TRUE 

        nonmember(x) == \/ succ[x] = FALSE /\  prdc[x] = FALSE /\ succ2[x] = FALSE
        
        
        
        (* valid(x) == \/ OneOrderedRing(x) /\ orderedappendage(x,y) /\ FullSuccessorList(x) /\ NoSelfSuccessors(x) /\ OrderedSuccessors(x) /\ BaseNotSkiped(x) /\ ConnectedAppendages(x) *) 
            
    end define;
            
      
       macro fillvalue(row, column, val)
       begin
        matrix[row][column] := val;
       end macro;
             
       procedure orderedappendage(n,m)
       variables pre,bet,q;
       begin
       pp1:
        print "Ordered appendage";
        pre:=prdc[n]; q:=succ[n];        
        assert bet=between(pre,m,q);
       ret: return;
       end procedure;    
       
       procedure orderedmerges(n,m)
       variables pre,bet,q;
       begin
       pp1:
        cyclemember=succ[n]
        print "Ordered merge";
        pre:=prdc[n]; q:=succ[n];        
        assert bet=between(pre,m,q);
       ret: return;
       end procedure;
       
       procedure hasbest()
       variables j=1..N , p;
       begin
       hsbl: while j # {} do
                  p := CHOOSE k \in j:TRUE; 
                        if succ[p] # 9 /\ matrix[p][1] = 9 then
                                hsbest := FALSE;
                                assert hsbest;
                        end if;
             end while;   
       hsbret: return;
       end procedure;           
            
       procedure alloy()
       variables hello = "";
       begin
       LaBeL: print <<"Number of nodes",hello>>;
       return;
       end procedure;


       process chord \in Nodes
       begin
       label1:
       fillvalue(self,1,4);
       label2: call alloy();
       (* label3: call orderedappendage(1,2);
       label4: call hasbest(); *)
       end process;
  end algorithm
*)



\* BEGIN TRANSLATION
CONSTANT defaultInitValue
VARIABLES matrix, succ, prdc, succ2, newsucc, canfail, canjoin, hsbest, pc, 
          stack

(* define statement *)
between( x, y, z) ==
    \/ x < z /\ x < y /\ y < z
    \/ x > z /\ \/ x < z
                \/ y < z
max(x,y) == IF x < y THEN y ELSE x

member(x) == \/ succ[x] = TRUE

nonmember(x) == \/ succ[x] = FALSE /\  prdc[x] = FALSE /\ succ2[x] = FALSE

VARIABLES n, m, pre, bet, q, j, p, hello

vars == << matrix, succ, prdc, succ2, newsucc, canfail, canjoin, hsbest, pc, 
           stack, n, m, pre, bet, q, j, p, hello >>

ProcSet == (Nodes)

Init == (* Global variables *)
        /\ matrix = [row \in Nodes |-> [column \in Nodes |-> 9 ]]
        /\ succ = [row \in Nodes |->  9 ]
        /\ prdc = [row \in Nodes |->  9 ]
        /\ succ2 = [row \in Nodes |-> 9 ]
        /\ newsucc = [row \in Nodes |-> 9 ]
        /\ canfail = 0
        /\ canjoin = 0
        /\ hsbest = 0
        (* Procedure orderedappendage *)
        /\ n = [ self \in ProcSet |-> defaultInitValue]
        /\ m = [ self \in ProcSet |-> defaultInitValue]
        /\ pre = [ self \in ProcSet |-> defaultInitValue]
        /\ bet = [ self \in ProcSet |-> defaultInitValue]
        /\ q = [ self \in ProcSet |-> defaultInitValue]
        (* Procedure hasbest *)
        /\ j = [ self \in ProcSet |-> 1..N]
        /\ p = [ self \in ProcSet |-> defaultInitValue]
        (* Procedure alloy *)
        /\ hello = [ self \in ProcSet |-> ""]
        /\ stack = [self \in ProcSet |-> << >>]
        /\ pc = [self \in ProcSet |-> "label1"]

pp1(self) == /\ pc[self] = "pp1"
             /\ PrintT("In order")
             /\ pre' = [pre EXCEPT ![self] = prdc[n[self]]]
             /\ q' = [q EXCEPT ![self] = succ[n[self]]]
             /\ Assert(bet[self]=between(pre'[self],m[self],q'[self]), 
                       "Failure of assertion at line 52, column 9.")
             /\ pc' = [pc EXCEPT ![self] = "ret"]
             /\ UNCHANGED << matrix, succ, prdc, succ2, newsucc, canfail, 
                             canjoin, hsbest, stack, n, m, bet, j, p, hello >>

ret(self) == /\ pc[self] = "ret"
             /\ pc' = [pc EXCEPT ![self] = Head(stack[self]).pc]
             /\ pre' = [pre EXCEPT ![self] = Head(stack[self]).pre]
             /\ bet' = [bet EXCEPT ![self] = Head(stack[self]).bet]
             /\ q' = [q EXCEPT ![self] = Head(stack[self]).q]
             /\ n' = [n EXCEPT ![self] = Head(stack[self]).n]
             /\ m' = [m EXCEPT ![self] = Head(stack[self]).m]
             /\ stack' = [stack EXCEPT ![self] = Tail(stack[self])]
             /\ UNCHANGED << matrix, succ, prdc, succ2, newsucc, canfail, 
                             canjoin, hsbest, j, p, hello >>

orderedappendage(self) == pp1(self) \/ ret(self)

hsbl(self) == /\ pc[self] = "hsbl"
              /\ IF j[self] # {}
                    THEN /\ p' = [p EXCEPT ![self] = CHOOSE k \in j[self]:TRUE]
                         /\ IF succ[p'[self]] # 9 /\ matrix[p'[self]][1] = 9
                               THEN /\ hsbest' = FALSE
                                    /\ Assert(hsbest', 
                                              "Failure of assertion at line 63, column 33.")
                               ELSE /\ TRUE
                                    /\ UNCHANGED hsbest
                         /\ pc' = [pc EXCEPT ![self] = "hsbl"]
                    ELSE /\ pc' = [pc EXCEPT ![self] = "hsbret"]
                         /\ UNCHANGED << hsbest, p >>
              /\ UNCHANGED << matrix, succ, prdc, succ2, newsucc, canfail, 
                              canjoin, stack, n, m, pre, bet, q, j, hello >>

hsbret(self) == /\ pc[self] = "hsbret"
                /\ pc' = [pc EXCEPT ![self] = Head(stack[self]).pc]
                /\ j' = [j EXCEPT ![self] = Head(stack[self]).j]
                /\ p' = [p EXCEPT ![self] = Head(stack[self]).p]
                /\ stack' = [stack EXCEPT ![self] = Tail(stack[self])]
                /\ UNCHANGED << matrix, succ, prdc, succ2, newsucc, canfail, 
                                canjoin, hsbest, n, m, pre, bet, q, hello >>

hasbest(self) == hsbl(self) \/ hsbret(self)

LaBeL(self) == /\ pc[self] = "LaBeL"
               /\ PrintT(<<"Number of nodes",hello[self]>>)
               /\ pc' = [pc EXCEPT ![self] = Head(stack[self]).pc]
               /\ hello' = [hello EXCEPT ![self] = Head(stack[self]).hello]
               /\ stack' = [stack EXCEPT ![self] = Tail(stack[self])]
               /\ UNCHANGED << matrix, succ, prdc, succ2, newsucc, canfail, 
                               canjoin, hsbest, n, m, pre, bet, q, j, p >>

alloy(self) == LaBeL(self)

label1(self) == /\ pc[self] = "label1"
                /\ matrix' = [matrix EXCEPT ![self][1] = 4]
                /\ pc' = [pc EXCEPT ![self] = "label2"]
                /\ UNCHANGED << succ, prdc, succ2, newsucc, canfail, canjoin, 
                                hsbest, stack, n, m, pre, bet, q, j, p, hello >>

label2(self) == /\ pc[self] = "label2"
                /\ stack' = [stack EXCEPT ![self] = << [ procedure |->  "alloy",
                                                         pc        |->  "Done",
                                                         hello     |->  hello[self] ] >>
                                                     \o stack[self]]
                /\ hello' = [hello EXCEPT ![self] = ""]
                /\ pc' = [pc EXCEPT ![self] = "LaBeL"]
                /\ UNCHANGED << matrix, succ, prdc, succ2, newsucc, canfail, 
                                canjoin, hsbest, n, m, pre, bet, q, j, p >>

chord(self) == label1(self) \/ label2(self)

Next == (\E self \in ProcSet:  \/ orderedappendage(self) \/ hasbest(self)
                               \/ alloy(self))
           \/ (\E self \in Nodes: chord(self))
           \/ (* Disjunct to prevent deadlock on termination *)
              ((\A self \in ProcSet: pc[self] = "Done") /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(\A self \in ProcSet: pc[self] = "Done")

\* END TRANSLATION


=====================================================================


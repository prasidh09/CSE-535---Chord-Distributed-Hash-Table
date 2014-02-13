Asynchronous Systems: CSE 535
Programming Distributed Algorithms:

Ricart Agrawala Algorithm based on logical timestamps and token is implemented using distalgo for python.
The driver program can be run using the following command:

python -m distalgo.runtime RADriver.da n m

where n is the number of processes and m is the number of requests.

There are two classes namely RATimeStamp and RAToken which handle each of the algorithms. 
The main function accepts command line arguments as the processes and requests from the user. 
Each request is assigned to a process in a random manner and startprocs invokes the processes.
The setup method initializes all the variables used in the class. CS method implements the crux
of the algorithms supported by functions and labels.

Test Data:

prasidh@prasidh-VirtualBox:~/Downloads/DistAlgo-0.5b$ python3 -m distalgo.runtime RADriver.da 3 3
[2013-10-04 01:06:16,871]runtime:INFO: Running iteration 1 ...
[2013-10-04 01:06:16,910]runtime:INFO: Creating instances of RAToken..
 [2013-10-04 01:06:16,960]runtime:INFO: 3 instances of RAToken created.
[2013-10-04 01:06:17,004]runtime:INFO: Creating instances of RATimeStamp..
[2013-10-04 01:06:17,087]runtime:INFO: 3 instances of RATimeStamp created.

 RUNNING RICART-AGRAWALA's TIME STAMP-BASED ALGORITHM CLEAR VERSION 


No of Processes:    3
No of Requests:     3

[2013-10-04 01:06:17,115]runtime:INFO: Starting procs...
Process ('prasidh-VirtualBox', 28141) is sending request to CS
 Process ('prasidh-VirtualBox', 22246) is sending request to CS
Received request message from ('prasidh-VirtualBox', 28141)
Defering process('prasidh-VirtualBox', 28141) by ('prasidh-VirtualBox', 22246)
 Received request message from ('prasidh-VirtualBox', 22246)
Process ('prasidh-VirtualBox', 13585) is sending request to CS
Received request message from ('prasidh-VirtualBox', 13585)
Received request message from ('prasidh-VirtualBox', 13585)
 Received request message from ('prasidh-VirtualBox', 22246)
Defering process('prasidh-VirtualBox', 22246) by ('prasidh-VirtualBox', 13585)
Received request message from ('prasidh-VirtualBox', 28141)
 Defering process('prasidh-VirtualBox', 28141) by ('prasidh-VirtualBox', 13585)
Process ('prasidh-VirtualBox', 13585) ENTERING CS
Process ('prasidh-VirtualBox', 13585) LEAVING CS
Sending Release message to deferred process [22246, 28141]
 Process ('prasidh-VirtualBox', 22246) ENTERING CS
Process ('prasidh-VirtualBox', 22246) LEAVING CS
Sending Release message to deferred process [28141]
Process ('prasidh-VirtualBox', 28141) ENTERING CS
 Process ('prasidh-VirtualBox', 28141) LEAVING CS

 RUNNING RICART-AGRAWALA's TOKEN-BASED ALGORITHM CLEAR VERSION 


No of Processes:    3
No of Requests:     3

[2013-10-04 01:06:17,357]runtime:INFO: Starting procs...
 Process ('prasidh-VirtualBox', 26961) is sending request to CS
Process ('prasidh-VirtualBox', 21892) is sending request to CS
Process ('prasidh-VirtualBox', 13212) is sending request to CS
 Process ('prasidh-VirtualBox', 26961) ENTERING CS
Process ('prasidh-VirtualBox', 26961) LEAVING CS
Process ('prasidh-VirtualBox', 21892) ENTERING CS
Process ('prasidh-VirtualBox', 21892) LEAVING CS
 Process ('prasidh-VirtualBox', 13212) ENTERING CS
Process ('prasidh-VirtualBox', 13212) LEAVING CS
^C[2013-10-04 01:06:33,119]runtime:INFO: Received keyboard interrupt.
[2013-10-04 01:06:33,120]runtime:INFO: Terminating...
 prasidh@prasidh-VirtualBox:~/Downloads/DistAlgo-0.5b$ 
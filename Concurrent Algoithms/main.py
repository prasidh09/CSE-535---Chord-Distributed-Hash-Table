import threading
import time
import sys
import random

# global variables and shared variables used by the program
choosing = [0]*500
num = [0]*500
x = 0
y = -1
B = [0]*500
tR = 0
totalReq = 0 
Threads = []
alive = []
Threads1 = []
alive1 = []

class Bakery(threading.Thread):
    
    # the constructor which assigns the requests, threadname, index to the respective thread
    def __init__(self, string, index, req):
        
        self.threadName = string+str(index)
        self.index = index
        self.requests = req
        threading.Thread.__init__(self, name=self.threadName)

    #invoked after the thread.start()
    def run(self):
        print(self.threadName+' started ')
        # handle the requests of each thread, decrement the value by 1 after entering and exiting a CS once.
        global totalReq
        while totalReq > 0:
            if totalReq == 0:
                break
            else:
                bakery_algo(self)
                totalReq=totalReq-1
        
# a global function which contains the logic of the lamport's bakery algorithm
def bakery_algo(self):

    choosing[self.index] = 1
    num[self.index] = 1 + max(num)
    choosing[self.index] = 0
    for i in Threads:
        if i != self.index:
            while(choosing[i.index] != 0):
                pass
            while (num[i.index] != 0) and ((num[i.index] < num[self.index]) or ((num[i.index] == num[self.index]) and (i.index < self.index))):
                pass
    crit_sect(self)
    num[self.index] = 0
    time.sleep(3)


#Critical section 
def crit_sect(self):
    
    print(self.threadName+' Entering CS')
    print(self.threadName+' Exiting CS')
    
# method which calls the constructor of the Bakery class and invokes the threads
def bakery(assign):
    i = 0
    global totalReq
    for j in assign:
        totalReq=totalReq+j
        Threads.append(Bakery("Process ", i, j))
        i+=1
    for k in Threads:
        if k.requests > 0:
            alive.append(k)
            k.start()  
    for l in alive:
        l.join()

class FastMutex(threading.Thread):
    
    # the constructor which assigns the requests, threadname, index to the respective thread
    def __init__(self, string1, index1, req1):
        
        self.threadName1 = string1+str(index1)
        self.index1 = index1
        self.requests1 = req1
        threading.Thread.__init__(self, name=self.threadName1) 
        
    def run(self):
        print(self.threadName1+' started')    
        global tR 
        while tR > 0:
            if tR == 0:
                break
            else:   
                fast_algo(self)
                tR=tR-1
        
#Lamport's fast mutual exclusion algorithm      
def fast_algo(self):
    global y
    global x    
    B[self.index1] = 1
    x = self.index1
    if y != -1:
        B[self.index1] = 0
        while( y != -1):
            pass
        fast_algo(self)
    y = self.index1
    if x != self.index1:
        B[self.index1] = 0
        for each in Threads1:
            while( B[each.index1] != 0):
                pass
        if y != self.index1:
            while( y != -1):
                pass
            fast_algo(self)
    cs(self)
    y = -1
    B[self.index1] = 0
    time.sleep(3)
    
#Critical_section
def cs(self):
    print(self.threadName1+' Entering CS')
    print(self.threadName1+' Exiting CS')

# method which calls the constructor of the FastMutex class and invokes the threads 
def fast(allocate):   
    i = 0
    global tR   # Total requests
    for j1 in allocate:
        tR=tR+j1
        Threads1.append(FastMutex("Process ", i, j1))
        i+=1
    for k1 in Threads1:
        if k1.requests1 > 0:
            alive1.append(k1)
            k1.start()  
    for l1 in alive1:
        return

def main():
        #Initialize threads and requests to 1 
        threads=1
        requests=1
        #Accept command line inputs from the user: Number of processes and requests
        try:
            if(len(sys.argv)>1):
                threads = int(sys.argv[1])
        except:
            threads=1
        try:
            if(len(sys.argv)>1):
                requests = int(sys.argv[2])
        except:
            requests=1
        print("Concurrent Algorithms using python")
        print("Number of processes " + str(threads))
        print("Number of requests " + str(requests))
        allocate = [0]*threads
        # randomly allocating the requests among the threads
        while requests:
            j = random.randrange(0, threads)
            allocate[j]=allocate[j]+1
            requests=requests-1
        print("\nRunning Lamport's bakery algorithm\n")
        #invoke the bakery method
        bakery(allocate)     
        print("\nRunning Lamport's fast mutual exclusion algorithm\n")
        #invoke the fast method
        fast(allocate)

#Invoke the main function       
main();
import time;
def Ackermann(m,n):
    stack = [m]
    i = 0
    while (len(stack)):
        x = stack.pop()
        if(x == 0):
            n = n + 1
        elif(n == 0):
            n = 1
            stack.append(x-1)
        else:
            n = n - 1
            stack.append(x-1)
            stack.append(x)
    return n

print "****Iterative Ackermann in Python****"
print "Enter m and n: "
m = int(raw_input())
n = int(raw_input())
start = time.time()
ack = Ackermann(m,n)
finish = time.time()
print "Result = %d" % (ack)
timing = finish-start
print "Elapsed Time in milliseconds: %f" % (timing*100.0)

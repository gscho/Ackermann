/*
 * ------------------------------------------------------------------
 *  recursive.c - Source file for recursive ackermann function in C
 *  School of Computer Science - W15
 *  University of Guelph
 *  Author: Gregory Schofield
 * ------------------------------------------------------------------
 */
#include <stdio.h>
#include <time.h>
#include <sys/time.h>

int Ackermann(int m, int n);

int main()
{
    struct timeval t1, t2, tv;
    int input1, input2, ack;
    printf("****Recursive Ackermann in C****\n");
    printf("Enter m and n: \n");
    scanf("%d%d", &input1, &input2);
    gettimeofday(&t1,NULL);
    ack = Ackermann(input1,input2);
    gettimeofday(&t2,NULL);
    printf("Result = %d\n", ack);
    timersub(&t2,&t1,&tv);
    printf("%ld milliseconds\n", (1000000*tv.tv_sec+tv.tv_usec)/1000);
    return (1);
}

int Ackermann(int m, int n)
{
    if( m == 0 )
        return n + 1;
    else if(n == 0)
        return Ackermann (m-1, 1);
    else
        return Ackermann(m-1, Ackermann(m, n-1));
}

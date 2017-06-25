/*
 * ------------------------------------------------------------------
 *  iterative.c - Source file for iterative
 *  School of Computer Science - W15
 *  University of Guelph
 *  Author: Gregory Schofield
 * ------------------------------------------------------------------
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#define STACKSIZE 1000000
/* Nonrecursive version of Ackermann's function, using just a stack.*/

typedef struct dataT
{
    int m;
}data_t;

struct st
{
    int top;
    data_t items[STACKSIZE];
} stack;

void createstack(void)
{
    stack.top = -1;
}

int isFULL()
{
    if (stack.top >= STACKSIZE-1)
        return 1;
    else
        return 0;
}

int isEMPTY()
{
    if (stack.top == -1)
        return 1;
    else
        return 0;
}

int stack_size(void)
{
    return stack.top;
}

int top(void)
{
    return stack.items[stack.top].m;
}

void push(int m)
{
    if (isFULL())
    {
        fputs("Error: stack overflow\n", stderr);
        abort();
    }
    else
    {
        stack.top = stack.top + 1;
        stack.items[stack.top].m = m;
    }
}

void pop(int *m)
{
    if (isEMPTY())
    {
        fputs("Error: stack underflow\n", stderr);
        abort();
    }
    else
    {
        *m = stack.items[stack.top].m;
        stack.top = stack.top - 1;
    }
}

int ackermann(int m, int n)
{
    push(m);
    while (!isEMPTY())
    {
        pop(&m);
        if (m == 0)
            n = n + 1;
        else if (n == 0)
        {
            n = 1;
            push(m-1);
        }
        else
        {
            n = n - 1;
            push(m-1);
            push(m);
        }
    }
    return n;
}

int main(void)
{
    int r, m, n;
    struct timeval t1, t2, tv;
    createstack();
    printf("****Iterative Ackermann in C****\n");
    printf("Enter m and n: ");
    scanf("%d%d", &m, &n);
    // Start timer
    // Produces 1 microsecond resolution (1,000,000 microseconds = 1 sec)
    gettimeofday(&t1,NULL);
    r = ackermann(m,n);
    // Stop timer
    gettimeofday(&t2,NULL);
    printf("Result = %d\n", r);
    timersub(&t2,&t1,&tv);
    printf("%ld milliseconds\n", (1000000*tv.tv_sec+tv.tv_usec)/1000);

    return 0;
}

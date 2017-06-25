!
! recursive.f95 - Source file for recursive ackermann function in fortran
! School of Computer Science - W15
! University of Guelph
! Author: Gregory Schofield
!

!Module contains the recursive ackermann function
module ack
contains
    recursive function Ackermann(m,n) result(x)
        implicit none
        integer :: m,n,x
        if(m == 0)then
            x = n + 1
        else if (n == 0) then
            x = Ackermann(m-1,1)
        else
            x = Ackermann(m-1,Ackermann(m,n-1))
        end if
    end function Ackermann
end module ack

!main program
program recursivef95
    use ack
    implicit none
    integer :: input1, input2, x
    integer(kind=8) start,finish,rate
    write(*,*)'****Recursive Ackermann in Fortran****'
    write (*,*)'Enter m and n: '
    read (*,*) input1,input2
!Timing using the system_clock method
    call system_clock(count_rate=rate)
    call system_clock(start)
    x = Ackermann(input1,input2)
    call system_clock(finish)
    write(*,*)'Result = ',x
    write(*,*) 'Elapsed Time in milliseconds:',(float(finish-start)/rate)*1000
end program recursivef95

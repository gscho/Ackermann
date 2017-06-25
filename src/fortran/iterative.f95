!
! recursive.f95 - Source file for recursive ackermann function in fortran
! School of Computer Science - W15
! University of Guelph
! Author: Gregory Schofield
!
module stack

    type stack_t
        integer, dimension(0:1000000) :: item
        integer :: top = -1
    end type stack_t

contains
    function isFull(st) result(x)
        implicit none
        type(stack_t), intent(inout) :: st
        integer :: x
        if(st%top >= 1000000)then
            x = 1
        else
            x = 0
        end if
    end function isFull

    function isEmpty(st) result(x)
        implicit none
        type(stack_t), intent(inout) :: st
        integer :: x
        if(st%top == -1)then
            x = 1
        else
            x = 0
        end if
    end function isEmpty

    subroutine push(st,n)
        implicit none
        type(stack_t), intent(inout) :: st
        integer :: n
        if(isFull(st) == 1)then
            write(*,*) 'Error: stack overflow'
        else
            st%top = st%top + 1
            st%item(st%top) = n
        end if
    end subroutine push

    subroutine pop(st,n)
        implicit none
        type(stack_t), intent(inout) :: st
        integer, intent (inout) :: n
        if(isEmpty(st) == 1)then
            write(*,*) 'Error: stack underflow'
        else
            n = st%item(st%top);
            st%top = st%top - 1;
        end if
    end subroutine pop

    function Ackermann(st,m,n) result (x)
        implicit none
        type(stack_t), intent(inout) :: st
        integer :: m,n,x
        call push(st,m)
        do while(isEmpty(st) == 0)
            call pop(st,m)
            if(m == 0)then
                n = n + 1
            else if (n == 0)then
                n = 1;
                call push(st,m-1)
            else
                n = n - 1
               call push(st,m-1)
               call push(st,m)
            end if
        end do
        x = n;
    end function Ackermann

end module stack

program iterativef95
    use stack
    implicit none
    type(stack_t) :: st
    integer :: ret
    integer :: input1, input2, x
    integer(kind=8) start,finish,rate
    write(*,*)'****Iterative Ackermann in Fortran****'
    write (*,*)'Enter m and n: '
    read (*,*) input1,input2
    call system_clock(count_rate=rate)
    call system_clock(start)
    x = Ackermann(st,input1,input2)
    call system_clock(finish)
    write(*,*) 'Result = ', x
    write(*,*) 'Elapsed Time in milliseconds:',(float(finish-start)/rate)*1000
end program iterativef95

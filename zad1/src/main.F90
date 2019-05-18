program main
    
    use naivemath
    use bettermath
    use dotmath

    implicit none

    real(kind = 4), dimension(:,:), allocatable :: A4, B4, C4
    real(kind = 8), dimension(:,:), allocatable :: A8, B8, C8
    real(kind = 16), dimension(:,:), allocatable :: A16, B16, C16
    character(:), allocatable :: frm
    integer :: n, i
    real :: start_time, stop_time, naiv_time_4, naiv_time_8, naiv_time_16, better_time_4, better_time_8, & 
    better_time_16, dot_time_4, dot_time_8, dot_time_16, matmul_time_4, matmul_time_8, matmul_time_16

    frm = "(I4, A1, F18.16)"
    
    open(unit = 10, file = "res/res_naiv_4.txt", status = 'REPLACE')
    open(unit = 11, file = "res/res_naiv_8.txt", status = 'REPLACE')
    open(unit = 12, file = "res/res_naiv_16.txt", status = 'REPLACE')
    open(unit = 13, file = "res/res_better_4.txt", status = 'REPLACE')
    open(unit = 14, file = "res/res_better_8.txt", status = 'REPLACE')
    open(unit = 15, file = "res/res_better_16.txt", status = 'REPLACE')
    open(unit = 16, file = "res/res_dot_4.txt", status = 'REPLACE')
    open(unit = 17, file = "res/res_dot_8.txt", status = 'REPLACE')
    open(unit = 18, file = "res/res_dot_16.txt", status = 'REPLACE')
    open(unit = 19, file = "res/res_matmul_4.txt", status = 'REPLACE')
    open(unit = 20, file = "res/res_matmul_8.txt", status = 'REPLACE')
    open(unit = 21, file = "res/res_matmul_16.txt", status = 'REPLACE')

    n = 10

    do
        if(n > 1280) then
            exit
        end if

        naiv_time_4 = 0
        naiv_time_8 = 0
        naiv_time_16 = 0
        better_time_4 = 0
        better_time_8 = 0
        better_time_16 = 0
        dot_time_4 = 0
        dot_time_8 = 0
        dot_time_16 = 0
        matmul_time_4 = 0
        matmul_time_8 = 0
        matmul_time_16 = 0

        if (allocated(A4)) deallocate(A4)
        if (allocated(B4)) deallocate(B4)
        if (allocated(C4)) deallocate(C4)
    
        if (allocated(A8)) deallocate(A8)
        if (allocated(B8)) deallocate(B8)
        if (allocated(C8)) deallocate(C8)
    
        if (allocated(A16)) deallocate(A16)
        if (allocated(B16)) deallocate(B16)
        if (allocated(C16)) deallocate(C16)

        allocate(A4(n,n))
        allocate(B4(n,n))
        allocate(C4(n,n))

        allocate(A8(n,n))
        allocate(B8(n,n))
        allocate(C8(n,n))

        allocate(A16(n,n))
        allocate(B16(n,n))
        allocate(C16(n,n))

        write (*,*) n

        call fill_matrix(n)

        call cpu_time(start_time)
        C4 = naivmull(A4,B4)
        call cpu_time(stop_time)
        naiv_time_4 = naiv_time_4 + stop_time - start_time

        call cpu_time(start_time)
        C8 = naivmull(A8,B8)
        call cpu_time(stop_time)
        naiv_time_8 = naiv_time_8 + stop_time - start_time

        call cpu_time(start_time)
        C16 = naivmull(A16,B16)
        call cpu_time(stop_time)
        naiv_time_16 = naiv_time_16 + stop_time - start_time
            
        call cpu_time(start_time)
        C4 =  bettermull(A4,B4)
        call cpu_time(stop_time)
        better_time_4 = better_time_4 + stop_time - start_time

        call cpu_time(start_time)
        C8 = bettermull(A8,B8)
        call cpu_time(stop_time)
        better_time_8 = better_time_8 + stop_time - start_time

        call cpu_time(start_time)
        C16 = bettermull(A16,B16)
        call cpu_time(stop_time)
        better_time_16 = better_time_16 + stop_time - start_time

        call cpu_time(start_time)
        C4 = dotmull(A4,B4)
        call cpu_time(stop_time)
        dot_time_4 = dot_time_4 + stop_time - start_time

        call cpu_time(start_time)
        C8 = dotmull(A8,B8)
        call cpu_time(stop_time)
        dot_time_8 = dot_time_8 + stop_time - start_time

        call cpu_time(start_time)
        C16 = dotmull(A16,B16)
        call cpu_time(stop_time)
        dot_time_16 = dot_time_16 + stop_time - start_time

        call cpu_time(start_time)
        C4 = matmul(A4,B4)
        call cpu_time(stop_time)
        matmul_time_4 = matmul_time_4 + stop_time - start_time

        call cpu_time(start_time)
        C8 = matmul(A8,B8)
        call cpu_time(stop_time)
        matmul_time_8 = matmul_time_8 + stop_time - start_time

        call cpu_time(start_time)
        C16 = matmul(A16,B16)
        call cpu_time(stop_time)
        matmul_time_16 = matmul_time_16 + stop_time - start_time


        write (*,*) better_time_16*10000
        write(10, *) n, " ", naiv_time_4*10000
        write(11, *) n, " ", naiv_time_8*10000
        write(12, *) n, " ", naiv_time_16*10000
        write(13, *) n, " ", better_time_4*10000
        write(14, *) n, " ", better_time_8*10000
        write(15, *) n, " ", better_time_16*10000
        write(16, *) n, " ", dot_time_4*10000
        write(17, *) n, " ", dot_time_8*10000
        write(18, *) n, " ", dot_time_16*10000
        write(19, *) n, " ", matmul_time_4*10000
        write(20, *) n, " ", matmul_time_8*10000
        write(21, *) n, " ", matmul_time_16*10000

        n = n*2
    end do

    if (allocated(A4)) deallocate(A4)
    if (allocated(B4)) deallocate(B4)
    if (allocated(C4)) deallocate(C4)

    if (allocated(A8)) deallocate(A8)
    if (allocated(B8)) deallocate(B8)
    if (allocated(C8)) deallocate(C8)

    if (allocated(A16)) deallocate(A16)
    if (allocated(B16)) deallocate(B16)
    if (allocated(C16)) deallocate(C16)

    close(unit = 10, status = 'KEEP')
    close(unit = 11, status = 'KEEP')
    close(unit = 12, status = 'KEEP')
    close(unit = 13, status = 'KEEP')
    close(unit = 14, status = 'KEEP')
    close(unit = 15, status = 'KEEP')
    close(unit = 16, status = 'KEEP')
    close(unit = 17, status = 'KEEP')
    close(unit = 18, status = 'KEEP')
    close(unit = 19, status = 'KEEP')
    close(unit = 20, status = 'KEEP')
    close(unit = 21, status = 'KEEP')

    contains

    subroutine fill_matrix(n)
        implicit none
        integer, intent(in) :: n
        integer :: i, j
        do i = 1, n
            do j = 1, n
                call random_number(A4(i,j))
                call random_number(B4(i,j))
                call random_number(A8(i,j))
                call random_number(B8(i,j))
                call random_number(A16(i,j))
                call random_number(B16(i,j))
            end do
         end do
    end subroutine fill_matrix

end program main
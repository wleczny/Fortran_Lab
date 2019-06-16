program sumsignals
    
    use, intrinsic :: iso_c_binding

    implicit none

    include "fftw3.f03"

    real(C_DOUBLE), dimension(:), allocatable :: sumSignalArr
    complex(C_DOUBLE_COMPLEX), dimension(:), allocatable :: resArr

    type(C_PTR) :: plan

    real, parameter :: PI=4*atan(1.0)
    integer, parameter :: frecuency = 700 
    real :: startTime = 0.0 
    real :: interval = 1/real(frecuency-1)
    
    integer :: i
    character(:), allocatable :: format1
    character(:), allocatable :: format2

    format1 = "(F13.10,A1,F19.16)"
    format2 = "(I3,A1,F20.16)"

    allocate(sumSignalArr(frecuency))
    allocate(resArr(frecuency/2 + 1))
    open(unit = 11, file = "../res/sum.txt", status = 'REPLACE')
    open(unit = 12, file = "../res/fft.txt", status = 'REPLACE')


    do i = 1, frecuency
        sumSignalArr(i) = sin(2*PI*startTime*200) + 2*sin(2*PI*startTime*400)
        write(unit = 11, fmt = format1) startTime, " ", sumSignalArr(i)
        startTime = startTime+interval
    end do

    plan = fftw_plan_dft_r2c_1d(size(sumSignalArr), sumSignalArr, resArr, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(plan, sumSignalArr, resArr)

    do i = 1, frecuency/2+1
        write(unit = 12, fmt = format2) i, " ", abs(resArr(i))
    end do

    call fftw_destroy_plan(plan)
    if(allocated(sumSignalArr)) deallocate(sumSignalArr)
    if(allocated(resArr)) deallocate(resArr)
    close(unit = 11, status = 'KEEP')
    close(unit = 12, status = 'KEEP')

end program sumsignals
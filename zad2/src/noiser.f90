program noisermv

    use, intrinsic :: iso_c_binding
    use ifport

    implicit none

    include "fftw3.f03"

    real(C_DOUBLE), dimension(:), allocatable :: tSigArray 
    complex(C_DOUBLE_COMPLEX), dimension(:), allocatable :: fSigArray

    type(C_PTR) :: planr2c
    type(C_PTR) :: planc2r

    integer, parameter :: freq = 2000
    real :: startTime = 0.0
    real :: interval = 6/real(freq-1)

    integer :: i
    real :: noises
    character(:), allocatable :: format1
    character(:), allocatable :: format2

    format1 = "(F13.10,A1,F22.16)"
    format2 = "(I3,A1,F21.16)"


    allocate(tSigArray(freq))
    allocate(fSigArray(freq/2 + 1))
    open(unit = 11, file = "../res/cos.txt", status = 'REPLACE')
    open(unit = 12, file = "../res/noisy.txt", status = 'REPLACE')
    open(unit = 13, file = "../res/noisyFft.txt", status = 'REPLACE')
    open(unit = 14, file = "../res/clearedFft.txt", status = 'REPLACE')
    open(unit = 15, file = "../res/cleared.txt", status = 'REPLACE')
    call srand(86456)


    do i  = 1, freq
        tSigArray(i) = cos(startTime)
        write(unit = 11, fmt = format1) startTime, " ", tSigArray(i)

        noises = rand(0)
        tSigArray(i) = tSigArray(i) + noises
        write(unit = 12, fmt = format1) startTime, " ", tSigArray(i)
        
        startTime = startTime+interval
    end do


    planr2c = fftw_plan_dft_r2c_1d(size(tSigArray), tSigArray, fSigArray, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(planr2c, tSigArray, fSigArray)

    do i  = 1, freq/2 + 1
        write(unit = 13, fmt = format2) i , " ", abs(fSigArray(i))

        if(abs(fSigArray(i))<50) then
            fSigArray(i) = 0.0
        end if
        write(unit = 14, fmt = format2) i , " ", abs(fSigArray(i))
    end do

    planc2r = fftw_plan_dft_c2r_1d(size(tSigArray), fSigArray, tSigArray, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_c2r(planc2r, fSigArray, tSigArray)

    startTime = 0.0

    do i  = 1, freq
        write(unit = 15, fmt = format1) startTime, " ", tSigArray(i)/freq
        startTime = startTime+interval
    end do

    call fftw_destroy_plan(planr2c)
    call fftw_destroy_plan(planc2r)
    if(allocated(tSigArray)) deallocate(tSigArray)
    if(allocated(fSigArray)) deallocate(fSigArray)
    close(unit = 11, status = 'KEEP')
    close(unit = 12, status = 'KEEP')
    close(unit = 13, status = 'KEEP')
    close(unit = 14, status = 'KEEP')
    close(unit = 15, status = 'KEEP')

end program noisermv
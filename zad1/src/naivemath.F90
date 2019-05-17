module naivemath

    implicit none
    public :: naivmull
    private :: naivmul_4, naivmul_8, naivmul_16

    interface naivmull
    procedure naivmul_4, naivmul_8, naivmul_16
    end interface

    contains

    function naivmul_4 (A,B) result(C)
        real (kind = 4), intent(in), dimension(:,:) :: A,B
        real (kind = 4), dimension(size(B(:,1)), size(A(1,:))) :: C
        integer :: i, j, k
        integer :: x, y, z
        x = size(A(:,1))
        y = size(B(:,1))
        z = size(A(1,:))
        do i = 1, x, 1
            do j = 1, y, 1
                do k = 1, z, 1
                    C(j,k) = C(j,k) + A(i,k) * B(j,i)
                end do
            end do
        end do
    end function naivmul_4  

    function naivmul_8 (A,B) result(C)
        real (kind = 8), intent(in), dimension(:,:) :: A,B
        real (kind = 8), dimension(size(B(:,1)), size(A(1,:))) :: C
        integer :: i, j, k
        integer :: x, y, z
        x = size(A(:,1))
        y = size(B(:,1))
        z = size(A(1,:))
        do i = 1, x, 1
            do j = 1, y, 1
                do k = 1, z, 1
                    C(j,k) = C(j,k) + A(i,k) * B(j,i)
                end do
            end do
        end do
    end function naivmul_8

    function naivmul_16 (A,B) result(C)
        real (kind = 16), intent(in), dimension(:,:) :: A,B
        real (kind = 16), dimension(size(B(:,1)), size(A(1,:))) :: C
        integer :: i, j, k
        integer :: x, y, z
        x = size(A(:,1))
        y = size(B(:,1))
        z = size(A(1,:))
        do i = 1, x, 1
            do j = 1, y, 1
                do k = 1, z, 1
                    C(j,k) = C(j,k) + A(i,k) * B(j,i)
                end do
            end do
        end do 
    end function naivmul_16

end module naivemath
module bettermath

    implicit none
    public :: bettermull
    private :: bettermul_4, bettermul_8, bettermul_16

    interface bettermull
    procedure bettermul_4, bettermul_8, bettermul_16
    end interface

    contains

    function bettermul_4 (A,B) result(C)
        real (kind = 4), intent(in), dimension(:,:) :: A,B
        real (kind = 4), dimension(size(B(:,1)), size(A(1,:))) :: C
        integer :: i, j, k
        integer :: x, y, z
        x = size(A(1,:))
        y = size(A(:,1))
        z = size(B(:,1))
        do i = 1, x, 1
            do j = 1, y, 1
                do k = 1, z, 1
                    C(k,i) = C(k,i) + A(j,i) * B(k,j)
                end do
            end do
        end do 
    end function bettermul_4  

    function bettermul_8 (A,B) result(C)
        real (kind = 8), intent(in), dimension(:,:) :: A,B
        real (kind = 8), dimension(size(B(:,1)), size(A(1,:))) :: C
        integer :: i, j, k
        integer :: x, y, z
        x = size(A(1,:))
        y = size(A(:,1))
        z = size(B(:,1))
        do i = 1, x, 1
            do j = 1, y, 1
                do k = 1, z, 1
                    C(k,i) = C(k,i) + A(j,i) * B(k,j)
                end do
            end do
        end do 
    end function bettermul_8

    function bettermul_16 (A,B) result(C)
        real (kind = 16), intent(in), dimension(:,:) :: A,B
        real (kind = 16), dimension(size(B(:,1)), size(A(1,:))) :: C
        integer :: i, j, k
        integer :: x, y, z
        x = size(A(1,:))
        y = size(A(:,1))
        z = size(B(:,1))
        do i = 1, x, 1
            do j = 1, y, 1
                do k = 1, z, 1
                    C(k,i) = C(k,i) + A(j,i) * B(k,j)
                end do
            end do
        end do 
    end function bettermul_16

end module bettermath

module dotmath

    implicit none
    public :: dotmull
    private :: dotmul_4, dotmul_8, dotmul_16

    interface dotmull
    procedure dotmul_4, dotmul_8, dotmul_16
    end interface

    contains

    function dotmul_4(A,B) result(C)
        real (kind = 4), intent(in), dimension(:,:) :: A,B
        real (kind = 4), dimension(size(B(:,1)),size(A(1,:))) :: C
        integer:: x, y
        integer:: i, j
        x = size(B(:,1))
        y = size(A(1,:))
        do i = 1, x
            do  j = 1, y
                C(i,j) = dot_product(A(:,j), B(i,:))
            end do
        end do
    end function dotmul_4

    function dotmul_8(A,B) result(C)
        real (kind = 8), intent(in), dimension(:,:) :: A,B
        real (kind = 8), dimension(size(B(:,1)),size(A(1,:))) :: C
        integer:: x, y
        integer:: i, j
        x = size(B(:,1))
        y = size(A(1,:))
        do i = 1, x
            do  j = 1, y
                C(i,j) = dot_product(A(:,j), B(i,:))
            end do
        end do
    end function dotmul_8

    function dotmul_16(A,B) result(C)
        real (kind = 16), intent(in), dimension(:,:) :: A,B
        real (kind = 16), dimension(size(B(:,1)),size(A(1,:))) :: C
        integer:: x, y
        integer:: i, j
        x = size(B(:,1))
        y = size(A(1,:))
        do i = 1, x
            do  j = 1, y
                C(i,j) = dot_product(A(:,j), B(i,:))
            end do
        end do
    end function dotmul_16

end module dotmath
module functions

    implicit none

    contains

        function exponential(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = exp(x)
        end function exponential

        function sinus(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = sin(x)
        end function sinus
        
        function poly1(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = x + 1
        end function poly1

        function poly2(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = x**2 + x
        end function poly2

        function poly3(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = 2*x**3
        end function poly3

        function poly4(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = 3*x**4 - 2*x**2
        end function poly4

        function poly5(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = x**5 - x
        end function poly5

        function poly6(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = 2*x**6 + x**4
        end function poly6

        function poly7(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = x**7 - 4*x**3
        end function poly7

        function poly8(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = x**8
        end function poly8

        function poly9(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = 4*x**9 - 30*x**3
        end function poly9

        function poly10(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y

            y = x**10 - 7*x**8 + 3
        end function poly10

end module functions

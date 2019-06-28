module integrate_functions

    implicit none

    interface 
        function func(x) result(y)
            implicit none
            real(kind = 8), intent(in) :: x
            real(kind = 8) :: y
        end function func
    end interface

    interface
        function integration(start, endi, f, p) result(res)
            import :: func
            implicit none
            real(kind = 8), intent(in) :: start, endi
            procedure(func) :: f
            integer(kind = 4), intent(in) :: p
            real(kind = 8) :: res
        end function integration
    end interface

    contains 


    function rectangle_integration(start, endi, f, p) result(res)

        implicit none
        real(kind = 8), intent(in) :: start, endi
        procedure(func) :: f
        integer(kind = 4), intent(in) :: p
        real(kind = 8) :: res

        real(kind = 8) :: delta, middle, middleVal

        delta = abs(endi - start)
        middle = (start + endi)/2
        middleVal = f(middle)
        res = delta * middleVal

    end function rectangle_integration


    function trapezoid_integration(start, endi, f, p) result(res)

        implicit none
        real(kind = 8), intent(in) :: start, endi
        procedure(func) :: f
        integer(kind = 4), intent(in) :: p
        real(kind = 8) :: res

        real(kind = 8) :: delta, startVal, endVal

        delta = abs(endi - start)
        startVal = f(start)
        endVal = f(endi)
        res = delta * (startVal + endVal)/2

    end function trapezoid_integration


    function gauss_integration(start, endi, f, p) result(res)

        implicit none
        real(kind = 8), intent(in) :: start, endi
        procedure(func) :: f
        integer(kind = 4), intent(in) :: p
        real(kind = 8) :: res

        integer(kind = 4) :: i
        real(kind = 8), dimension(4) :: Legandre2
        real(kind = 8), dimension(6) :: Legandre3
        real(kind = 8), dimension(8) :: Legandre4
        real(kind = 8), dimension(10) :: Legandre5
        real(kind = 8), dimension(12) :: Legandre6

        Legandre2 = (/-0.57735026918, 0.57735026918, 1.0, 1.0/)
        Legandre3 = (/-0.77459666924, 0.0,  0.77459666924,  0.55555555555, 0.8888888889, 0.55555555556 /)
        Legandre4 = (/-0.86113631159, -0.33998104358, 0.33998104358, 0.86113631159, 0.34785484513,&
                     0.65214515486, 0.65214515486, 0.34785484513/)
        Legandre5 = (/-0.90617984593, -0.53846931010, 0.0, 0.5384693101, 0.906179845, 0.23692688505,&
                    0.47862867049, 0.568888,  0.47862867049, 0.23692688505/)
        Legandre6 = (/-0.9324695142, -0.6612093864, -0.23861918608, 0.23861918608, 0.66120938646, 0.93246951420,&
                    0.17132449237, 0.36076157304, 0.46791393457, 0.46791393457, 0.36076157304, 0.17132449237/)

        res = 0.0

        if(p == 1 .or. p == 2 .or. p == 3) then
            do i = 1, 2, 1
                res = res + Legandre2(i*2)*f((endi+start)/2+(endi-start)*Legandre2(i)/2)*(endi-start)/2
            end do
        end if


        if(p == 4 .or. p == 5) then
            do i = 1, 3, 1
                res = res + Legandre3(i*2)*f((endi+start)/2+(endi-start)*Legandre3(i)/2)*(endi-start)/2
            end do
        end if

        if(p == 6 .or. p == 7) then
            do i = 1, 4, 1
                res = res + Legandre4(i*2)*f((endi+start)/2+(endi-start)*Legandre4(i)/2)*(endi-start)/2
            end do
        end if

        if(p == 8 .or. p == 9) then
            do i = 1, 5, 1
                res = res + Legandre5(i*2)*f((endi+start)/2+(endi-start)*Legandre5(i)/2)*(endi-start)/2
            end do
        end if

        if(p == 10) then
            do i = 1, 6, 1
                res = res + Legandre6(i*2)*f((endi+start)/2+(endi-start)*Legandre6(i)/2)*(endi-start)/2
            end do
        end if

    end function gauss_integration

end module integrate_functions
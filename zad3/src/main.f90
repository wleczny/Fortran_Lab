program main

    use integrate_functions
    use functions
    implicit none

    procedure(integration), pointer :: integration_pointer => null()
    procedure(func), pointer :: function_pointer => null()
    real(kind = 8), codimension[*] :: val
    real(kind  = 8) :: start
    real(kind  = 8) :: endi
    integer :: i,j
    real(kind = 8) :: dx
    integer :: descr
    character(:), allocatable :: format1

    format1 = "(A23, F11.4)"

    open(unit = 11, file = "../res/rectangle_res.txt", status = 'REPLACE')
    open(unit = 12, file = "../res/trapezoid_res.txt", status = 'REPLACE')
    open(unit = 13, file = "../res/gauss_res.txt", status = 'REPLACE')

    start = 0
    endi = 4
    dx = abs(endi-start)/15

    do i = 1, 3, 1
        if(i == 1) then
            integration_pointer => rectangle_integration
            descr = 11
        else if(i == 2) then
            integration_pointer => trapezoid_integration
            descr = 12
        else if(i == 3) then
            integration_pointer => gauss_integration
            descr = 13
        end if

        function_pointer => sinus
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 5)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "sinus: ", val
        end if

        function_pointer => exponential
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 5)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "exp: ", val
        end if  

        function_pointer => poly1
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 1)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "x: ", val
        end if

        function_pointer => poly2
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 2)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "x^2: ", val
        end if

        function_pointer => poly3
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 3)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "x^3: ", val
        end if

        function_pointer => poly4
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 4)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "x^4: ", val
        end if

        function_pointer => poly5
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 5)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "x^5: ", val
        end if

        function_pointer => poly6
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 6)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "x^6: ", val
        end if

        function_pointer => poly7
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 7)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "x^7: ", val
        end if

        function_pointer => poly8
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 8)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "x^8: ", val
        end if

        function_pointer => poly9
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 9)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "x^9: ", val
        end if

        function_pointer => poly10
        val = 0.0
        do j = this_image(),15,num_images()
            val = val + integration_pointer(start+(j-1)*dx,start+j*dx,function_pointer, 10)
        end do
        syncall()
        if(this_image() == 1) then
            do j = 2,num_images(),1
                val = val + val[j]
            end do
            write(unit = descr, fmt = format1) "x^10: ", val
        end if
   
    end do

    close(unit = 11, status = 'KEEP')
    close(unit = 12, status = 'KEEP')
    close(unit = 13, status = 'KEEP')

end program main

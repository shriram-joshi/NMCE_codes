Module Data_

    use kind
    use omp_lib
    implicit none

    ! Declare Global variables that will be frequently used during simulation
    ! Examples are:
    real(kind=rk) :: C1, C2
    real(kind=rk) :: Oh, Gbond
    real(kind=rk), allocatable, dimension(:,:) :: ph1, dph1
    real(kind=rk), dimension(3) :: xiarr
    real(kind=rk), dimension(3) :: wei

    real(kind=rk) :: Pe, h
    real(kind=rk), dimension(:), allocatable :: R, xMesh
    real(kind=rk), dimension(:,:), allocatable :: JG, jL
    real(kind=rk), dimension(2) :: uBC, xSpan
    integer :: n, nl

contains

    ! You can make subroutines here

    subroutine Init_problem()
        n=0
        do while (n <= 0)
            ! Total number of ELEMENTS
            print*, "Number of elements (n > 0) - "
            read*, n
            print*
        end do

        Pe = -1
        do while (Pe < 0)
            ! Setup Pe number and Neumann boundary conditions
            print*, "Peclet Number (Pe >= 0) - "
            read*, Pe
            print*
        end do

        ! Size of the local matrix, depends on type of elements
        ! 2 for linear, 3 for quadratic, so on
        nl = 2 

        ! BC for u
        uBC = (/0.0_rk, 1.0_rk/)
        ! Range of x
        xSpan = (/0.0_rk, 1.0_rk/)

        ! Initiallize variables
        allocate(jL(nl,nl))
        allocate(R(n+1))
        ! We allocate n+2 columns since the FullGaussSolverp function requires a matrix with dimesnions (n,n+1)
        ! Check the FullGaussSolverp.f file for details
        allocate(JG(n+1,n+2))
        allocate(xMesh(n+1))
        allocate(ph1(nl,3))
        allocate(dph1(nl,3))

        R = 0.0_rk
        jL = 0.0_rk
        JG(1:n+1,1:n+2) = 0.0_rk

    end subroutine Init_problem

    subroutine Gauss_points()
        implicit none

        xiarr(1)=(1.0_rk-0.774596669241483_rk)*0.5_rk
        xiarr(2)=0.5_rk
        xiarr(3)=(1.0_rk+0.774596669241483_rk)*0.5_rk
        wei(1)=(0.555555555555556_rk)*0.5_rk
        wei(2)=(0.888888888888889_rk)*0.5_rk
        wei(3)=(0.555555555555556_rk)*0.5_rk

    end subroutine Gauss_points
end module Data_

module solver_mod
  use precision_mod
  use bc_mod
  use scheme_mod
  implicit none

contains

  subroutine advance(u, dx, dt, c)
    real(rk), intent(inout) :: u(:)
    real(rk), intent(in)    :: dx, dt, c
    real(rk), allocatable   :: flux(:)
    integer :: i, n

    n = size(u)
    allocate(flux(n))

    call apply_periodic(u)
    call upwind_flux(u, flux, c)

    do i = 2, n-1
       u(i) = u(i) - dt/dx * (flux(i) - flux(i-1))
    end do

    deallocate(flux)
  end subroutine advance

end module solver_mod
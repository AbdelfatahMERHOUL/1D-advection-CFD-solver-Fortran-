module bc_mod
  use precision_mod
  implicit none

contains

  subroutine apply_periodic(u)
    real(rk), intent(inout) :: u(:)
    integer :: n

    n = size(u)
    u(1) = u(n-1)
    u(n) = u(2)
  end subroutine apply_periodic

end module bc_mod
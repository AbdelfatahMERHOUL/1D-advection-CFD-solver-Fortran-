module scheme_mod
  use precision_mod
  implicit none

contains

  subroutine upwind_flux(u, flux, c)
    real(rk), intent(in)  :: u(:), c
    real(rk), intent(out) :: flux(:)

    flux = c * u
  end subroutine upwind_flux

end module scheme_mod
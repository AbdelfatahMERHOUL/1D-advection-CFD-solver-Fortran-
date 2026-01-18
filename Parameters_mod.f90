module parameters_mod
  use precision_mod
  implicit none

  real(rk), parameter :: x_start = 0.0_rk
  real(rk), parameter :: x_end   = 1.0_rk
  integer,  parameter :: nx      = 200

  real(rk), parameter :: c       = 1.0_rk
  real(rk), parameter :: CFL     = 0.5_rk
  real(rk), parameter :: t_end   = 1.0_rk
end module parameters_mod

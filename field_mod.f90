module field_mod
  use precision_mod
  implicit none

  type :: field_1d
     real(rk), allocatable :: u(:)
  end type field_1d

contains

  subroutine allocate_field(field, nx)
    type(field_1d), intent(out) :: field
    integer, intent(in)         :: nx
    allocate(field%u(nx))
  end subroutine allocate_field

end module field_mod
module mesh_mod
  use precision_mod
  implicit none

  type :: mesh_1d
     integer :: nx
     real(rk) :: dx
     real(rk), allocatable :: x(:)
  end type mesh_1d

contains

  subroutine init_mesh(mesh, x_start, x_end, nx)
    type(mesh_1d), intent(out) :: mesh
    real(rk), intent(in)       :: x_start, x_end
    integer, intent(in)        :: nx
    integer :: i

    mesh%nx = nx
    mesh%dx = (x_end - x_start) / nx
    allocate(mesh%x(nx))

    do i = 1, nx
       mesh%x(i) = x_start + (i - 0.5_rk) * mesh%dx
    end do
  end subroutine init_mesh

end module mesh_mod
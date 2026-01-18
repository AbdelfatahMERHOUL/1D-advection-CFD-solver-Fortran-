program advection_1d
  use precision_mod
  use parameters_mod
  use mesh_mod
  use field_mod
  use solver_mod
  use io_mod
  implicit none

  type(mesh_1d)  :: mesh
  type(field_1d) :: field
  real(rk) :: t, dt
  integer :: i, step

  call init_mesh(mesh, x_start, x_end, nx)
  call allocate_field(field, nx)

  ! Initial condition: square pulse
  do i = 1, nx
     if (mesh%x(i) > 0.3_rk .and. mesh%x(i) < 0.5_rk) then
        field%u(i) = 1.0_rk
     else
        field%u(i) = 0.0_rk
     end if
  end do

  dt = CFL * mesh%dx / abs(c)
  t = 0.0_rk
  step = 0

  call write_solution(mesh%x, field%u, step)

  do while (t < t_end)
     call advance(field%u, mesh%dx, dt, c)
     t = t + dt
     step = step + 1
  end do

  call write_solution(mesh%x, field%u, step)
end program advection_1d

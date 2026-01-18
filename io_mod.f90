module io_mod
  use precision_mod
  implicit none

contains

  subroutine write_solution(x, u, step)
    real(rk), intent(in) :: x(:), u(:)
    integer, intent(in)  :: step
    integer :: i, unit
    character(len=40) :: filename

    write(filename, '("solution_", I5.5, ".dat")') step
    open(newunit=unit, file=filename, status="replace")

    do i = 1, size(x)
       write(unit,*) x(i), u(i)
    end do

    close(unit)
  end subroutine write_solution

end module io_mod
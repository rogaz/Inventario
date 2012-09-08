module EmployeesHelper

  def is_fire?
    unless @employee.termination_date
      false
    else
      true
    end
  end

end

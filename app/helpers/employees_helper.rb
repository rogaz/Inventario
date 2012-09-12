module EmployeesHelper

  def is_fire?
    unless @employee.termination_date
      false
    else
      true
    end
  end

  def obtener_diferencia(fecha1, fecha2)
    diferencia = (fecha1-fecha2)
    return diferencia.numerator.to_s + " dias"
  end

end

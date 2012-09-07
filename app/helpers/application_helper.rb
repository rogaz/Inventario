module ApplicationHelper

  def fecha_con_formato(fecha)
    meses = "Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre".split(" ")
    mes = meses[fecha.month-1]
    fecha = fecha.day.to_s + "/" + mes + "/" + fecha.year.to_s
    return fecha
  end

end

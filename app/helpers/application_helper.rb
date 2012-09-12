module ApplicationHelper

  def fecha_con_formato(fecha)
    unless fecha == nil
      meses = "Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre".split(" ")
      mes = meses[fecha.month-1]
      fecha = fecha.day.to_s + "/" + mes + "/" + fecha.year.to_s
      return fecha
    end
  end

  def active_barra_superior
    @modelo_actual

  end

end

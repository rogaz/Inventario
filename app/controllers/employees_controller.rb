# coding: utf-8
class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.json


  def index
    @employees = Employee.where(:termination_date => nil)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        flash[:success] = 'El empleado se creó correctamente.'
        format.html { redirect_to employees_url }
        format.json { render json: employees_url, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])
    
    unless @employee.termination_date == nil
      anio = params[:employee]['hire_date(1i)'].to_i
      mes = params[:employee]['hire_date(2i)'].to_i
      dia = params[:employee]['hire_date(3i)'].to_i
      hire_date = DateTime.civil(anio, mes, dia)
      validar_fecha(hire_date)
      if hire_date > @employee.termination_date
        guardar = false
      else
        guardar = true
      end
    end

    respond_to do |format|
      if guardar == false
        flash[:notice] = 'La fecha de contratación no puede ser mayor a la fecha de liquidación.'
        format.html { render action: "edit" }
      elsif @employee.update_attributes(params[:employee])
        flash[:success] = 'El empleado se actualizó correctamente.'
        format.html { redirect_to @employee }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  def liquidar
    @employee = Employee.find(params[:id])
    @employee.termination_date = Time.now
    @employee.save

    respond_to do |format|
      format.html { redirect_to @employee, :notice => "Se a liquidado a " + @employee.name.to_s }
      format.json { head :no_content }
    end
  end

  def index_liquidados
    @employees = Employee.where("termination_date IS NOT NULL") #order("termination_date asc", "name asc" )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

private
  def validar_fecha(fecha)
    anio = fecha.year
    mes = fecha.month
    dia = fecha.day

    if anio%4 == 0
      if (mes == 4 || mes == 6 || mes == 11) && (dia > 30)
        print "false\n"
      elsif mes == 2 && dia > 29
        print "false\n"
      else
        print "true\n"
      end
      print dia.to_s + " " + mes.to_s + " " + anio.to_s + " es viciesto"
    end
  end
end
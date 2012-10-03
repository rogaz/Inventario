# coding: utf-8
class DetailsController < ApplicationController
  # GET /details
  # GET /details.json
  def index
    @details = Detail.all
    @modelo_actual = "details"
    #session[:sale_id] = nil
    #session[:created_sale] = nil

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @details }
    end
  end

  # GET /details/1
  # GET /details/1.json
  def show
    @detail = Detail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @detail }
    end
  end

  # GET /details/new
  # GET /details/new.json
  def new
    @detail = Detail.new
    @products = Product.all
    @product_types = ProductType.all
    if session[:created_sale] == nil
      @sale = Sale.new
      @sale.date = Time.now
      @sale.save
      session[:sale_id] = @sale.id
      session[:created_sale] = "true"
    end
    @details = Detail.where(:sale_id => session[:sale_id])


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @detail }
    end
  end

  # GET /details/1/edit
  def edit
    @detail = Detail.find(params[:id])
  end

  # POST /details
  # POST /details.json
  def create
    @detail = Detail.new(params[:detail])
    @detail.sale_id = session[:sale_id]

    respond_to do |format|
      if @detail.save
        format.html { redirect_to new_detail_path }
        format.json { render json: @detail, status: :created, location: @detail }
      else
        format.html { render action: "new" }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /details/1
  # PUT /details/1.json
  def update
    @detail = Detail.find(params[:id])

    respond_to do |format|
      if @detail.update_attributes(params[:detail])
        format.html { redirect_to @detail, notice: 'Detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1
  # DELETE /details/1.json
  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy

    respond_to do |format|
      format.html { redirect_to details_url }
      format.json { head :no_content }
    end
  end

  def close_sale
    @sale = Sale.find(session[:sale_id])
    @details = Detail.where(:sale_id => @sale.id)
    total = 0
    @details.each do |detail|
      total += (detail.unit_price * detail.quantity)
    end
    @sale.total = total
    @sale.customer_id = params[:sale][:customer_id]
    @sale.save
    session[:sale_id] = nil
    session[:created_sale] = nil

    respond_to do |format|
      format.html { redirect_to sales_path }
      format.json { head :no_content }
    end
  end

  def delete_sale
    @sale = Sale.find(session[:sale_id])
    @sale.destroy
    session[:sale_id] = nil
    session[:created_sale] = nil

    respond_to do |format|
      format.html { redirect_to sales_path }
      format.json { head :no_content }
    end
  end

end

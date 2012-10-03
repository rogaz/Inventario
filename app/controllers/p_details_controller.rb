class PDetailsController < ApplicationController
  # GET /p_details
  # GET /p_details.json
  def index
    @p_details = PDetail.all
    @modelo_actual = "p_details"
    #session[:purchase_id] = nil
    #session[:created_purchase] = nil

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @p_details }
    end
  end

  # GET /p_details/1
  # GET /p_details/1.json
  def show
    @p_detail = PDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @p_detail }
    end
  end

  # GET /p_details/new
  # GET /p_details/new.json
  def new
    @p_detail = PDetail.new
    @products = Product.all
    @product_types = ProductType.all
    if session[:created_purchase] == nil
      @purchase = Purchase.new
      @purchase.date = Time.now
      @purchase.save
      session[:purchase_id] = @purchase.id
      session[:created_purchase] = "true"
    end
    @p_details = PDetail.where(:purchase_id => session[:purchase_id])
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @p_detail }
    end
  end

  # GET /p_details/1/edit
  def edit
    @p_detail = PDetail.find(params[:id])
  end

  # POST /p_details
  # POST /p_details.json
  def create
    @p_detail = PDetail.new(params[:p_detail])
    @p_detail.purchase_id = session[:purchase_id]

    respond_to do |format|
      if @p_detail.save
        format.html { redirect_to new_p_detail_path }
        format.json { render json: @p_detail, status: :created, location: @p_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @p_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /p_details/1
  # PUT /p_details/1.json
  def update
    @p_detail = PDetail.find(params[:id])

    respond_to do |format|
      if @p_detail.update_attributes(params[:p_detail])
        format.html { redirect_to @p_detail, notice: 'P detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @p_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /p_details/1
  # DELETE /p_details/1.json
  def destroy
    @p_detail = PDetail.find(params[:id])
    @p_detail.destroy

    respond_to do |format|
      format.html { redirect_to new_p_detail_path }
      format.json { head :no_content }
    end
  end

  def close_purchase
    @purchase = Purchase.find(session[:purchase_id])
    @p_details = PDetail.where(:purchase_id => @purchase.id)
    total = 0
    @p_details.each do |p_detail|
      total += (p_detail.unit_price * p_detail.quantity)
    end
    @purchase.total = total
    @purchase.save

    session[:purchase_id] = nil
    session[:created_purchase] = nil

    respond_to do |format|
      format.html { redirect_to purchases_path }
      format.json { head :no_content }
    end
  end

  def delete_purchase
    @purchase = Purchase.find(session[:purchase_id])
    @purchase.destroy
    
    session[:purchase_id] = nil
    session[:created_purchase] = nil

    respond_to do |format|
      format.html { redirect_to purchases_path }
      format.json { head :no_content }
    end
  end
end

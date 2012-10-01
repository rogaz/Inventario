class PDetailsController < ApplicationController
  # GET /p_details
  # GET /p_details.json
  def index
    @p_details = PDetail.all

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

    respond_to do |format|
      if @p_detail.save
        format.html { redirect_to @p_detail, notice: 'P detail was successfully created.' }
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
      format.html { redirect_to p_details_url }
      format.json { head :no_content }
    end
  end
end

class SalutationsController < ApplicationController
  before_filter :authenticate_user!
  # GET /salutations
  # GET /salutations.json
  def index
    @salutations = Salutation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salutations }
    end
  end

  # GET /salutations/1
  # GET /salutations/1.json
  def show
    @salutation = Salutation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @salutation }
    end
  end

  # GET /salutations/new
  # GET /salutations/new.json
  def new
    @salutation = Salutation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @salutation }
    end
  end

  # GET /salutations/1/edit
  def edit
    @salutation = Salutation.find(params[:id])
  end

  # POST /salutations
  # POST /salutations.json
  def create
    @salutation = Salutation.new(params[:salutation])

    respond_to do |format|
      if @salutation.save
        format.html { redirect_to @salutation, notice: 'Salutation was successfully created.' }
        format.json { render json: @salutation, status: :created, location: @salutation }
      else
        format.html { render action: "new" }
        format.json { render json: @salutation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /salutations/1
  # PUT /salutations/1.json
  def update
    @salutation = Salutation.find(params[:id])

    respond_to do |format|
      if @salutation.update_attributes(params[:salutation])
        format.html { redirect_to @salutation, notice: 'Salutation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @salutation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salutations/1
  # DELETE /salutations/1.json
  def destroy
    @salutation = Salutation.find(params[:id])
    @salutation.destroy

    respond_to do |format|
      format.html { redirect_to salutations_url }
      format.json { head :ok }
    end
  end
end

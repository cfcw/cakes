class TargetAgesController < ApplicationController
  # GET /target_ages
  # GET /target_ages.json
  def index
    @target_ages = TargetAge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @target_ages }
    end
  end

  # GET /target_ages/1
  # GET /target_ages/1.json
  def show
    @target_age = TargetAge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @target_age }
    end
  end

  # GET /target_ages/new
  # GET /target_ages/new.json
  def new
    @target_age = TargetAge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @target_age }
    end
  end

  # GET /target_ages/1/edit
  def edit
    @target_age = TargetAge.find(params[:id])
  end

  # POST /target_ages
  # POST /target_ages.json
  def create
    @target_age = TargetAge.new(params[:target_age])

    respond_to do |format|
      if @target_age.save
        format.html { redirect_to @target_age, notice: 'Target age was successfully created.' }
        format.json { render json: @target_age, status: :created, location: @target_age }
      else
        format.html { render action: "new" }
        format.json { render json: @target_age.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /target_ages/1
  # PUT /target_ages/1.json
  def update
    @target_age = TargetAge.find(params[:id])

    respond_to do |format|
      if @target_age.update_attributes(params[:target_age])
        format.html { redirect_to @target_age, notice: 'Target age was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @target_age.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /target_ages/1
  # DELETE /target_ages/1.json
  def destroy
    @target_age = TargetAge.find(params[:id])
    @target_age.destroy

    respond_to do |format|
      format.html { redirect_to target_ages_url }
      format.json { head :no_content }
    end
  end
end

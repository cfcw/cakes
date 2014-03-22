#coding: utf-8
# ReputationsController
# Author:: Hiroyuki, Tajima
# Date:: 2014.03.22
class ReputationsController < ApplicationController
  # GET /reputations
  # GET /reputations.json
  def index
    @reputations = Reputation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reputations }
    end
  end

  # GET /reputations/1
  # GET /reputations/1.json
  def show
    @reputation = Reputation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reputation }
    end
  end

  # GET /reputations/new
  # GET /reputations/new.json
  def new
    @reputation = Reputation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reputation }
    end
  end

  # GET /reputations/1/edit
  def edit
    @reputation = Reputation.find(params[:id])
  end

  # POST /reputations
  # POST /reputations.json
  def create
    @reputation = Reputation.new(params[:reputation])

    respond_to do |format|
      if @reputation.save
        format.html { redirect_to @reputation, notice: 'Reputation was successfully created.' }
        format.json { render json: @reputation, status: :created, location: @reputation }
      else
        format.html { render action: "new" }
        format.json { render json: @reputation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reputations/1
  # PUT /reputations/1.json
  def update
    @reputation = Reputation.find(params[:id])

    respond_to do |format|
      if @reputation.update_attributes(params[:reputation])
        format.html { redirect_to @reputation, notice: 'Reputation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reputation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reputations/1
  # DELETE /reputations/1.json
  def destroy
    @reputation = Reputation.find(params[:id])
    @reputation.destroy

    respond_to do |format|
      format.html { redirect_to reputations_url }
      format.json { head :no_content }
    end
  end
end

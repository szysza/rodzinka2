=begin
class PermissionsToFamiliesController < ApplicationController
  # GET /permissions_to_families
  # GET /permissions_to_families.json
  def index
    @permissions_to_families = PermissionsToFamily.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @permissions_to_families }
    end
  end

  # GET /permissions_to_families/1
  # GET /permissions_to_families/1.json
  def show
    @permissions_to_family = PermissionsToFamily.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @permissions_to_family }
    end
  end

  # GET /permissions_to_families/new
  # GET /permissions_to_families/new.json
  def new
    @permissions_to_family = PermissionsToFamily.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @permissions_to_family }
    end
  end

  # GET /permissions_to_families/1/edit
  def edit
    @permissions_to_family = PermissionsToFamily.find(params[:id])
  end

  # POST /permissions_to_families
  # POST /permissions_to_families.json
  def create
    @permissions_to_family = PermissionsToFamily.new(params[:permissions_to_family])

    respond_to do |format|
      if @permissions_to_family.save
        format.html { redirect_to @permissions_to_family, notice: 'Permissions to family was successfully created.' }
        format.json { render json: @permissions_to_family, status: :created, location: @permissions_to_family }
      else
        format.html { render action: "new" }
        format.json { render json: @permissions_to_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /permissions_to_families/1
  # PUT /permissions_to_families/1.json
  def update
    @permissions_to_family = PermissionsToFamily.find(params[:id])

    respond_to do |format|
      if @permissions_to_family.update_attributes(params[:permissions_to_family])
        format.html { redirect_to @permissions_to_family, notice: 'Permissions to family was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @permissions_to_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions_to_families/1
  # DELETE /permissions_to_families/1.json
  def destroy
    @permissions_to_family = PermissionsToFamily.find(params[:id])
    @permissions_to_family.destroy

    respond_to do |format|
      format.html { redirect_to permissions_to_families_url }
      format.json { head :no_content }
    end
  end
end
=end

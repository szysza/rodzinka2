class FamiliesController < ApplicationController
  # TODO: User friendly powiadomienie o niemożlności edycji dla edit?

  def index
    @families = Family.all
  end

  def show
    @family = Family.find(params[:id])
  end

  def new
    @family = Family.new
  end

  def edit
    @family = @current_user.moderated_families.find(params[:id])
  end

  def create
    if @family = @current_user.create_family(params[:family])
      redirect_to @family, notice: 'Family was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @family = @current_user.moderated_families.find(params[:id])

    if @family.update_attributes(params[:family])
      redirect_to @family, notice: 'Family was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @family = @current_user.moderated_families.find(params[:id])
    @family.destroy

    redirect_to families_url
  end
end

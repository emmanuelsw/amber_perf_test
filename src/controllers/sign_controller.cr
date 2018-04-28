class SignController < ApplicationController
  def index
    signs = Sign.all
    respond_with { json signs.to_json }
  end

  def show
    if sign = Sign.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Sign with ID #{params["id"]} Not Found"
      redirect_to "/signs"
    end
  end

  def new
    sign = Sign.new
    render("new.slang")
  end

  def create
    sign = Sign.new(sign_params.validate!)

    if sign.valid? && sign.save
      flash["success"] = "Created Sign successfully."
      redirect_to "/signs"
    else
      flash["danger"] = "Could not create Sign!"
      render("new.slang")
    end
  end

  def edit
    if sign = Sign.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Sign with ID #{params["id"]} Not Found"
      redirect_to "/signs"
    end
  end

  def update
    if sign = Sign.find(params["id"])
      sign.set_attributes(sign_params.validate!)
      if sign.valid? && sign.save
        flash["success"] = "Updated Sign successfully."
        redirect_to "/signs"
      else
        flash["danger"] = "Could not update Sign!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Sign with ID #{params["id"]} Not Found"
      redirect_to "/signs"
    end
  end

  def destroy
    if sign = Sign.find params["id"]
      sign.destroy
    else
      flash["warning"] = "Sign with ID #{params["id"]} Not Found"
    end
    redirect_to "/signs"
  end

  def sign_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:email) { |f| !f.nil? }
      required(:phone) { |f| !f.nil? }
      required(:birthdate) { |f| !f.nil? }
      required(:sign) { |f| !f.nil? }
    end
  end
end

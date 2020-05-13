class IpasController < ApplicationController
    before_action :logged_in?, :current_ipa, except: [:new, :create, :index]
    before_action :not_authorized
    
    def index
        redirect_to new_user_path unless logged_in?
        if params[:name]
            @ipas = Ipa.where('name LIKE ?', "%#{params[:name]}%")
        else
            @ipas = Ipa.recent
        end
    end

    def new 
        @ipa = Ipa.new
    end

    def create
        @ipa = Ipa.create(ipa_params)
        if @ipa.valid?
            flash[:notice] = "IPA Creation Successful!"
            redirect_to @ipa
        else
            render :new
        end
    end
    
    def update
        if @ipa.update(ipa_params)
            @ipa.save
            flash[:notice] = "Update Successful!"
            redirect_to @ipa
        else
            render :edit
        end
    end
    
    def show
        @reviews = @ipa.reviews
    end
    
    def destroy
        current_ipa.destroy
        flash[:notice] = "IPA Deleted!"
        redirect_to ipas_path
    end

    
    private

    def current_ipa
        @ipa = Ipa.find_by(id: params[:id])
    end

    def ipa_params
        params.require(:ipa).permit(:name, :brand, :size)
    end
    
end

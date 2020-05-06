class IpasController < ApplicationController
    before_action :logged_in?, :current_ipa, except: [:new, :create]
    def index
        redirect_to new_user_path unless logged_in?
        @ipas = Ipa.all
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

    def destroy
    end

    private

    def current_ipa
        @ipa = Ipa.find_by(id: params[:id])
    end

    def ipa_params
        params.require(:ipa).permit(:name, :brand, :size)
    end
end

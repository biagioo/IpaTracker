class ReviewsController < ApplicationController
    before_action :logged_in?   

    def index
        if params[:ipa_id]
            @ipa = Ipa.find_by(id: params[:ipa_id]) 
            if @ipa 
                @reviews = @ipa.reviews 
            else
                redirect_to ipas_path, alert: "Ipa not found"
            end
        else
            redirect_to ipas_path
        end
    end

end

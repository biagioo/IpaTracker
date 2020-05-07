class ReviewsController < ApplicationController
    before_action :logged_in?, :current_user   

    def index
        if params[:ipa_id]
            @ipa = Ipa.find_by(id: params[:ipa_id]) 
            if @ipa 
                @reviews = @ipa.reviews 
            else
                redirect_to ipas_path
            end
        else
            redirect_to ipas_path
        end
    end
    
    def new 
        if params[:ipa_id]
            @ipa = Ipa.find_by(id: params[:ipa_id]) 
            @review = @ipa.reviews.new(user_id: @user.id)
        end
    end

    def create
        @ipa = Ipa.find_by(id: params[:ipa_id]) 
        @review = @ipa.reviews.create(review_params)
        if @review.valid? 
            @review.save
            @ipa = @review.ipa
            redirect_to ipa_review_path(@ipa, @review)
        else
            byebug
        end

       
    end

    def show
        @ipa = Ipa.find_by(id: params[:ipa_id])
        @review = @ipa.reviews.find_by(id: params[:id])
    end


    private

    def review_params
        params.require(:review).permit(:title, :content, :user_id)
    end

end

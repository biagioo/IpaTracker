class ReviewsController < ApplicationController
    before_action :logged_in?, :current_user, :find_ipa  

    def index
        if params[:ipa_id]
            find_ipa
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
            find_ipa
            @review = @ipa.reviews.new(user_id: @user.id)
        end
    end

    def create
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
        @review = @ipa.reviews.find_by(id: params[:id])
    end
    
    def edit 
        @review = Review.find_by(id: params[:id])
        if params[:ipa_id] && current_user.id == @review.user_id 
            find_ipa
        end
    end 

    def update
        @review = Review.find_by(id: params[:id])
        if @review.update(review_params) && @review.valid?
            redirect_to ipa_review_path(@ipa, @review)
        else 
            render :edit
        end
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        if params[:ipa_id] && current_user.id == @review.user_id 
            @review.destroy
            redirect_to ipa_path(@ipa)
        end
    end

    private

    def find_ipa
        @ipa = Ipa.find_by(id: params[:ipa_id])
    end

    def review_params
        params.require(:review).permit(:title, :content, :user_id )
    end

end

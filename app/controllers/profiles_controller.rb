class ProfilesController < ApplicationController

    def show
        profile = Profile.find(params[:id])
        if profile
            render json: profile
           else
            render status: :bad_request, json: {error: profile.errors.full_messages}
           end
    end

    def create
        profile = Profile.new(profile_params)
        if profile.save
        render json: profile
       else
        render status: :bad_request, json: {error: profile.errors.full_messages}
       end
    end

    def update
        profile = Profile.find(params[:id])
        if profile.update(profile_params)
            render json: {success: "true"}
        else
            render status: :bad_request, json: {error: profile.errors.full_messages}
        end
    end


    private
  
    def profile_params
        params.require(:profile).permit(:id, :profile_name, :company_name, :address, :abn, :email, :contact_number, :bank_details)
    end
end

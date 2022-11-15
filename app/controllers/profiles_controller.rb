class ProfilesController < ApplicationController

    def show
        profile = Profile.find(params[:id])
        render json: profile
    end

    def create
        profile = Profile.new(profile_params)
        if profile.save
        render json: profile
       else
        render text: "profile not saved" 
       end
    end


    private
  
    def profile_params
        params.require(:profile).permit(:id, :profile_name, :company_name, :address, :abn, :email, :contact_number, :bank_details)
    end
end

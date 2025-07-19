class Api::V1::DonationTargetsController < ApplicationController
    skip_before_action :authenticate_user

    def index
        @donation_targets = DonationTarget.all
        render json: @donation_targets
    end

    def show
        render json: @donation_target
    end

    def create
        @donation_target = DonationTarget.new(donation_target_params)

        if @donation_target.save
            render json: @donation_target, status: :created
        else
            render json: @donation_target.errors, status: :unprocessable_entity
        end
    end

    def update
        @donation_target = DonationTarget.find(params[:id])

        if @donation_target.update(donation_target_params)
            render json: @donation_target, status: :ok
        else
            render json: @donation_target.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @donation_target.destroy
        head :no_content
    end

    private

    def set_donation_target
        @donation_target = DonationTarget.find(params[:id])
    end

    def donation_target_params
        params.require(:donation_target).permit(:name, :website_url, :bank_account_info, :contact_email)
    end
end

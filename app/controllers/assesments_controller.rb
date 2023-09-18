# frozen_string_literal: true

class AssesmentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    # @user = User.find(params['user_id'])
    # @user = current_user
    @assesment = current_user.assesments.new(assesment_params) # .transform_values(&:upcase)
    if @assesment.save!
      render json: { 'assesment': @assesment,
                     message: "#{current_user.name.capitalize}'s assesment was successfully created." }
    else
      render json: { 'errors': [@assesment.errors.full_messages] }, status: :unprocessable_entity
    end
  end

  def show
    # @user = User.find(params['user_id'])
    # @user = current_user
    @assesments = current_user.assesments.order(created_at: :desc).first(2) # find(params[:id])
    render json: @assesments
  end

  def update
    # @user = User.find(params['user_id'])
    # @user = current_user
    @assesments_find = current_user.assesments.find(params[:id])
    if @assesments_find.update(assesment_params) # .transform_values(&:upcase)
      render json: { 'assesments_find': @assesments_find,
                     message: "#{current_user.name.capitalize}'s assesments  was successfully updated." }, status: :ok
    else
      render json: { message: "Failed to update #{current_user.name.capitalize}'s assesments." },
             status: :unprocessable_entity
    end
  end

  def destroy
    # @user = User.find(params['user_id'])
    # @user = current_user
    @education_find = current_user.assesments.find(params[:id])
    if @education_find.destroy
      render json: { 'education_find': @education_find,
                     message: "#{current_user.name.capitalize}'s was successfully deleted." }, status: :ok
    else
      render json: { message: "Failed to delete #{current_user.name.capitalize}'s." }, status: :unprocessable_entity
    end
  end

  private

  def assesment_params
    params.require(:assesments).permit(:hobbies, :skills, :intrest)
  end
end

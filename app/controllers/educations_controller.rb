# frozen_string_literal: true

class EducationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    # @user = User.find(params['user_id'])
    # @user = current_user
    @educations = current_user.educations
    @assesments = current_user.assesments

    render json: { message: "#{current_user.name.capitalize}'s educations.",
                   'educations': @educations, 'assesments': @assesments, 'users': current_user }
  end

  def create
    # @user = User.find(params['user_id'])
    # @user = current_user
    @education = current_user.educations.new(education_params)
    if @education.save!
      render json: { 'education': @education,
                     message: "#{current_user.name.capitalize}'s education was successfully created." }
    else
      render json: { 'errors': [@education.errors.full_messages] }, status: :unprocessable_entity
    end
  end

  def show
    # @user = User.find(params['user_id'])
    # @user = current_user
    @educations = current_user.educations.order(created_at: :desc).first(2) # find(params[:id])

    render json: { 'educations': @educations,
                   message: "#{current_user.name.capitalize}'s educations." }
  end

  def update
    # @user = User.find(params['user_id'])
    # @user = current_user
    @education_find = current_user.educations.find(params[:id])
    # debugger
    if @education_find.update(education_params) # .transform_values(&:upcase)
      render json: { 'education_find': @education_find,
                     message: "#{current_user.name.capitalize}'s education was successfully updated." }
    else
      render json: { message: "Failed to update #{current_user.name.capitalize}'s education." },
             status: :unprocessable_entity
    end
  end

  def destroy
    # @user = User.find(params['user_id'])
    # @user = current_user
    @education_find = current_user.educations.find(params[:id])
    if @education_find.destroy
      render json: { 'education_find': @education_find,
                     message: "#{current_user.name.capitalize}'s education was successfully deleted." }
    else
      render json: { message: "Failed to delete #{current_user.name.capitalize}'s education." },
             status: :unprocessable_entity
    end
  end

  private

  def education_params
    params.require(:educations).permit(:school_name, :education_type, :stream)
  end

  def assesments_params
    params.require(:assesments).permit(:hobbies, :skills, :intrest)
  end
end

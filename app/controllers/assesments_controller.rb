class AssesmentsController < ApplicationController
  
  before_action :authenticate_user!
  load_and_authorize_resource  
  
  def create
    # debugger
    @user = current_user
    @assesment = @user.assesments.new(assesment_params)#.transform_values(&:upcase)
    if @assesment.save!
      render json: { 'assesment': @assesment,
                     message: "#{@user.name.capitalize}'s assesment was successfully created." }
    else
      render json: { 'errors': [@assesment.errors.full_messages] }, status: :unprocessable_entity
    end
  end

  def show
    # @user = User.find(params['user_id'])
    @user = current_user
    @assesments = @user.assesments.order(created_at: :desc).first(2) # find(params[:id])
    render json: @assesments
  end

  def update
    # @user = User.find(params['user_id'])
    @user = current_user
    @assesments_find = @user.assesments.find(params[:id])
    if @assesments_find.update(assesments_params) # .transform_values(&:upcase)
      render json: { message: "#{@user.name.capitalize}'s assesments  was successfully updated." }, status: :ok
    else
      render json: { message: "Failed to update #{@user.name.capitalize}'s assesments." }, status: :unprocessable_entity
    end
  end

  def destroy
    # @user = User.find(params['user_id'])
    @user = current_user
    @education_find = @user.assesments.find(params[:id])
    if @education_find.destroy
      render json: { message: "#{@user.name.capitalize}'s was successfully deleted." }, status: :ok
    else
      render json: { message: "Failed to delete #{@user.name.capitalize}'s." }, status: :unprocessable_entity
    end
  end

  private

  def assesment_params
    params.require(:assesments).permit(:hobbies, :skills, :intrest)
  end
  def assesments_params
    params.require(:assesment).permit(:hobbies, :skills, :intrest)
  end
end

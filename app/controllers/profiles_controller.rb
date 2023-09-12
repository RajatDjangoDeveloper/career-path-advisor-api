class ProfilesController < ApplicationController
  EDU_TYPE = " U.G-B.tech", "P.G-M.B.A"

  # before_action :authenticate_user!
  # load_and_authorize_resource
  def index
    # debugger
    @user = User.find(params["user_id"])
    @educations = @user.educations
    @assesments = @user.assesments
    render json: {'educations': @educations, 'assesments': @assesments, 'users': @users}
    
    # render json: User.all

  end

  def create

    @user = User.find(params["user_id"])
    @education = @user.educations.new(education_params.transform_values(&:upcase))
    if @education.save!
      render json: { 'education': @education }
    else
      render json: { 'errors': [@education.errors.full_messages] }, status: :unprocessable_entity
    end

  end

  def show

    @user = User.find(params["user_id"]) 
    @educations = @user.educations.order(created_at: :desc).first(2)     #find(params[:id])
    render json: @educations
  end

  def update

    @user = User.find(params["user_id"])
    @education_find = @user.educations.find(params[:id])
    if @education_find.update(education_params) #.transform_values(&:upcase)
       render json: { message: 'User was successfully updated.' }, status: :ok
    else
      render json: { message: 'Failed to update user.' }, status: :unprocessable_entity
    end

  end

  def destroy

    @user = User.find(params["user_id"])
    @education_find = @user.educations.find(params[:id])
    if @education_find.destroy()
      render json: { message: 'User was successfully deleted.' }, status: :ok
    else
      render json: { message: 'Failed to delete user.' }, status: :unprocessable_entity
    end

  end

  private
 
  def user_paramas
    params.require(:user).permit(:name, :gender, :dob )
  end

  def education_params
    params.require(:educations).permit(:school_name, :education_type, :stream)
  end

  def assesments_params
    params.require(:assesments).permit(:hobbies, :skills, :intrest)
  end
end

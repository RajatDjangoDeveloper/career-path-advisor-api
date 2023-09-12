class AssessmentsController < ApplicationController

  def create
    # debugger
    @user = User.find(params["user_id"])
    @assesment = @user.assesments.new(assesments_params.transform_values(&:upcase))
    if @assesment.save!
      render json: { 'assesment': @assesment, message: "#{@user.name.capitalize}'s assesment was successfully created." } # 
    else
      render json: { 'errors': [@assesment.errors.full_messages] }, status: :unprocessable_entity
    end

  end


  def show

    @user = User.find(params["user_id"]) 
    @assesments = @user.assesments.order(created_at: :desc).first(2)     #find(params[:id])
    render json: @assesments

  end

  def update
    # debugger
    @user = User.find(params["user_id"])
    @assesments_find = @user.assesments.find(params[:id])
    if @assesments_find.update(assesments_params) #.transform_values(&:upcase)
       render json: { message: "#{@user.name.capitalize}'s assesments  was successfully updated." }, status: :ok
    else
      render json: { message: "Failed to update #{@user.name.capitalize}'s assesments." }, status: :unprocessable_entity
    end

  end

  def destroy

    @user = User.find(params["user_id"])
    @education_find = @user.assesments.find(params[:id])
    if @education_find.destroy()
      render json: { message: "#{@user.name.capitalize}'s was successfully deleted." }, status: :ok
    else
      render json: { message: "Failed to delete #{@user.name.capitalize}'s."}, status: :unprocessable_entity
    end

  end


  private
  def assesments_params
    params.require(:assesments).permit(:hobbies, :skills, :intrest)
  end
end

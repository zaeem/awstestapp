class AwsUsersController < ApplicationController
  before_action :set_aws_user, only: [:show, :edit, :update, :destroy]

  # GET /aws_users
  # GET /aws_users.json
  def index
    @aws_users = AwsUser.all
  end

  # GET /aws_users/1
  # GET /aws_users/1.json
  def show
  end

  # GET /aws_users/new
  def new
    @aws_user = AwsUser.new
  end

  # GET /aws_users/1/edit
  def edit
  end

  # POST /aws_users
  # POST /aws_users.json
  def create
    @aws_user = AwsUser.new(aws_user_params)

    respond_to do |format|
      if @aws_user.save
        format.html { redirect_to @aws_user, notice: 'Aws user was successfully created.' }
        format.json { render :show, status: :created, location: @aws_user }
      else
        format.html { render :new }
        format.json { render json: @aws_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_users/1
  # PATCH/PUT /aws_users/1.json
  def update
    respond_to do |format|
      if @aws_user.update(aws_user_params)
        format.html { redirect_to @aws_user, notice: 'Aws user was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_user }
      else
        format.html { render :edit }
        format.json { render json: @aws_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_users/1
  # DELETE /aws_users/1.json
  def destroy
    @aws_user.destroy
    respond_to do |format|
      format.html { redirect_to aws_users_url, notice: 'Aws user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_user
      @aws_user = AwsUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_user_params
      params.require(:aws_user).permit(:first_name, :last_name, :email)
    end
end

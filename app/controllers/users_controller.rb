# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users.as_json(methods: [:id], except: [:_id])
  end

  def show
    @user = User.find_by(id: params['id'])
    if @user.nil?
      render json: { error: 'User not found' }, status: :not_found
    else
      render json: @user.as_json(methods: [:id], except: [:_id])
    end
  end

  def new; end

  def create
    user = User.new(user_params)

    if user.valid?
      render json: { message: 'User created successfully', user: }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:ip_address)
  end
end

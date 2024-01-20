# frozen_string_literal: true

class AnalyticsController < ApplicationController
  def overall
    all_users = User.all
    all_logs = all_users.map(&:logs).flatten

    render json: all_logs.group_by(&:itself).transform_values(&:count).sort_by { |_, v| -v }.to_h
  end

  def per_user
    user = User.find_by(id: params['id'])

    if user.nil?
      render json: { error: 'User not found' }, status: :not_found
    else
      render json: user.logs.group_by(&:itself).transform_values(&:count).sort_by { |_, v| -v }.to_h
    end
  end
end

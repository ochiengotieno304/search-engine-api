# frozen_string_literal: true

class User
  include Mongoid::Document

  field :ip_address, type: String
  field :logs, type: Array, default: []

  def id
    _id.to_s
  end

  def push_to_logs(value)
    logs << value
    save
  end
end

# frozen_string_literal: true

class Article
  include Mongoid::Document
  field :title, type: String
  field :content, type: String

  def id
    _id.to_s
  end
end

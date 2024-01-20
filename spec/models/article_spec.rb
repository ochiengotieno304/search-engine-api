# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#id' do
    it 'returns the string representation of the _id' do
      article = Article.new
      expect(article.id).to eq(article._id.to_s)
    end
  end

  describe 'fields' do
    it 'has a title field of type String' do
      expect(Article.fields['title'].type).to eq(String)
    end

    it 'has a content field of type String' do
      expect(Article.fields['content'].type).to eq(String)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /articles' do
    it 'works! (now write some real specs)' do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /articles/:id' do
    it 'returns an article' do
      article = Article.create(title: 'hello', content: 'world')
      get article_path(article)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /search' do
    it 'returns an articles' do
      Article.create(title: 'hello', content: 'world')
      post search_path, params: { search: 'hello' }
      expect(response).to have_http_status(200)
      expect(response.body).to include('hello')
      expect(response.body).to include('world')
    end
  end
end

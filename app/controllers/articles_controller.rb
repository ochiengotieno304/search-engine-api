# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles.as_json(methods: [:id], except: [:_id])
  end

  def show
    @article = Article.find_by(id: params['id'])

    if @article.nil?
      render json: { error: 'Article not found' }, status: :not_found
    else
      create_or_log_user(params['ipAddress'], @article) if params['ipAddress']
      render json: @article.as_json(methods: [:id], except: [:_id])
    end
  end

  def new; end

  def search
    search_terms = params[:search].split(/\s+/).map { |term| Regexp.escape(term) }
    regex_query = {
      '$or' => [
        { title: { '$regex' => Regexp.new(search_terms.join('|'), 'i') } },
        { content: { '$regex' => Regexp.new(search_terms.join('|'), 'i') } }
      ]
    }

    @articles = Article.where(regex_query)
    render json: @articles.as_json(methods: [:id], except: [:_id])
  end

  private

  def create_or_log_user(ip_address, article)
    User.find_or_create_by(ip_address:).push_to_logs(article._id.to_s)
  end
end

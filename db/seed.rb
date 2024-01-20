# frozen_string_literal: true

require 'faker'

fake_data = []

20.times do
  fake_data << {
    title: Faker::TvShows::BrooklynNineNine.character,
    content: Faker::TvShows::BrooklynNineNine.quote
  }
end

Article.destroy_all

Article.create!(fake_data)

p "Created #{Article.count} Articles"

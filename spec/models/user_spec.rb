# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new }
  it 'has an ip_address field of type String' do
    expect(User.fields['ip_address'].type).to eq(String)
  end

  it 'has a logs field of type Array' do
    expect(User.fields['logs'].type).to eq(Array)
  end

  describe '#id' do
    it 'returns the string representation of the _id' do
      expect(user.id).to eq(user._id.to_s)
    end
  end

  describe '#push_to_logs' do
    it 'adds the value to the logs array' do
      user.push_to_logs('hello')
      expect(user.logs).to include('hello')
    end

    it 'saves the user' do
      expect(user).to receive(:save)
      user.push_to_logs('hello')
    end
  end
end

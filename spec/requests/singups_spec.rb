require 'rails_helper'

RSpec.describe "Singups", type: :request do
  describe 'post /signup' do
    it 'should ' do
      post('/signup', params: {user: nil, pass: nil})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('Fill the blank')

      post('/signup', params: {user: '', pass: ''})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('Fill the blank')

      post('/signup', params: {user: 'test', pass: ''})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('Fill the blank')

      post('/signup', params: {user: 'test', pass: '1'})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('Username has already used')

      post('/signup', params: {user: 'unittest', pass: '1'})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('Signup sucessful')
    end
  end
end

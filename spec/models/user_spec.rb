require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }  
  it { is_expected.to validate_confirmation_of(:password )}
  it { is_expected.to allow_value("example@gmail.com").for(:email) }
  it { is_expected.to validate_uniqueness_of(:auth_token) }

  describe '#info' do 
    it 'returns email and created_at and Token' do
      user.save!
      allow(Devise).to receive(:friendly_token).and_return('abcTOKEN')

      expect(user.info).to eq("#{user.email} - #{user.created_at} - Token: abcTOKEN")
    end
  end

  describe '#generate_authentication_token!' do
    it 'generate a unique auth token' do
      allow(Devise).to receive(:friendly_token).and_return('abcTOKEN')
      user.generate_authentication_token!

      expect(user.auth_token).to eq('abcTOKEN')
    end

    it 'generate another token when the current token already has been taken' do    
      allow(Devise).to receive(:friendly_token).and_return('abcdeTOKEN', 'abc1234567')
      existing_user = create(:user)
      user.generate_authentication_token!

      expect(user.auth_token).not_to eq(existing_user.auth_token)
    end

  end

end
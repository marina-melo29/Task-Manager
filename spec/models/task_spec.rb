require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { build(:task) }

  context 'When is new' do
    it { expect(task).not_to be_done }
  end

  # Confere se pertence a um usuário
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :user_id }

  # Vê se o campo existe
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:deadline) }
  it { is_expected.to respond_to(:done) }
  it { is_expected.to respond_to(:user_id) }

end

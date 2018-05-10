require 'rails_helper'

RSpec.describe Site, type: :model do
  subject(:site) {build(:site)}
  it { is_expected.to be_valid }

  describe 'validation' do


    it '初期データはvalidであること' do
      expect(subject).to be_truthy
    end

    it 'URLはHTTPS?で始まること' do
      expect(subject).to be_truthy
    end
  end

  it 'クローリングのテスト' do
    pp site = create(:site)
  end
end

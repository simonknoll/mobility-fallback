require "rails_helper"

RSpec.describe Contribution, :type => :model do
  describe ".create" do
    before (:each) do
      @c = Contribution.create
      I18n.locale = :en
      @c.landing_page = 'google.co.uk'
    end

    it 'creates a non nil object' do
      expect(@c.present?).to be(true)
      expect(@c).to eq(Contribution.first)
    end

    it 'has :en landing_page' do
      expect(@c.landing_page(locale: :en)).to eq('google.co.uk')
    end

    it 'falls back to :en, when accessing a non existant locale' do
      expect(@c.landing_page(locale: :fr, fallback: [:en])).to eq('google.co.uk')
    end
  end
end

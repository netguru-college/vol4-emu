require 'rails_helper'

RSpec.describe Event, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:event) {FactoryBot.create(:event)}
  subject {event}


  describe 'database columns' do
    it {is_expected.to have_db_column :title}
    it {is_expected.to have_db_column :capacity}
    it {is_expected.to have_db_column :started_at}
    it {is_expected.to have_db_column :ended_at}
    it {is_expected.to have_db_column :description}
  end

  describe 'associations' do
    it {is_expected.to have_many :participations}
    it {should have_many(:users).through(:participations)}
  end

end















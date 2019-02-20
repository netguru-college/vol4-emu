require 'rails_helper'

RSpec.describe Event, type: :model do
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
    it {should belong_to(:sport)}
  end

  describe 'validations' do
    it {expect(subject).to validate_presence_of(:title)}
    it {expect(subject).to validate_presence_of(:description)}
    it {expect(subject).to validate_length_of(:description).is_at_least(10)}
    it {expect(subject).to validate_length_of(:description).is_at_most(500)}
    it {expect((subject.started_at) < (subject.ended_at))}
    it {expect(!(subject.started_at).past?)}
    it {expect((subject.capacity) > 1)}

  end

end














# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Complaint, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:status) }
  end
end

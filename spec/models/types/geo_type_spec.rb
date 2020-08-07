# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::GeoType do
  describe '#cast' do
    subject { described_class.new.cast(value) }

    context 'when string' do
      let(:value) { '(1.5,1.6)' }
      it { is_expected.to have_attributes(lat: 1.5, lng: 1.6) }
    end

    context 'when hash' do
      let(:value) { { lat: 1.5, lng: 1.6 } }
      it { is_expected.to have_attributes(lat: 1.5, lng: 1.6) }
    end

    context 'when array' do
      let(:value) { [1.5, 1.6] }
      it { is_expected.to have_attributes(lat: 1.5, lng: 1.6) }
    end
  end

  describe '#serialize' do
    subject { described_class.new.serialize(value) }

    context 'when receive a lat and lng' do
      let(:value) { Types::GeoType::LatLng.new(1.5, 1.6) }
      it { is_expected.to eq('(1.5,1.6)') }
    end

     context 'when receive an array' do
       let!(:value) { [1.5, 1.6] }
       it { is_expected.to eq('(1.5,1.6)') }
     end
  end
end

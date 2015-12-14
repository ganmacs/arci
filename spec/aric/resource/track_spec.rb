require 'aric/resource/track'

describe Aric::Resource::Track do
  let(:track) { described_class.new(resource) }

  describe '#to_s' do
    subject { track.to_s }

    let(:resource) do
      {
        name: 'girlgirlgirl',
        artist: 'fujifabric',
        album: 'GIRLS'
      }
    end

    it { is_expected.to eq 'girlgirlgirl / fujifabric / GIRLS' }
  end

  describe 'Check methods' do
    subject { track }

    let(:resource) do
      {
        loved: true,
        sample: false
      }
    end

    it { is_expected.to be_loved }
    it { is_expected.not_to be_sample }
  end
end

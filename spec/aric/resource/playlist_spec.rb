require 'aric/resource/playlist'

describe Aric::Resource::Playlist do
  let(:playlist) { described_class.new(resource) }

  describe '#to_s' do
    subject { playlist.to_s }

    let(:resource) do
      {
        name: 'girlgirlgirl',
      }
    end

    it { is_expected.to eq 'girlgirlgirl' }
  end

  describe 'Check methods' do
    subject { playlist }

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

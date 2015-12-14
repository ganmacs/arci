require 'aric/job_handler'

describe Aric::JobHandler do
  let(:handler) { described_class.new(job_name) }

  # Mock
  class Aric::Job::Sample < Aric::Job::Base
    def sample_method
      'sample'
    end
  end

  describe '.jobs' do
    subject { described_class.jobs }
    it { is_expected.to be_include :sample_method }
  end

  describe '.job_class_hash' do
    let(:c) { Aric::Job.const_get(:Sample) }
    subject { described_class.job_class_hash[c] }

    it { is_expected.to eq [:sample_method] }
  end

  describe '#run' do
    subject { handler.run }

    context 'passes the Unknown job' do
      let(:job_name) { :unknow }
      it { expect { subject }.to raise_error Aric::JobHandler::JobNotFound }
    end

    context 'passes the known job' do
      let(:job_name) { :sample_method }
      it { is_expected.to eq 'sample' }
    end
  end
end

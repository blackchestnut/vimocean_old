require 'spec_helper'

describe DurationPresenter do
  it 'has access to a view' do
    expect(k(:duration, :object)).to respond_to(:view)
  end

  let(:now) { Time.zone.now }
  let(:started_at) { now }
  let(:schedule) { Schedule.new(started_at: started_at, finished_at: finished_at) }
  let(:duration) { k(:duration, schedule) }

  describe '#ui' do
    subject { duration.ui }

    context '1m' do
      let(:finished_at) { now + 1.minute }
      it { is_expected.to eq '1m' }
    end

    context '59m' do
      let(:finished_at) { now + 59.minute }
      it { is_expected.to eq '59m' }
    end

    context '1h' do
      let(:finished_at) { now + 1.hour }
      it { is_expected.to eq '1h' }
    end

    context '20h' do
      let(:finished_at) { now + 20.hours }
      it { is_expected.to eq '20h' }
    end

    context '1h 19m' do
      let(:finished_at) { now + 79.minutes }
      it { is_expected.to eq '1h 19m' }
    end

    context '2h 10m' do
      let(:finished_at) { now + 130.minutes }
      it { is_expected.to eq '2h 10m' }
    end
  end

  describe '#height_scale' do
    subject { duration.height_scale }
    context '1' do
      let(:finished_at) { now + 1.minute }
      it { is_expected.to eq 1 }
    end

    context '1' do
      let(:finished_at) { now + 60.minute }
      it { is_expected.to eq 1 }
    end

    context '1.5' do
      let(:finished_at) { now + 90.minute }
      it { is_expected.to eq 1.5 }
    end

    context '2' do
      let(:finished_at) { now + 2.hours }
      it { is_expected.to eq 2 }
    end

    context '2.3' do
      let(:finished_at) { now + 2.hours + 20.minutes }
      it { is_expected.to eq 2 }
    end
  end
end

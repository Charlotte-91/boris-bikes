require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it "releases a bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
  it { is_expected.to respond_to(:bike) }

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#release_bike' do
    it "raise an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

end

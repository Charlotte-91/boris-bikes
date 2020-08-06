require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it "releases a bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
  it { is_expected.to respond_to(:bikes) }

  it 'returns docked bikes' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  describe '#release_bike' do
    it "raise an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error "No bikes available"

    end
    it 'raises error if bike is broken' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'Bike is broken'
    end

    describe '#dock' do
      it "raise an error when the docking station is full" do
        DockingStation::DEFAULT_CAPACITY.times {subject.dock Bike.new}
        expect {subject.dock Bike.new }.to raise_error "Docking station is full"
        end
    it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    describe 'initialize' do
      it 'capacity set by user is max capacity' do
      dock = DockingStation.new(50)
      expect(dock.capacity).to eq 50
    end
    end
   end
   end
  end


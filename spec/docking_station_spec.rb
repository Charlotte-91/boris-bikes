require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it "returns a bike" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  #it "bike is working" do
  #  expect(subject.working?).to eq true
  #end

end

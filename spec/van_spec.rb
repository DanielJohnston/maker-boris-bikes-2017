require 'van'

describe Van do
  let(:bike) { double :bike }
  let(:docking_station) { double :docking_station }
  let(:garage) { double :garage }

  it 'can collect and hold a broken bike from a docking station' do
    allow(docking_station).to receive(:release_broken).and_return(bike)
    subject.collect_bike_from(docking_station)
    expect(subject.bikes).to eq [bike]
  end

  it 'can deliver a working bike to a docking station' do
    allow(docking_station).to receive(:dock).and_return(bike)
    allow(docking_station).to receive(:release_broken).and_return(bike)
    allow(bike).to receive(:broken?).and_return(false)
    subject.collect_bike_from(docking_station)
    subject.deliver_bike_to(docking_station)
    expect(subject.bikes).to eq []
  end
end

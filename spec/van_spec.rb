require 'van'

describe Van do
  let(:bike) { double :bike }
  let(:docking_station) { double :docking_station }

  it 'can collect and hold a bike from a docking station' do
    allow(docking_station).to receive(:release_broken).and_return(bike)
    subject.collect_bike_from(docking_station)
    expect(subject.bikes).to eq [bike]
  end

  it 'does not collect a working bike from a docking station' do
    # THIS IS A TEST ON FUNCTIONING OF THE DOCKING STATION
  end
end

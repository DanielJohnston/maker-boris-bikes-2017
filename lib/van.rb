require_relative 'docking_station'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bike_from(station)
    @bikes << station.release_broken
  end
end

require_relative 'docking_station'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bike_from(station)
    @bikes << station.release_broken
  end

  def deliver_bike_to(station)
    bike = @bikes.find { |bike| !bike.broken? }
    raise 'No bikes available' if bike.nil?
    station.dock(@bikes.delete(bike))
  end
end

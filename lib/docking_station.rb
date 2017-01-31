require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    # This is dubious on separation of concerns
    # Reworked method that removes the bike when it releases it
    bike = @bikes.find { |bike| !bike.broken? }
    fail 'No bikes available' if bike == nil
    @bikes.delete(bike)
  end

  def release_broken
    # Reworked method that removes the bike when it releases it
    bike = @bikes.find { |bike| bike.broken? }
    fail 'No bikes available' if bike == nil
    @bikes.delete(bike)
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= capacity
  end

end

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
    # This is dubious on separation of concerns and simplicity
    working_bikes = @bikes.reject { |bike| bike.broken? }
    fail 'No bikes available' if working_bikes.empty?
    working_bikes.pop
  end

  def release_broken
    broken_bikes = @bikes.select { |bike| bike.broken? }
    fail 'No bikes available' if broken_bikes.empty?
    broken_bikes.pop
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

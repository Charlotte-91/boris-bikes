require_relative 'bike'

class DockingStation
attr_reader :bikes
attr_reader :capacity
DEFAULT_CAPACITY = 20

def initialize(capacity= DEFAULT_CAPACITY)
  @bikes = []
  @capacity = capacity
end
  def release_bike
    fail "No bikes available" if @bikes.empty?
    #fail 'Bike is broken' if @bikes[@bikes.length-1].broken? == true
    while true do
      new_bike = @bikes.pop
      if new_bike.broken? == true
        @bikes.unshift(new_bike)
      else
       return new_bike
       break
      end
    end
  end

  def dock(bike)
    fail "Docking station is full" if self.full?
    @bikes << bike
    @bikes[@bikes.length-1]
  end
  private

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.length == 0
  end
end

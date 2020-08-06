require_relative 'bike'

class DockingStation
attr_reader :bikes
def initialize 
  @bikes = []
end
  def release_bike
    fail "No bikes available" unless @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Docking station is full" if @bikes.length >= 20
    @bikes << bike
    @bikes[@bikes.length-1]
  end
end

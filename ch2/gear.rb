class Gear
  attr_reader :chainring, :cog, :rim, :tire, :wheel
  def initialize(args)
    args = default.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @rim = args[:rim]
    @tire = args[:tire]
  end

  def default
    { :chainring => 40, :cog => 18 }
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

puts Gear.new(:chainring => 52, :cog => 11, :rim => 26, :tire => 1.5).gear_inches
# puts Gear.new(52, 11, 26, 1.5).ratio

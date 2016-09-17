class Food
  def self.all
    @@all ||= Serving.all.group_by(&:name).map do |name, servings|
      new(name, servings)
    end
  end

  def self.sort_by_servings
    all.sort_by { |food| food.servings.count }
  end

  def self.sort_by_total_energy
    all.sort_by(&:total_energy)
  end

  attr_reader :name
  attr_reader :servings

  def initialize(name, servings)
    @name = name
    @servings = servings
  end

  def total_energy
    @servings.sum(&:energy)
  end

  def total_energy_percentage
    total_energy / Serving.all.sum(&:energy)
  end
end

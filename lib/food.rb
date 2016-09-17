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

  def self.best_protein_sources
    all.sort_by(&:protein_source_score).reverse
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

  def total_proteins
    @servings.sum(&:proteins)
  end

  def protein_source_score
    return 0 if total_energy == 0

    score = total_proteins * 4 / total_energy

    # trans_fats     = servings.sum(&:trans_fats)
    # cholesterol    = servings.sum(&:cholesterol)
    # saturated_fats = servings.sum(&:saturated)

    # score *= 0.5   if trans_fats > 0
    # score *= 0.9  if cholesterol > 0
    # score *= 0.95 if saturated_fats > 0

    score
  end

  def total_energy_percentage
    total_energy / Serving.all.sum(&:energy)
  end
end

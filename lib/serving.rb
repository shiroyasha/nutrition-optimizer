class Serving

  def self.all
    @@all ||= CSV.foreach("servings.csv").drop(1).map do |row|
      Serving.new(row)
    end
  end

  FIELDS = [
    :day,
    :name,
    :amount,
    :energy,
    :alcohol,
    :caffeine,
    :water,
    :b1,
    :b12,
    :b2,
    :b3,
    :b5,
    :b6,
    :folate,
    :vitamin_a,
    :vitamin_c,
    :vitamin_d,
    :vitamin_e,
    :vitamin_k,
    :calcium,
    :copper,
    :iron,
    :magnesium,
    :manganese,
    :phosphorus,
    :potassium,
    :selenium,
    :sodium,
    :zinc,
    :carbs,
    :fiber,
    :starch,
    :sugars,
    :fat,
    :cholesterol,
    :monounsaturated,
    :omega_3,
    :omega_6,
    :polyunsaturated,
    :saturated,
    :trans_fats,
    :cystine,
    :histidine,
    :isoleucine,
    :leucine,
    :lysine,
    :methionine,
    :phenylalanine,
    :protein,
    :threonine,
    :tryptophan,
    :tyrosine,
    :valine
  ]

  FIELDS.each do |field|
    attr_reader field
  end

  def initialize(raw_data)
    FIELDS.zip(raw_data).each do |field, value|
      unless field == :name
        value = value.to_f
      end

      instance_variable_set(:"@#{field.to_s}", value || 0)
    end
  end
end

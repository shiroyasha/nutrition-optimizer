module Views
  module TopTimesEaten
    module_function

    def render
      foods = Food.sort_by_servings.reverse.map do |food|
        [
          food.name,
          food.servings.count,
          food.servings.sum(&:energy)
        ]
      end

      puts Terminal::Table.new :title => "Top 40 foods (times eaten)",
                               :headings => ["Food", "Count", "Energy"],
                               :rows => foods.take(40)
    end

  end
end

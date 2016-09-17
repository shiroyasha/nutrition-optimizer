module Views
  module TopTimesEaten
    module_function

    def render
      foods = Food.sort_by_servings.reverse.map do |food|
        [
          food.name,
          food.servings.count,
          food.servings.sum(&:energy).to_i
        ]
      end

      table = Terminal::Table.new :title => "Top 40 foods (times eaten)",
                               :headings => ["Food", "Count", "Energy"],
                               :rows => foods.take(40)

      table.align_column(1, :right)
      table.align_column(2, :right)

      puts table
    end

  end
end

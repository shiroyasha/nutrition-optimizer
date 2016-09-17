module Views
  module TopCalorieIntake
    module_function

    def render
      foods = Food.sort_by_total_energy.reverse.map do |food|
        [
          food.name,
          food.total_energy.to_i,
          "#{(food.total_energy_percentage * 100).round(1)} %",
          food.servings.count
        ]
      end

      headings = ["Food", "Energy (kcal)", "Energy (%)", "Servings"]

      table = Terminal::Table.new :title => "Top 40 foods (by calories)",
                                   :headings => headings,
                                   :rows => foods.take(40)

      table.align_column(1, :right)
      table.align_column(2, :right)
      table.align_column(3, :right)

      puts table
    end

  end
end

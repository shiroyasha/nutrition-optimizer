module Views
  module BestProteinSource
    module_function

    def render
      foods = Food.best_protein_sources.map do |food|
        [
          food.name,
          food.total_proteins.to_i,
          food.total_energy.to_i,
          food.servings.count
        ]
      end

      headings = ["Food", "Proteins (kcal)", "Energy (kcal)", "Servings"]

      table = Terminal::Table.new :title => "Best proteins sources",
                                   :headings => headings,
                                   :rows => foods.take(40)

      table.align_column(1, :right)
      table.align_column(2, :right)
      table.align_column(3, :right)

      puts table
    end

  end
end

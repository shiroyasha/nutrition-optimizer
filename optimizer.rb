require "csv"
require "terminal-table"
require "active_support/all"

require_relative "lib/serving"
require_relative "lib/food"

serving_counts = Food.sort_by_servings.reverse
                     .map { |food| [food.name, food.servings.count] }

puts Terminal::Table.new :title => "Top 40 foods (times eaten)",
                         :headings => ["Food", "Count"],
                         :rows => serving_counts.take(40)

food_by_calories = Food.sort_by_total_energy.reverse
                       .map { |food| [food.name, food.total_energy] }

puts Terminal::Table.new :title => "Top 40 foods (by calories)",
                         :headings => ["Food", "Energy"],
                         :rows => food_by_calories.take(40)

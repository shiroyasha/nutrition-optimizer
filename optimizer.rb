require "csv"

require_relative "lib/serving"
require_relative "lib/parser"

servings = Parser.parse_raw_data("servings.csv")

p servings.sort_by { |s| [s.name, s.energy] }.map(&:name)

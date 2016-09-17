require "csv"

require_relative "lib/serving"
require_relative "lib/parser"

servings = Parser.parse_raw_data("servings.csv")

servings.take(10).each { |s| p s.name }


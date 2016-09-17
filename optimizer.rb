require "csv"
require "terminal-table"
require "active_support/all"

require_relative "lib/serving"
require_relative "lib/food"

Dir["lib/views/*"].each { |f| puts f; require_relative f }

Views::TopTimesEaten.render
Views::TopCalorieIntake.render
Views::BestProteinSource.render

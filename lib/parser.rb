module Parser
  module_function

  def parse_raw_data(file_name)
    CSV.foreach("servings.csv").drop(1).map do |row|
      Serving.new(row)
    end
  end
end

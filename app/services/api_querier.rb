class ApiQuerier
  def self.query_api(url, path, options)
    response = connect(url, options).get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method

  def self.connect(url, options)
    Faraday.new(url: url) do |faraday|
      if options[:params]
        options[:params].each do |key, val|
          faraday.params[key] = val
        end
      end 
      faraday.adapter Faraday.default_adapter
    end
  end
end

require 'net/http'
require 'json'

class Session
  def self.load_json(url_string, email, password)
    url = URI(url_string)
    request = Net::HTTP::Get.new(url)
    request.basic_auth(email, password)

    response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
      http.request(request)
    end

    handle_response(response)
  end

  def self.handle_response(response)
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body, { symbolize_names: true })
    else
      nil
    end
  end
end

require 'net/http'

class Session
  def self.load_json(url_string, email, password)
    url = URI(url_string)
    request = Net::HTTP::Get.new(url)
    request.basic_auth(email, password)

    response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
      http.request(request)
    end

    yield(response.code, response.body)
  end
end

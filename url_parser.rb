class UrlParser
  def initialize(url)
    @new_url = url
  end
  def scheme
    @new_url.split(":").first
  end
  def domain
    url = @new_url.split(":")[1]
    url[2..-1]
  end
  def port
    if @new_url.split(':').length < 3 and @new_url.split('http://').length > 1
        "80"
      elsif @new_url.split(':').length < 3 and @new_url.split('https://').length > 1
        "443"
    else url = @new_url.split(":")[2]
      url.split("/")[0]
    end
  end
  def path
    if @new_url.split('/?').length == 2
    nil
    else
      url = @new_url.split("/")[3]
      url.split("?")[0]
    end
  end
  def query_string
    qs = @new_url.split("?").last.split("#").first
    qs_new = qs.split("&").map do |token|
    token.split("=")
    end
  Hash[qs_new]
  end
  def fragment_id
    @new_url.split("#")[1]
  end
end



@new_url = UrlParser.new "http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat"
p @new_url.scheme
p @new_url.domain
p @new_url.port
p @new_url.path
p @new_url.query_string
p @new_url.fragment_id

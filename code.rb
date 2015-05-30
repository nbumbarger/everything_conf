# def placemark_template(name, lat, lng)
#   placemark = "<Placemark>\n<name>#{name}</name>\n<Point>\n<coordinates>\n#{lng},#{lat},0\n</coordinates>\n</Point>\n</Placemark>\n"
# end
# #Start with the raw text
# data = "GA Washington DC\t38.90485\t-77.03394\nGA New York\t40.73930\t-73.98942\nGA Chicago\t41.89061\t-87.62688"
# #Define an empty body and split the text into attributes
# #Insert attributes into the placemark template and append result to the body
# body = String.new
# raw_data.split("\n").each do |line|
#   name, lat, lng = line.split("\t")
#   body += placemark_template(name, lat, lng)
# end
# #Add the standard KML header and footer to the result
# head = "<?xml version='1.0' encoding='UTF-8'?>\n<kml xmlns='http://www.opengis.net/kml/2.2'>\n<Document>\n"
# tail = "</Document>\n</kml>"
# kml = head + body + tail
# #The resulting text represents a complete, valid KML document
# puts kml



# require "HTTParty"
# def geocode(address)
#   results = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address="+address)["results"]
#   location = results.first["geometry"]["location"]
# end
# #Start with the original address data
# data = "GA Washington DC\t1133 15th Street NW, 8th Floor Washington, DC 20005\nGA New York\t902 Broadway, 4th Floor New York, NY 10010\nGA Chicago\t444 N Wabash Ave, 5th Floor Chicago, IL 60611\n"
# #Split into names and addresses, and send the address to the geocoder
# #Reform the original text with coordinates in the place of addresses
# new_data = String.new
# data.split("\n").each do |line|
#    name, address = line.split("\t")
#    coords = geocode(address)
#    new_data += "#{name}\t#{coords['lng']},#{coords['lat']}\n"
# end
# puts new_data



# require "HTTParty"
# def geocode(address)
#   results = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address="+address)["results"]
#   location = results.first["geometry"]["location"]
# end
# def placemark_template(name, lat, lng)
#   placemark = "<Placemark>\n<name>#{name}</name>\n<Point>\n<coordinates>\n#{lng},#{lat},0\n</coordinates>\n</Point>\n</Placemark>\n"
# end
# #Start with the address data
# data = "GA Washington DC\t1133 15th Street NW, 8th Floor Washington, DC 2005\nGA New York\t902 Broadway, 4th Floor New York, NY 10010\nGA Chicago\t444 N Wabash Ave, 5th Floor Chicago, IL 6011\n"
# kml = String.new
# data.split("\n").each do |line|
#    name, address = line.split("\t")
#    coords = geocode(address)
#    kml += placemark_template(name, coords["lat"], coords["lng"])
# end
# head = "<?xml version='1.0' encoding='UTF-8'?>\n<kml xmlns='http://www.opengis.net/kml/2.2'>\n<Document>\n"
# tail = "</Document>\n</kml>"
# kml = head + body + tail
# #End with KML that can be viewed in Google Earth
# puts kml


def attribs2placemark(name, lat lng)
  #Insert attributes into placemark template
  placemark = "<placemark><name>#{name}</name>\n<Point>\n<coordinates>\n#{lat},#{lng},0\n</coordinates>\n</Point></placemark>\n"
end

#Start with a block of text that has coordinates
raw_data = "GA Wash DC\t40.793\t-73.989\nGA New York\t41.891\t-87.627\nGA Chicago\t41.891\t-87.627"

#Split the text into lines and the lines into attributes, and append a copy of each filled-out placemark template to a string.
kml_body = ""
raw_data.split("\n").each do |line|
   name, lat, lng = line.split("\t")
   kml_body += attribs2placemark(name, lat, lng)
 end

#Add kml header and footer to the result
head = '<?xml version="1.0" encoding="UTF-8"?><kml xmlns=http://www.opengis.net/kml/2.2>'
finished_kml = head + kml_body + "</kml>"





require "HTTParty"

def geocode(loc)
  results = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address="+query)["results"]
  location = results.first["geometry"]["location"]
 end

#Start with a block of text
raw_data = "GA Wash DC\t1133 15th Street NW, 8th Floor Washington, DC 20005\nGA New York\t902 Broadway, 4th Floor New York, NY 10010\nGA Chicago\t444 N Wabash Ave, 5th Floor Chicago, IL 60611\n" 

new_data = ""
#Split the text into lines and the lines into attributes, and send the address attribute to the geocoder. Then append the result back into the original text, replacing the address with coordinates.
raw_data.split("\n").each do |line|
   name, addr = line.split("\t")
   #Send the address to the geocoder, and incorporate the result back into a string of text
   coords = geocode(addr)
   new_data = "#{name}\t#{coords['lat']},{coords['lng']}\n"}
 end




require "HTTParty"
def attribs2placemark(name, lat lng)
  placemark = "<placemark><name>#{name}</name>\n<Point>\n<coordinates>\n#{lat},#{lng},0\n</coordinates>\n</Point></placemark>"
end
def geocode(loc)
  results = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address="+query)["results"]
  location = results.first["geometry"]["location"]
 end

#Input text
raw_data = "GA Wash DC\t1133 15th Street NW, 8th Floor Washington, DC 20005\nGA New York\t902 Broadway, 4th Floor New York, NY 10010\nGA Chicago\t444 N Wabash Ave, 5th Floor Chicago, IL 60611\n" 

kml_body = ""
raw_data.split("\n").each do |line|
   name, addr = line.split("\t")
   coords = geocode(addr)
   kml_body += attribs2placemark(name, coords["lat"], coords["lng"])
 end
head = '<?xml version="1.0" encoding="UTF-8"?><kml xmlns=http://www.opengis.net/kml/2.2>'
finished_kml = head + kml_body + "</kml>"




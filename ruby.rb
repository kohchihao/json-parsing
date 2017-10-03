require 'json'
require 'net/http'

string = "http://api.fixer.io/latest?symbols=MYR&base=SGD"

uri = URI(string)

json_response = Net::HTTP.get(uri)

parsed_json = JSON.parse(json_response)

print "whole parsed json: ", parsed_json
print "\nbase: ", parsed_json["base"]
print "\nrates: ", parsed_json["rates"]
print "\nMYR: ", parsed_json["rates"]["MYR"], "\n"

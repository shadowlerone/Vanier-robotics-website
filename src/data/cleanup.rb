require 'json'

data = JSON.parse File.open('members.json').read

data['members'].each {|m| m.delete_if {|key, value| true if key.downcase.include? "feedback" or key.downcase.include? "point" or key == "ID" or key == "Start time" or key == "Completion time" or key == "Email"}}

data['members'].each {|m| m['What sub-teams are you a part of in robotics?'] = m['What sub-teams are you a part of in robotics?'].split(', ').map!{|t| t.capitalize}}
# count = {}
# data['members'].each {|m| count[m["Name"]] == nil ? count[m["Name"]] = 1 : count[m["Name"]] += 1}
# puts count.filter {|_,i| i > 1}
File.open("members2.json", "w").write JSON.generate data
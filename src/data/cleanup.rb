require 'json'

data = JSON.parse File.open('members.json').read

data['members'].each {|m| m.delete_if {|key, value| true if key.downcase.include? "feedback" or key.downcase.include? "point" or key == "ID" or key == "Start time" or key == "Completion time" or key == "Email"}}

data['members'].each {|m| m['What sub-teams are you a part of in robotics?'] = m['What sub-teams are you a part of in robotics?'].split(', ').map!{|t| t.capitalize}}
data['members'].each do |m|
	if m["You can upload a picture of yourself that will be used for your biography page on the robotics page. You do not have to upload a picture at all if you are not comfortable or do not want to. This i..."] != ""
		m["img"] = m["Name"]
	else
		m["img"] = "error/" + rand(0..6).to_s
		puts m["img"]
	end
end

# count = {}
# data['members'].each {|m| count[m["Name"]] == nil ? count[m["Name"]] = 1 : count[m["Name"]] += 1}
# puts count.filter {|_,i| i > 1}
File.open("members2.json", "w").write JSON.generate data
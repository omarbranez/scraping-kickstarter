# require libraries/modules here
require 'nokogiri'
require 'pry'

# html = File.read('fixtures/kickstarter.html')

# kickstarter = Nokogiri::HTLM(html)

# projects: kickstarter.css("li.project.grid_4")
#project.css("h2.bbcard_name strong a").text # look for the text inside a inside strong inside bbcard_name inside h2
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value #returns that thumbnail link, otherwise it would return photo-little, 150, 200, etc. image tags in html have source attributes
# description: project.css("p.bbcard_blurb").text
# location : project.css("ul.project-meta span.location-name").text # location name within span.location-name (in this case span.location-name works too? why?)
# funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i #gsub to get rid of the %, and make it an integer instead of a string
def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    #use a : symbol as a hash key instead of a string, remember to use => rockets for new hash values
    projects[title.to_sym] = {    
    :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
    :description => project.css("p.bbcard_blurb").text,
    :location => project.css("ul.project-meta span.location-name").text,
    :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
    } 
  end
  
  projects

end 

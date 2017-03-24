require 'rexml/document'
require 'date'

file_path_xml = File.dirname(__FILE__) + "/business_card.xml"
abort "Файл #{file_path} не найден" unless File.exist?(file_path_xml)

file = File.new(file_path_xml)
doc = REXML::Document.new(file)
file.close

first_name_text = doc.root.elements["//first_name"].text
second_name_text = doc.root.elements["//second_name"].text
last_name_text = doc.root.elements["//last_name"].text
phone_text = doc.root.elements["//phone"].text
email_text = doc.root.elements["//email"].text
skills_text = doc.root.elements["//skills"].text


file_path_html = File.dirname(__FILE__) + "/business_card.html"

File.new(file_path_html, "w") unless File.exist?(file_path_html)

file = File.new(file_path_html, "r")
html = REXML::Document.new(file)
file.close


html.add_element 'html', {
    'lang' => 'ru'
}
html_in = html.elements.find('html').first

html_in.add_element 'body'
body = html_in.elements.find('body').first

p2 = body.add_element 'p'
p2.add_element 'img', {
    'src' => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBIhn8ekga4TaBuknZRMxWTKf8Dgp4N-0JqN393wDdWXxdyAYr"
}

p2 = body.add_element 'p'
p2.add_text first_name_text

p2 = body.add_element 'p'
p2.add_text phone_text

p2 = body.add_element 'p'
p2.add_text email_text

p2 = body.add_element 'p'
p2.add_text skills_text


file = File.new(file_path_html, "w:UTF-8")
html.write(file, 2)
file.close
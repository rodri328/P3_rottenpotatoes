# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
    #Movie.create("title" => movie[:title], "rating" => movie[:rating], "release_date" => movie[:release_date])
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  regexp = /#{e1}.*#{e2}/m
  page.body.should =~ regexp
end


Then /I should see all of the movies/ do
  filastot = page.body.split("<tr>")
  filas = filastot.length - 2   
  filas.should == 10
end

Given /^the following articles exist:$/ do |articles|
  articles.hashes.each do |article|
    Article.create( :id => article[:id], :title => article[:title], :author => article[:author], :body => article[:body], :published_at => article[:published_at], :state => article[:state], :permalink => article[:title], :published => true, :allow_pings => true, :type => article[:type]  )
  end
end

Given /^the following users exist:/ do |users|
  users.hashes.each do |user|
    User.create( :login => user[:login], :email => user[:email], :name => user[:name] )
  end
end

Then /^I should see content from "(.*?)" and "(.*?)"$/ do |arg1, arg2|
# assert page.has_content?(Article.find_by_title(arg1).body)
  assert page.has_content?(Article.find_by_title(arg2).body)

end

Then /^The author of "(.*?)" should be "(.*?)"$/ do |arg1, arg2|
  post = Article.find_by_title(arg1)

  assert post.author.should == arg2
end

When /^I fill in "(.*?)" with the title of similar article "(.*?)"$/ do |field, title|
  id = Article.find_by_title(title).id
  fill_in(field, :with => id)
end


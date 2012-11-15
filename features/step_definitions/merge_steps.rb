Given /^the following articles exist:$/ do |articles|
  articles.hashes.each do |article|
    Article.create( :title => article[:title], :author => article[:author], :body => article[:body], :published_at => article[:published_at], :state => article[:state] )
  end
end


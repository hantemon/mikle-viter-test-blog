namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_posts
  end
end

def make_posts
  99.times do
  	title = Faker::Lorem.sentence(5)
    content = Faker::Lorem.sentences(10).join(' ')
    Post.create!(user_id: 1, post_title: title, post_content:content)
  end
end
require 'rake'
require 'yaml'

SOURCE = "."
CONFIG = {
  'posts' => File.join(SOURCE, ""),
  'post_ext' => "md",
}

# Usage: rake post title="A Title"
desc "Begin a new post in #{CONFIG['posts']}"
task :post do
  abort("rake aborted: '#{CONFIG['posts']}' directory not found.") unless FileTest.directory?(CONFIG['posts'])
  title = ENV["title"] || "new-post"
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = File.join(CONFIG['posts'], "#{Time.now.strftime('%Y-%m-%d')}-#{slug}.#{CONFIG['post_ext']}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end

  puts "Creating new post: #{filename}"


  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: #{Time.now.strftime('%Y-%m-%d')}-日记"
    # post.puts "subtitle: \"\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d')}"
    # post.puts "cover: "
    post.puts "category: 日记"
    post.puts "tags: 日记"
    post.puts "---"
    post.puts "\# #{Time.now.strftime('%Y-%m-%d')}-日记"
    #post.puts "打对勾option+v "
    post.puts "\#\# BIU BIU BIU"
    post.puts "- "
    post.puts "- "
    post.puts " "
    post.puts "\#\# TODO LIST"
    post.puts "- [x] "
    post.puts "- [ ] "
    post.puts "- [ ] "
    post.puts "- [ ] "
    post.puts " "
    # post.puts "\#\# FINISH LIST"
    # post.puts "+ "
    post.puts " "
    post.puts "\#\# SOUL"
    post.puts "- [ ] "
    post.puts " "
    post.puts "\#\# BODY"
    post.puts "- [ ] "
    post.puts " "
    post.puts "\#\# HA HA HA"
    post.puts "- "
    post.puts " "
    post.puts "\#\# SUMMARY"
    post.puts " "
    post.puts " "
  end

  
end # task :post
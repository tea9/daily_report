require 'rake'
require 'yaml'

SOURCE = "."
CONFIG = {
  'posts' => File.join(SOURCE, ""),
  'schedules' => File.join(SOURCE, "_schedule"),
  'post_ext' => "md",
}

# Usage: rake daily
desc "Begin a new post in #{CONFIG['posts']}"
task :daily do
  abort("rake aborted: '#{CONFIG['posts']}' directory not found.") unless FileTest.directory?(CONFIG['posts'])
  #title = ENV["title"] || "new-post"
  #slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = File.join(CONFIG['posts'], "#{Time.now.strftime('%Y-%m-%d')}-daily.#{CONFIG['post_ext']}")
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
    post.puts "- [ ] "
    post.puts "- [ ] "
    post.puts "- [ ] "
    post.puts "- [ ] "
    post.puts " "
    # post.puts "\#\# FINISH LIST"
    # post.puts "+ "
    post.puts "\#\# RECORD"
    post.puts "- 早餐:  "
    post.puts "- 中餐:  "
    post.puts "- 晚餐:  "
    post.puts " "
    post.puts "- 花销:  "
    post.puts " "
    post.puts "- 起床时间:  "
    post.puts "- 睡觉时间:  "
    post.puts " "
    post.puts "\#\# SOUL"
    post.puts "- "
    post.puts " "
    post.puts "\#\# BODY"
    post.puts "- "
    post.puts " "
    # post.puts "\#\# HA HA HA"
    # post.puts "- "
    # post.puts " "
    post.puts "\#\# SUMMARY"
    post.puts " "
    post.puts " "
  end 
end # task :post

## 第二个命令 rake schedule
desc "Begin a new post in #{CONFIG['schedules']}"
task :schedule do
  abort("rake aborted: '#{CONFIG['schedules']}' directory not found.") unless FileTest.directory?(CONFIG['schedules'])
  #title = ENV["title"] || "new-post"
  #slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = File.join(CONFIG['schedules'], "#{Time.now.strftime('%Y-%m')}-schedule.#{CONFIG['post_ext']}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end

  puts "Creating new post: #{filename}"

  title = "日程"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: #{Time.now.strftime('%Y-%m-%d')}-#{title}"
    # post.puts "subtitle: \"\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d')}"
    # post.puts "cover: "
    post.puts "category: #{title}"
    post.puts "tags: #{title}"
    post.puts "---"
    post.puts " "
    post.puts "\# #{Time.now.strftime('%Y-%m-%d')}"
    post.puts "\# #{title}"
    post.puts " "
    post.puts "\# 月计划"
    post.puts " "
    post.puts "- [ ] --"
    post.puts "- [ ] --"
    post.puts "- [ ] --"
    post.puts " "
    post.puts "---"
    post.puts " "
    post.puts " 1| 2| 3| 4| 5| 6| 7"
    post.puts ":-------:|:---------:|:-------:|:--------:|:------:|:------:|:--------:"
    post.puts "--|--|--|--|--|--|--"
    post.puts "8|9|10|11|12|13|14"
    post.puts "--|--|--|--|--|--|--"
    post.puts "15|16|17|18|19|20|21"
    post.puts "--|--|--|--|--|--|--"
    post.puts "22|23|24|25|26|27|28"
    post.puts "--|--|--|--|--|--|--"
    post.puts "28|29|30|31"
    post.puts "--|--|--|--"
    post.puts " "
    
  end
end
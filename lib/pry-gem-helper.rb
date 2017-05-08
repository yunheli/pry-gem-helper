current_path = Dir.pwd

if File.directory?(current_path)
  Dir["#{current_path}/*"].each do |file|
    if file.end_with?(".gemspec")
      puts "found this is a gemspec project"
      if (load file)
        puts "load this develop gem to LOAD_PATH success"
        require "#{file.split("/").last.gsub(".gemspec", "")}"
      else
        puts "load this develop gem to LOAD_PATH error"
      end
    end
  end
end
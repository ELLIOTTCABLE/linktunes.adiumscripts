task :default => :compile

desc 'Compiles each .applescript to a .scpt'
task :compile do
  Dir[File.dirname(__FILE__) + '/Contents/Resources/*.applescript'].each do |applescript|
    system 'osacompile', "-o", applescript.sub(/\.applescript$/, '.scpt'), applescript
  end
end
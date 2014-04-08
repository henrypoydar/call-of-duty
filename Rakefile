require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'yaml'
require_relative 'lib/call_of_duty/cod4_server'

RSpec::Core::RakeTask.new('spec')

# If you want to make this the default task

task :default => :spec

desc "Query the server specified in server.yml for status"
task :status do

  puts ""
  puts "Press ctrl-c to quit"
  puts ""

  server_info = YAML::load(File.open('server.yml'))
  cod4_server = CallOfDuty::Cod4Server.new(server_info['server']['ip'])

  while true do
    cod4_server.query_server
    puts "#{Time.now} #{cod4_server.servername}: #{cod4_server.mapname}, #{cod4_server.players.count} players"
    sleep 30
  end

end
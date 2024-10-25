# Rubain Shell - Version 3.1.2a
# A Ruby shell environment with AI enhancements and various utilities

require 'fileutils'
require 'date'
require_relative 'task_manager'
require_relative 'rubyword'
require_relative 'ping_utility'

class Rubain
  def initialize
    puts "Welcome to Rubain!"
    prompt
  end

  def prompt
    print "RUBAIN3#(#{Dir.pwd}):> "
    input = gets.chomp
    process_input(input)
  end

  def process_input(input)
    case input
    when /^cd (.+)/
      cd($1)
    when /^ls$/
      ls
    when /^newfile "(.+)"$/
      newfile($1)
    when /^ping (.+)$/
      ping($1)
    when /^exit$/
      exit_program
    else
      evaluate_ruby_code(input)
    end
    prompt
  end

  def cd(path)
    begin
      Dir.chdir(path)
      puts "Changed directory to #{Dir.pwd}"
    rescue Errno::ENOENT
      puts "Error: Directory not found."
    end
  end

  def ls
    entries = Dir.entries(Dir.pwd).reject { |entry| entry.start_with?('.') }
    entries.each { |entry| puts entry }
  end

  def newfile(filename)
    File.new(filename, 'w')
    puts "Created new file: #{filename}"
  end

  def ping(host)
    # Ping functionality or calling an external utility
    puts "Pinging #{host}..."
    # Actual ping logic can be implemented
  end

  def evaluate_ruby_code(code)
    begin
      result = eval(code)
      puts result unless result.nil?
    rescue StandardError => e
      puts "Error evaluating code: #{e.message}"
    end
  end

  def exit_program
    puts "Exiting Rubain."
    exit
  end
end

Rubain.new

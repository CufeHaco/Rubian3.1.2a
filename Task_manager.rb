# Task Manager - Handles task scheduling and management

class TaskManager
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
    puts "Task added: #{task}"
  end

  def list_tasks
    puts "Scheduled Tasks:"
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}: #{task}"
    end
  end

  def execute_tasks
    @tasks.each do |task|
      # Implement task execution logic here
      puts "Executing task: #{task}"
    end
  end
end

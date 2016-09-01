#!/usr/bin/ruby
 
require 'yaml'
 
class TodoItem
 
  @@category = Array.new
  @@queue = Array.new
  @@backlog = Array.new
  @@ready = Array.new
  @@inProgress = Array.new
  @@complete = Array.new
 
  @@category = ["Business Strategy/Projects", "Internal Projects", "Planned projects", "Incidents/break fix"]
  @@queue = ["backlog","ready", "inProgress","complete"]
 
 
 
  def initialize(desc,start, q=0)
    @desc = desc
    @startDate = start
    @endDate = nil
    case q
      when 1; @@ready.push(self)
      when 2; @@inProgress.push(self)
      when 3; @@complete.push(self)
      else
         @@backlog.push(self)
    end
  end
 
  def to_s
    "#{@desc}; #{@startDate} "
  end
  
  def enddate
    @endDate=Time.now
  end
 
  def [](index)
    case index
    when 0; @desc
    when 1; @startDate
    when 2; @endDate
    else
      nil
    end
  end
 
  def self.list(queue)
     @q = queue
     case queue
     when '1', 'backlog';
       puts "Backlog"
       puts "-------"
       for i in 0..@@backlog.length-1
         puts "#{i+1}. #{@@backlog[i][0]}"
       end
     when '2', 'ready';
       puts "Ready"
       puts "-----"
       for i in 0..@@ready.length-1
         puts "#{i+1}. #{@@ready[i][0]}"
       end
     when '3', 'inprogress';
       puts "In Progress"
       puts "-----------"
       for i in 0..@@inProgress.length-1
         puts "#{i+1}. #{@@inProgress[i][0]}"
       end
     when '4', 'complete';
       puts "Complete"
       puts "--------"
       for i in 0..@@complete.length-1
         puts "#{i+1}. #{@@complete[i][0]}"
       end
     else
       nil
     end
 
  end
 
  def self.choose(queue, index)
    case queue
    when 0; @@backlog[index]
    when 1; @@ready[index]
    when 2; @@inProgress[index]
    when 3; @@complete[index]
    else
      nil
    end
  end
 
  def self.pushTodo(queue, index)
    @index = index-1
    case queue
    when 'backlog'; unless @@backlog[@index].nil? then @@ready.push(@@backlog[@index]); @@backlog.delete_at(@index); end;
    when 'ready'; unless @@ready[@index].nil? then @@inProgress.push(@@ready[@index]); @@ready.delete_at(@index); end
    when 'inprogress'; unless @@inProgress[@index].nil? then
        @@inProgress[@index].enddate;
        @@complete.push(@@inProgress[@index]); @@inProgress.delete_at(@index); 
      end
    else
      nil
    end
  end
 
  def self.pullTodo(queue, index)
    @index = index-1
    case queue
    when 'ready'; unless @@ready[@index].nil? then @@backlog.push(@@ready[@index]); @@ready.delete_at(@index); end
    when 'inprogress'; unless @@inProgress[@index].nil? then @@ready.push(@@inProgress[@index]); @@inProgress.delete_at(@index); end
    when 'complete'; unless @@complete[@index].nil? then @@inProgress.push(@@complete[@index]); @@complete.delete_at(@index); end
    else
      nil
    end
  end

  def self.saveit
    File.open('backlog.yml', 'w') {|f| f.write(YAML.dump(@@backlog)) }
    File.open('ready.yml', 'w') {|f| f.write(YAML.dump(@@ready)) }
    File.open('inprogress.yml', 'w') {|f| f.write(YAML.dump(@@inProgress)) }
    File.open('complete.yml', 'w') {|f| f.write(YAML.dump(@@complete)) }
  end
 
  def self.loadit
    if File.exists?('backlog.yml')
      @@backlog = YAML.load(File.read('backlog.yml'))
    end
    if File.exists?('ready.yml')
      @@ready = YAML.load(File.read('ready.yml'))
    end
    if File.exists?('inprogress.yml')
      @@inProgress = YAML.load(File.read('inprogress.yml'))
    end
    if File.exists?('complete.yml')
      @@complete = YAML.load(File.read('complete.yml'))
    end
  end
end
 
 
TodoItem.loadit
 
param = ARGV.shift
 
case param
  when 'list'
    queue = ARGV.shift
    TodoItem.list(queue)
  when 'add'
    item = ARGV.shift
    unless item.nil?
      TodoItem.new(item,Time.now)
      TodoItem.saveit
    end
  when 'ready'
    index = ARGV.shift.to_i
    TodoItem.pushTodo('backlog',index)
    TodoItem.saveit
  when 'progress'
    index = ARGV.shift.to_i
    TodoItem.pushTodo('ready',index)
    TodoItem.saveit
  when 'complete'
    index = ARGV.shift.to_i
    TodoItem.pushTodo('inprogress',index)
    TodoItem.saveit
  when '-ready'
    index = ARGV.shift.to_i
    TodoItem.pullTodo('ready',index)
    TodoItem.saveit
  when '-progress'
    index = ARGV.shift.to_i
    TodoItem.pullTodo('inprogress',index)
    TodoItem.saveit
  when '-complete'
    index = ARGV.shift.to_i
    TodoItem.pullTodo('complete',index)
    TodoItem.saveit
  else
    nil
end

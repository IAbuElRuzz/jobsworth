# encoding: UTF-8
class Trigger::Action
  attr_accessor :id, :name
  def initialize(params={ })
    self.id=params[:id]
    self.name=params[:name]
    @method_name= params[:method_name]
  end

  def self.all
    @@instances ||= [self.new(:id=>1, :name=>"Reassign task to user"),
                     self.new(:id=>2, :name=>"Send email"),
                     self.new(:id=>3, :name=>"Set due date", :method_name=>:set_due_date)]
  end

  def self.find(id)
    self.all.detect{|action| action.id == id }
  end

  def self.find_by_name(name)
    self.all.detect{|action| action.name == name}
  end
end
require 'date'

class Course
  attr_reader :name, :dates, :start, :finish
  def initialize(name, *dates)
    @name = name
    @dates = dates.map {|x| Date.parse(x)}
    @start = []
    @finish = []
    1.times do
      @start << @dates[0]
      @finish << @dates[1]
    end
  end

  def self.creator(data)
    file = File.open(data, 'r')
    data = file.readlines
    file.close
    @object = []
    data.each do |row|
      ls = row.split(', ')
      @object << Course.new(*ls)
    end
    return @object
  end

  def self.start_before(date=Date.today)
    raise 'Error, la fecha es igual o posterior a 2018-01-01' if date >= Date.parse("2018-01-01")
    @object.each do |course|
      course.start.each do |time|
          puts course.name if time < date
      end
    end
  end

  def self.finish_after(date=Date.today)
    raise 'Error, la fecha es igual o posterior a 2018-01-01' if date >= Date.parse("2018-01-01")
    @object.each do |course|
      course.finish.each do |time|
        puts course.name if time > date
      end
    end
  end
end
Course.creator('cursos.txt')
date_input = Date.parse("2017-08-13")
Course.start_before(date_input)
Course.finish_after(date_input)
Course.finish_after()

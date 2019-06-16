class Table
  attr_reader :object, :table, :days
  def initialize(table, *days)
    @table = table
    @days = days.map {|x| x.to_i}
  end

  attr_reader :name,:income

  def initialize(name,*income)
    @name = name
    @income = income.map(&:to_i)
  end

  def self.creator
    file = File.open('casino.txt', 'r')
    data = file.readlines
    file.close

    @object = []
    data.each do |row|
      ls = row.split(', ')
      @object << Table.new(*ls)
    end
  end

  def self.read_file(file = 'casino.txt')
    data = File.open(file,'r').readlines.map(&:chomp)
    tables_objects = []

    data.each do |line|
      table_data = line.split(', ')
      tables_objects << Table.new(*table_data)
    end
    return @object

    return tables_objects
  end

  def self.greatest_revenue
  end

  def best_day

    greatest = []
    g_table = []
    @object.each do |obj|
      greatest << obj.days.max
      g_table << obj.table
    end
    "La #{self.name} tuvo su ingreso maximo el dia #{self.income.index(self.income.max)+1} con un valor de #{self.income.max}"

  end

    greatest_table = g_table.zip(greatest).to_h
  def self.daily_average
    casino = self.read_file
    sum_total = 0
    days_total = 0

    day = 0
    greatest_table.each do |k,v|
      day += 1
      puts "La mayor venta de la #{k} el día #{day} fue #{v}"
    end
    casino.each do |table|
      sum_total =+ table.income.sum
      days_total =+ table.income.length
    end
  end

  def self.total_average
    total = 0
    @object.each do |obj|
      total = obj.days.sum / @object.length.to_f
    end
    return "El promedio diario es #{sum_total/days_total}"

    puts "El promedio del total de venta de todas las mesas es #{total}"
  end

end


Table.read_file('casino.txt').each do |table|
  puts table.best_day
end

Table.creator
Table.greatest_revenue
Table.total_average

puts Table.daily_average

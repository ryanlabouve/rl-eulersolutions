# 
# projecteuler::problem11
#
# What is the greatest product of four adjacent numbers in any direction 
# (up, down, left, right, or diagonally) in the 20x20 grid? [problem11-grid.txt]
#
#

# Issues with Grid... Assumes that there is at least one row... assumes all rows same size.
class Grid
  # imports file into grid
  def initialize(file)
    @grid = []
    
    @current_x = -1
    @current_y = 0

    File.open(file) do |f|
      for line in f.readlines
        @grid << line.split(' ').map { |i| i.to_i }
      end
    end
  end

  def to_s
    # prints out grid
    for row in @grid
      for cell in row
        print "[%02d] " % cell
      end
      puts
    end
  end

  def [](x,y)
    get_cell(x,y)
  end
   
  def get_cells

    while ret = next_cell
      yield ret
      puts "--newcell[#{@current_x},#{@current_y}]----------------"
    end
  end

  # fxn returns array containing #{length} elements
  def slice_down(length)
    a = []
    (@current_y...(@current_y+length)).each { |i| a << get_cell(@current_x, i) }
    
    #if one of the values if nil, or if the a.length < #{length}, return nil
    if a.include? nil or a.length < length
      [0]
    else
      puts "slice down: #{a}, #{a.inject(:*)}"
      a
    end
  end

  def slice_right(length)
    # grabs cell, and the [length] cells right of it
    a = []
    (@current_x...(@current_x+length)).each { |i| a << get_cell(i, @current_y)}

    
    if a.include? nil or a.length < length
      [0]
    else
      puts "slice right #{a}, #{a.inject(:*)}"
      a
    end
  end

  def slice_diag1(length)
    # grabs cell, and the [length] of cells diagnol to it
    a = []

    #note: exclusive range
    #also note: I could have done the other slices more generally with this technique
    (0...length).each { |i| a << get_cell(@current_x + i, @current_y + i)}
    
    if a.include? nil or a.length < length
      [0]
    else
      puts "slice diag1: #{a}, #{a.inject(:*)}"
      a
    end
  end

  def slice_diag2(length)
    # grabs cell, and the [length] of cells diagnol to it
    a = []

    #note: exclusive range
    #also note: I could have done the other slices more generally with this technique
    (0...length).each { |i| a << get_cell(@current_x - i, @current_y + i)}
    
    if a.include? nil or a.length < length
      [0]
    else
      puts "slice diag2: #{a}, #{a.inject(:*)}"
      a
    end
  end
  private
  #returns next cell, relative to current cell
  def next_cell
    if has_adjacent_cell?(@current_x, @current_y)
      @current_x += 1
      get_cell(@current_x-1, @current_y)
    elsif has_adjacent_row?(@current_x, @current_y)
      @current_y +=1
      @current_x = 0
      get_cell(@current_x, @current_y-1)
    elsif get_cell(@current_x, @current_y)
      @current_x += 1
      get_cell(@current_x-1, @current_y)
    else
      nil
    end
  end

      
  def get_cell(x,y)
    if row_size > x and column_size > y
      @grid[y][x]
    else
      nil
    end
  end

  #this may be unneccessary
  def adjacent_cell(x,y)
    if has_adjacent_cell?(x,y)
      [x+1, y]
    else
      nil
    end
  end

  #this may be unnecessary
  def adjacent_row(x,y)
    if has_adjacent_row?(x,y)
      [x, y+1]
    else
      nil
    end
  end

  def diag_cell(x,y)
    # returns next cell, one row down
  end

  def has_adjacent_cell?(x,y)
    # if current row_size > x true, else. false.
    row_size > x ? true : false
  end
  
  def has_adjacent_row?(x,y)
    column_size > y ? true : false
  end

  def has_adjacent_diag?(x,y)
    has_adjacent_row?(x,y) and has_adjacent_cell?(x,y) ? true : false
  end

  def row_size
    @grid[0].length
  end

  def column_size
    @grid.length
  end


end 

class MaxProduct
  def initialize
    @max_product = 0
  end

  def update_max_product(x)
    @max_product = x if x > @max_product
  end

  def get_max_product
    @max_product
  end
end

g = Grid.new('problem11-grid.txt')
m = MaxProduct.new
puts
puts "#{g}"
puts
puts "being slicing..."
puts "-----------------"
puts "-----------------"
puts "-----------------"
puts 
g.get_cells do
  m.update_max_product g.slice_down(4).inject(:*)
  m.update_max_product g.slice_right(4).inject(:*)
  m.update_max_product g.slice_diag1(4).inject(:*)
  m.update_max_product g.slice_diag2(4).inject(:*)
end

puts "Max Product: #{m.get_max_product}"
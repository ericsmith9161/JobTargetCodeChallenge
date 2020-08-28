  # convert text file into numeric 2d array of triangle rows w/ corresponding values

def parse_triangle_file(triangle_file_name)

  triangle_txt_arr = IO.readlines(triangle_file_name)

  triangle_nums_arr = triangle_txt_arr.map do |row|
    row.split.map{|ele| ele.to_i}
  end

end

def max_triangle_sum(triangle_file_name)

  triangle_nums_arr = parse_triangle_file(triangle_file_name)

  # create memo to store max at each triangle index, avoid excess work

  memo = {} # memo keys are "row/element_num"
  memo["0/0"] = triangle_nums_arr[0][0] # seed with first row to avoid checking for nonexistent rows



  # in our memo we store the maximum value that can be reached at each position 
  # in the triangle by adding max values from adjacent spaces in previous row
  # to the value at our current position

  (1...triangle_nums_arr.length).each do |row_idx| #ruby sugar for an exclusive range of all rows
    current_row = triangle_nums_arr[row_idx]

    (0...current_row.length).each do |ele_idx|
      current_ele = current_row[ele_idx]
      top_left = memo["#{row_idx-1}/#{ele_idx-1}"] || 0 # the zero handles cases where our 
      top_right = memo["#{row_idx-1}/#{ele_idx}"] || 0 # element is the first or last in a row
      memo["#{row_idx}/#{ele_idx}"] = [top_left, top_right].max + current_ele
    end
  end

  # after obtaining all values, we simply grab the max memo value from our final row

  last_row_sum_arr = []

  (0...triangle_nums_arr.length).each do |btm_row_ele_idx|
    last_row_sum_arr.push(memo["#{triangle_nums_arr.length-1}/#{btm_row_ele_idx}"])
  end

  last_row_sum_arr.max
end

puts(max_triangle_sum("triangle.txt"))

# result for this triangle is 732506

# time and space complexity for this implementation are both n^2, where n
# represents the number of rows in the triangle

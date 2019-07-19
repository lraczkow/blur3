class Image

  def initialize(image) #called on to create a new image
    @image = image #assigning the local variable 'image' to the instance variable @image so that its accessible in any method within the class
  end

  def output_image #defining what output_image will do when called
    @image.each do |array| #loops through each item in the image array
      puts array.join #returns string converting each element of the array into a string
    end
  end

  def find_ones #defining find_ones 
    ones = [] #return an array with the following information
    @image.each_with_index do |row, row_number| #loop through each item in the array looking for row and row_number of each item
      row.each_with_index do |item, col_number| #loop through each row pulled from the above method and find the item and col_number
        if item == 1 #if the item pulled from above is equivalent to 1
          ones << [row_number, col_number] #add the row_number and col_number to the array
        end
      end
    end
    ones
  end

  def blur(distance) #defining blur
    ones = find_ones #assigning variable name find_ones to ones array

      @image.each_with_index do |row, row_number| #loop through each item in the array looking for row and row_number of each item
        row.each_with_index do |item, col_number| #loop through each row pulled from the above method and find the item and col_number
          ones.each do |found_row_number, found_col_number| #loop through each item in the ones array and find the found_row_number and found_col_numer

            if manhattan_distance(col_number, row_number, found_col_number, found_row_number) <= distance
              @image[row_number][col_number] = 1
            end
          end
        end
      end
    end
  end

  def manhattan_distance (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs #returns the absolute value of coordinates x2-x1
    vertical_distance = (y2 - y1).abs #returns the absolute value of coordinates y2-y1
    horizontal_distance + vertical_distance
  end

  


image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0],
  [0, 0, 0, 0, 0, 0]
])

#original image
image.output_image
puts

#blurred image
image.blur(2)
image.output_image

class Triangle
  # write code here
  attr_reader :side1, :side2, :side3

  class TriangleError < StandardError
  end

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    check_if_triangle
    if self.side1 == self.side2 && self.side2 == self.side3 && self.side1 == self.side3
      :equilateral
    elsif self.side1 == self.side2 || self.side2 == self.side3 || self.side1 == self.side3
      :isosceles
    else
      :scalene
    end
  end

  def check_if_triangle
    raise TriangleError unless side_length_greater_than_zero? && valid_triangle_sides?
  end

  def valid_triangle_sides?
    self.side1 + self.side2 > self.side3 && self.side2 + self.side3 > self.side1 && self.side1 + self.side3 > self.side2
  end

  def side_length_greater_than_zero?
    [self.side1, self.side2, self.side3].all? { |side| side > 0 }
  end
end
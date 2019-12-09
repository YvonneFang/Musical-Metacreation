# Alina and Yvonne
# CSCI 3725
# PQ5
# Nov 9, 2019
# This file represents a musical interpretation of Sierpinski's triangle

# This function draws a Sierpinski's triangle musicality
define :triangle do |points, depth|
  counter = 0
  3.times do
    play points[counter], release: 0.5, amp: 0.5, attack: 2
    counter += 1
    sleep 2
  end
  # Base case is depth = 0
  if depth > 0
    depth -= 1
    # For each triangle, find the mid-points for two of the sides, and recursively draw three new triangles positioned on two of
    #the mid-points and one of the original points
    triangle [points[0], mid(points[0], points[1]), mid(points[0], points[2])], depth-1
    triangle [points[1], mid(points[0], points[1]), mid(points[1], points[2])], depth-1
    triangle [points[2], mid(points[2], points[1]), mid(points[0], points[2])], depth-1
  end
end

# Find the mid-points
define :mid do |p1, p2|
  return (p1[0]+p2[0])/2, (p1[1]+p2[1])/2
end

# Changing the numbers will change the duration of the song and the notes played
triangle([[50, 50], [127, 50], [38.5, 127]], 5)

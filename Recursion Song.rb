# Welcome to Sonic Pi v3.1
define :triangle do |points, depth|
  counter = 0
  3.times do
    play points[counter], release: 0.5, amp: 0.5, attack: 2
    counter += 1
    sleep 2
  end
  if depth > 0
    depth -= 1
    triangle [points[0], mid(points[0], points[1]), mid(points[0], points[2])], depth-1
    triangle [points[1], mid(points[0], points[1]), mid(points[1], points[2])], depth-1
    triangle [points[2], mid(points[2], points[1]), mid(points[0], points[2])], depth-1
  end
end

define :mid do |p1, p2|
  return (p1[0]+p2[0])/2, (p1[1]+p2[1])/2
end

triangle([[50, 50], [127, 50], [38.5, 127]], 5)

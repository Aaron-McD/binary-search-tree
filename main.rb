require_relative "Tree.rb"

tree = Tree.new([1,7,4,23,8,9,4,3,5,7,9,67,6345,324])
# tree = Tree.new([23,24,25,26,27])

tree.pretty_print
puts tree.balanced?
tree.insert(68)
tree.pretty_print

puts tree.balanced?
tree.insert(69)
tree.pretty_print
puts tree.balanced?

tree.rebalance!

tree.pretty_print
puts tree.balanced?
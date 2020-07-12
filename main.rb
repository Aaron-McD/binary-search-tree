require_relative "Tree.rb"

# tree = Tree.new([1,7,4,23,8,9,4,3,5,7,9,67,6345,324])
tree = Tree.new([23,24,25,26,27])

p tree.root

tree.delete(25)

p tree.root
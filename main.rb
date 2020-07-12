require_relative "Tree.rb"

tree = Tree.new([1,7,4,23,8,9,4,3,5,7,9,67,6345,324])

tree.insert(1)
p tree.root
p tree.data
tree.insert(20)
p tree.root
p tree.data
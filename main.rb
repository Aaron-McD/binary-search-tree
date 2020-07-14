require_relative "Tree.rb"

puts "Creating Tree of random numbers..."
sleep(1)
tree = Tree.new(Array.new(15) { rand(1..100) })

puts "Is the tree balanced: #{tree.balanced?}"
sleep(1)

puts "Elements in level order: #{tree.level_order}"
puts "Elements in preorder: #{tree.preorder}"
puts "Elements inorder: #{tree.inorder}"
puts "Elements in postorder: #{tree.postorder}"
sleep(2)

puts "Adding 5 numbers greater than 100"
sleep(1)
5.times do
    tree.insert(rand(100..200))
end

puts "Is the tree still balanced: #{tree.balanced?}"
sleep(1)
puts "Rebalancing..."
sleep(1)
tree.rebalance!
puts "Is the tree balanced now: #{tree.balanced?}"
sleep(1)
puts "Elements in level order: #{tree.level_order}"
puts "Elements in preorder: #{tree.preorder}"
puts "Elements inorder: #{tree.inorder}"
puts "Elements in postorder: #{tree.postorder}"
sleep(2)
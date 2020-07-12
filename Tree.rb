require_relative "Node.rb"

class Tree
    attr_reader :root, :data

    def initialize(array)
        @data = build_data(array)
        @root = build_tree(@data)
    end

    def build_tree(array)
        unless(@data == array)
            arr_data = build_data(array)
        else
            arr_data = array
        end
        # base case, array is size 0, return nil
        if(arr_data.length == 0)
            return nil
        # base case, array is size 1, return the node in that arr
        elsif(arr_data.length == 1)
            return Node.new(arr_data[0])
        else
            # Set middle node
            mid_index = arr_data.length / 2
            mid = Node.new(arr_data[mid_index])
            # Slice off the left side and build that sub tree
            left = arr_data[0..(mid_index - 1)]
            left_child = build_tree(left)
            # Slice off the right side and build that sub tree
            right = arr_data[(mid_index + 1)..-1]
            right_child = build_tree(right)
            mid.append_left_child(left_child)
            mid.append_right_child(right_child)
            return mid
        end
    end

    def insert(value)
        # Find the position the node would belong in by starting at the root node and comparing each node as it moves down the tree
        current_node = @root
        node = Node.new(value)
        repeat_value = false
        while(true)
            if(node == current_node)
                repeat_value = true
                break
            elsif(node > current_node)
                if(current_node.right == nil)
                    current_node.append_right_child(node)
                    break
                else
                    current_node = current_node.right
                end
            else
                if(current_node.left == nil)
                    current_node.append_left_child(node)
                    break
                else
                    current_node = current_node.left
                end
            end
        end
        unless(repeat_value)
            @data.push(value).sort!
        end
    end

    def build_data(array)
        sorted_array = array.sort
        final = []
        sorted_array.each do |char|
            if(final.include?(char))
                next
            else
                final.push(char)
            end
        end
        return final
    end
end
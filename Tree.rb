require_relative "Node.rb"

class Tree
    attr_reader :root

    def initialize(array)
        if(array.length < 1)
            raise KeyError
        end
        @root = build_tree(array)
    end

    def build_tree(array)
        arr_data = build_data(array)
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
        while(true)
            if(node == current_node)
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
    end

    def delete(value)
        # Traverse the tree to find a node with a value equal to the one provided, keeping a variable for the previous node traversed
        prev_node = nil
        current_node = @root
        not_found = false
        side = "none"
        while(true)
            if(current_node.value == value)
                break
            elsif(current_node.value > value)
                if(current_node.left == nil)
                    not_found = true
                    break
                else
                    prev_node = current_node
                    current_node = current_node.left
                    side = "left"
                end
            else
                if(current_node.right == nil)
                    not_found = true
                    break
                else
                    prev_node = current_node
                    current_node = current_node.right
                    side = "right"
                end
            end
        end
        unless(not_found)
            arr = build_array_from(current_node)
            arr.delete(value)
            if(prev_node == nil)
                @root = build_tree(arr)
            elsif(side == "right")
                prev_node.append_right_child(build_tree(arr))
            else
                prev_node.append_left_child(build_tree(arr))
            end
        end
    end

    private

    def build_data(array)
        if(array == nil)
            return []
        end
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

    def build_array_from(node)
        # base case: node == nil, return empty array
        if(node == nil)
            return []
        end
        arr = Array.new(1, node.value)
        left_arr = build_array_from(node.left)
        right_arr = build_array_from(node.right)
        left_arr.each do |val|
            arr.push(val)
        end
        right_arr.each do |val|
            arr.push(val)
        end
        return arr
    end
end
class Node
    include Comparable
    attr_reader :value, :left, :right
    def initialize(value = nil)
        @value = value
        @left = nil
        @right = nil
    end

    def append_left_child(node)
        @left = node
    end

    def append_right_child(node)
        @right = node
    end

    def <=>(other)
        if(other == nil)
            return self.value <=> nil
        else
            return self.value <=> other.value
        end
    end
end
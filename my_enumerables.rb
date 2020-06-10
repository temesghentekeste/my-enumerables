module Enumerable
    def my_each
        if block_given?
            index = 0
            while index < self.size
                
                index += 1
            end
        else
            return enum_for(:my_each)
        end
    end
end
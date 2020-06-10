module Enumerable
    def my_each
        if block_given?
            index = 0
            while index < self.size
                if is_a?(Array)
                    yield(self[index])
                elsif is_a?(Range)
                    yield(self.to_a[index])
                elsif is_a?(Hash)
                    yield([keys[index], self[keys[index]]])
                end
                index += 1
            end
        else
            return enum_for(:my_each)
        end
        self
    end
end
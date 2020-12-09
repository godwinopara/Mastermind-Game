class Code
    attr_reader :pegs
    POSSIBLE_PEGS = {
        "R" => :red,
        "G" => :green,
        "B" => :blue,
        "Y" => :yellow
    }

    def self.valid_pegs?(array)
        array.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase)}
    end

    def self.random(number)
        array = []
        (1..number).each { array << POSSIBLE_PEGS.keys.sample}
        Code.new(array)
    end

    def self.from_string(pegs)
        newpegs = pegs.split("")
        Code.new(newpegs)
    end


    def initialize(array_char)
        if Code.valid_pegs?(array_char)
            @pegs = array_char.collect { |char| char.upcase}
        else
            raise "invalid array of char"
        end
    end

    def [](index)
        @pegs[index]
    end

    def length
        @pegs.length
    end

    def num_exact_matches(guess)
        count = 0
        (0...guess.pegs.length).each do |i|
            if guess.pegs[i] == self.pegs[i]
                count += 1
            end
        end
        count
    end

    def num_near_matches(guess)
        count = 0
        guess.pegs.each_with_index do |char, i|
            if self.pegs.include?(char) && self.pegs[i] != char
                count += 1
            end
        end
        count
    end

    def ==(code_inst)
        exact_match = true 
        if code_inst.pegs.length != self.pegs.length
            exact_match = false
        else
            code_inst.pegs.each_with_index do |char,i|
                if self.pegs[i] != char
                    exact_match = false
                end
            end
        end
        exact_match
    end

end

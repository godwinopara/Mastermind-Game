require_relative "code"

class Mastermind
    

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_inst)
        exact_match = 0
        near_match = 0

        code_inst.pegs.each_with_index do |char, i|
            if @secret_code.pegs.include?(char) && @secret_code.pegs[i] == char
                exact_match += 1
            elsif @secret_code.pegs.include?(char) && @secret_code.pegs[i] != char
                near_match += 1
            end
        end
        p exact_match
        p near_match
    end

    def ask_user_for_guess
        p "Enter a code"
        user_guess = gets.chomp
        user_code = Code.from_string(user_guess)
        self.print_matches(user_code)
        user_code.pegs.all? { |char| @secret_code.pegs.include?(char)}
    end
end

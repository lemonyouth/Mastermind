class Mastermind
  require_relative 'player.rb'

  def initialize(creator, guessor)
    @creator = creator
    @guessor = guessor
  end

  def play_with_computer?
    puts "Play with computer? (y/n)"
    gets.chomp.downcase == 'y'
  end

  def main
    if play_with_computer?
      board = @creator.create_color("auto")
      guess_res = nil
      ori_guess = nil
      count = 0

      while count <= 12
        ori_guess = @guessor.guess_color(guess_res, ori_guess, "input")
        guess_res = @guessor.judge_win(ori_guess, board)

        if guess_res == true

          break
        end

        count += 1
      end
    end
  end


end
creator = Player.new("creator")
guessor = Player.new("guessor")

# Create an instance of Mastermind and call the main method
mastermind = Mastermind.new(creator, guessor)
mastermind.main

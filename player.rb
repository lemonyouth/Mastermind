class Player
  attr_accessor :identity
  def initialize(identity)
    @identity = identity
  end

  def create_color(type)
    color_all = ['red','white','blue','purple','green']
    if type == "auto"
      res = []
      for i in 0..3
        ran_num = rand(5)
        res.push(color_all[ran_num])
      end
      return res
    elsif type == "input"
        res = gets.chomp.split()
        return res
    else
      puts "your color creation has to be either auto or input"
    end
  end

  def guess_color(guess_res, ori_guess, type)
    color_all = ['red','white','blue','purple','green']

    if type == "input"
      puts "please guess, guess result: #{guess_res}, original guess: #{ori_guess}"
      return gets.chomp.split()
    elsif type == "auto"
      res = []
      for i in 0..3
        if guess_res[i] == 2
          res.push(ori_guess[i])
        elsif
          res.push(color_all[rand(5)])
        end
      end
      return res
    end
  end
  def judge_win(guess, real)
    res = []
    for i in 0..3
      if(guess[i] == real[i])
        res.push(2)
        next
      elsif real.any? {|color| color == guess[i]}
        res.push(1)
      else
        res.push(0)
      end
    end

    if res.all? {|color| color == 2}
      puts "You win! all guesses are correct"
      return true
    else
      p res
      puts "2 means correct, 1 means correct color, 0 means wrong color and position"
      return false
    end

  end
end

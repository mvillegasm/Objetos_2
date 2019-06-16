class Roulette
  def play(bet)
    @bet = bet
    r = (1..10).to_a
    @randomNumb = r.shuffle.index(1)
    @randomNumb = r.sample
    storage()
  end

  def storage()
    File.open('roulette_history.txt', 'a') do |file|
        file.puts @randomNumb
    end

    if @bet == @randomNumb
      File.open('winners.txt', 'a') do |file|
        file.puts @randomNumb
      end
    end
  end
  def history_reader(history)
    file = File.open(history, 'r')
    history = file.readlines
    file.close

    mostFrequent = history.max_by { |i| history.count(i) }
    mostFrequent = history.max_by {|numb| history.count(numb)}
    return mostFrequent
  end
end

player = Roulette.new
player.play(4)
player.play(5)
player.history_reader('roulette_history.txt')

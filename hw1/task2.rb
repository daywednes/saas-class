class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
$orders = [["R", "S"], ["S", "P"], ["P", "R"]]
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless game.all?{|arr_item| arr_item[1] == "P" or arr_item[1] == "S" or arr_item[1] == "R"}
  if game[0][1] == game[1][1]
    return game[0]
  else
    if $orders.any?{|order| order[0] == game[0][1] and order[1] == game[1][1]}
      return game[0]
    else
      return game[1]
    end
  end
end
def rps_tournament_winner(game)
  if game[0].kind_of?(String)
    return game
  else
    p1 = rps_tournament_winner(game[0])
    p2 = rps_tournament_winner(game[1])
    return rps_game_winner([p1, p2])
  end
end

puts rps_tournament_winner([[[ ["Armando", "P"], ["Dave", "S"] ],[ ["Richard", "R"],  ["Michael", "S"] ],],[[ ["Allen", "S"], ["Omer", "P"] ],[ ["David E.", "R"], ["Richard X.", "P"] ]]])

def game_hash
  game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
  }
}
end

def num_points_scored(name)
  total_points = 0
    game_hash.each do |homeaway, data|
      data[:players].each do |player_name, stat|
          if name == player_name
            stat.each do |statistic, value|
              if statistic == :points
                total_points = value
              end
            end
          end
        end
      end
  total_points
end

# game_hash home/away players "name" stat value

def shoe_size(name)
  shoesize = 0
    game_hash.each do |homeaway, data|
      data[:players].each do |player_name, stat|
          if name == player_name
            stat.each do |statistic, value|
              if statistic == :shoe
                shoesize = value
              end
            end
          end
        end
      end
  shoesize
end

def team_colors(name)
  color_array = []
  game_hash.each do |homeaway, data|
    if data[:team_name] == name
      color_array = data[:colors]
    end
  end
  color_array
end

def team_names
  ary = []
  game_hash.each do |homeaway, data|
    ary << data[:team_name]
  end
  ary
end

def player_numbers(team)
  ary = []
  game_hash.each do |homeaway, data|
    if data[:team_name] == team
      data[:players].each do |name, stats|
        stats.each do |stat, value|
          if stat == :number
            ary << value
          end
        end
      end
    end
  end
  ary
end

def player_stats(name)
  hsh = {}
  game_hash.each do |homeaway, data|
    data[:players].each do |player, stats|
      if player == name
        hsh = stats
      end
    end
  end
  hsh
end

def big_shoe_rebounds
  shoe_sizes = []
  game_hash.each do |homeaway, data|
    data[:players].each do |name, stats|
      stats.each do |stat, value|
        if stat == :shoe
          shoe_sizes << value
        end
      end
    end
  end
  shoe_sizes.sort!
  biggest_shoe = shoe_sizes.pop
  rebs = 0
  game_hash.each do |homeaway, data|
    data[:players].each do |name, stats|
      stats.each do |stat, value|
        if stat = :shoe && value = biggest_shoe
          rebs = stats[:rebounds]
        end
      end
    end
  end
  rebs
end

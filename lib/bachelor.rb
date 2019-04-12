require 'pry'

def get_first_name_of_season_winner(data, season)
  # returns the first name of the winner of the specified season
  
  data.each do |season_num, contestant_hash|
    if season_num == season
      contestant_hash.each { |contestant| return contestant["name"].split.first if contestant["status"] == "Winner" }
    end
  end
end

def get_contestant_name(data, occupation)
  # returns the name of the contestant with the specified occupation
  lady_with_job = ""
  
  data.each do |season_info|
    season_info[1].each { |contestant| lady_with_job = contestant["name"] if contestant["occupation"] == occupation }
  end
  
  lady_with_job
end

def count_contestants_by_hometown(data, hometown)
  # returns the total number of contestants from the specified hometown
  count = 0
  
  data.each do |season_info|
    season_info[1].each { |contestant| count += 1 if contestant["hometown"] == hometown }
  end
  count  
end

def get_occupation(data, hometown)
  # returns the occupation of the first contestant from the specified hometown
  occupation = ""
  
  data.each do |season_info|
    season_info[1].each do |contestant|
      if contestant["hometown"] == hometown
        occupation = contestant["occupation"]
        break
      end
    end
  end
  occupation
end

def get_average_age_for_season(data, season)
  # calculates the average age of contenstants for the specified season
  ages = []
  age_total = 0
  
  data.each do |season_info|
    season_info[1].each { |contestant| ages << contestant["age"].to_f } if season_info[0] == season
  end
  
  ages.each { |age| age_total += age }
  average_age = age_total / ages.length
  average_age.round
end
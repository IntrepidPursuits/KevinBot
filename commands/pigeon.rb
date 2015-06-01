class Pigeon < BaseCommand
  require 'yaml'

  def perform
    respond(special_of_the_day)
  end

  def special_of_the_day
    "#{main} with #{sides} on #{bread}"
  end

  def username
    "CW Specials Pigeonator"
  end

  def icon_url
    'https://pbs.twimg.com/profile_images/580545921877958656/IAuaTVfi.png'
  end

  private

  def menu
    @menu ||= YAML::load_file(File.join(__dir__, 'pigeon.yml')).symbolize_keys
  end

  def main
    @main ||= menu[:mains].sample
  end

  def sample_sides(number_of_sides = 4)
    @sample_sides ||= menu[:sides].sample(rand(1..number_of_sides))
  end

  def sides
    if (sample_sides.length == 1)
      "#{menu[:side_jectives].sample} #{sample_sides.first}"
    else
      sample_sides.to_sentence
    end
  end

  def bread_jective
    @bread_jective ||= menu[:bread_jectives].sample
  end

  def bread
    @bread ||= if bread_jective.blank?
                 "#{menu[:breads].sample}"
               else
                 "#{bread_jective} #{menu[:breads].sample}"
               end
  end
end

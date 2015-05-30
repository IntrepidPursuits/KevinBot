class Pigeon < BaseCommand
  require 'active_support/all'

  BREAD_JECTIVES = ['', '', '', '', 'a very, very, large', 'a large', 'a very large']

  BREADS = ['brioche', 'baguette', 'sourdough', 'ciabatta', 'biscuit', 'roll', 'Texas toast', 'hot dog roll']

  SIDE_JECTIVES  = ['', 'really awesome', 'something-something'];

  SIDES = ['black cherry bbq sauce', 'sour-cream', 'pickled green strawberries', 'crispy chicken skin', 'arugula', 'mozzarella', 'red pepper jelly', 'rice noodle salad', 'sweet and spicy glaze', 'spicy whipped feta', 'cheese sauce', 'horseradish-cream', 'fresno chills', 'wild ramp', 'dijon', 'smoked gouda', 'fried artichokes', 'roasted brussel sprouts', 'onion spread', 'roasted potatoes', 'rice vermicelli', 'pea greens', 'spinach', 'beet and apple slaw', 'paprika aioli', 'pickled Turkish peppers', 'frisee', 'cucumber relish', 'kimchi', 'spicy ketchup', 'braised collard greens', 'turnip greens', 'ranch', 'curried cauliflower', 'tzatziki yogurt sauce', 'cheddar cheese', 'american cheese', 'asparagus', 'broccoli, celery and goat cheese slaw', 'onions', 'caramelized onions', 'lettuce', 'tomato', 'whole-grain mustard', 'wax beans', 'sweet bbq sauce', 'hot pepper jelly', 'crispy pig skin', 'spring onions', 'bacon baked beans', 'provolone', 'sautéed kale', 'pepper-jack cheese', 'chicken liver mousse', 'some other things', 'manchego', 'romaine lettuce', 'hot peppers', 'shredded lettuce', 'french-onion sauce', 'avocado spread', 'pico de gallo', 'hazelnut-goat-cheese', 'harissa', 'pickles', 'melted american cheese', 'sour cream onion dip', 'dijonnaise', 'kimchi-aioli', 'Hungarian wax beans'];

  MAINS = ['Pulled pork', 'Roast beef', 'Country pâté', 'Thai braised brisket', 'Pork schnitzel', 'Applewood smoked ham', 'Chopped brisket', 'Sloppy joe', 'Buffalo chicken', 'Buffalo pulled chicken', 'Mortadella', 'Mahi-mahi', 'Ham and mozzarella', 'Pancetta', 'Marinated shrimp', 'Chicken sausage', 'Fried chicken', 'Chickpea fritter', 'Tabasco & honey glazed fried chicken', 'Chinese five-spice duck sausage', 'Smoked brisket', 'Face bacon', 'Slow cooked brisket', 'Steak and cheese', 'Lamb and beef sausage', 'Pancetta and pepperoni', 'House-made ham', 'Short-rib and pork-butt', 'Lamb merguez sausage', 'Beef meatloaf '];

  def main
    @main ||= MAINS.sample
  end

  def sample_sides
    @sample_sides ||= SIDES.sample(rand(1..4))
  end

  def sides(number_of_sides = 4)
    if (sample_sides.length == 1)
      return "#{SIDE_JECTIVES.sample} #{sample_sides.first}"
    else
      return sample_sides.to_sentence
    end
  end

  def bread_jective
    @bread_jective ||= BREAD_JECTIVES.sample
  end

  def bread
    @bread ||=  if bread_jective.empty?
                  "#{BREADS.sample}"
                else
                  "#{bread_jective} #{BREADS.sample}"
                end
  end

  def special_of_the_day
    "#{main} with #{sides} on #{bread}"
  end

  def perform
    respond(special_of_the_day)
  end
end

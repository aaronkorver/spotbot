# Description:
#   Returns a random fact about Minneapolis, Saint Paul, or the state of Minnesota
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot gumball
#
# Author:
#   Natasha

facts = [
  "more than 40% of adults in Minneapolis spend time volunteering, making them one of the most philanthropic cities in the nation."
  "Minneapolis has the highest number of golfers per capita in the nation."
  "94% of Minneapolis residents live within 10 minutes of a park."
  "the coldest temperature ever recorded in Minneapolis occurred in January 1988: A cool -41 °F."
  "Minnesota has one recreational boat per every six people, more than any other state.."
  "Minneapolis consistently ranks as one of the nation’s top cities for bicycling"
  "in Minneapolis, Caribou Coffee, a locally-based, national chain, outnumbers Starbucks."
  "singer/songwriter Prince was born in Minneapolis."
  "F. Scott Fitzgerald, an author and Saint Paul native, wrote \"This Side of Paradise\" in his Summit Avenue home."
  "a Minneapolis City Council candidate was indicted by a grand jury for serving Twinkies to groups of elderly voters. After the scandal, a fair campaign act was established, which is now commonly known as the \"Twinkie Law.\""
  "Minneapolis helped bakers everywhere by designing the Bundt pan and creating Bisquick."
  "the honeycrisp apple was invented at the University of Minnesota."
  "Minneapolis’ name comes from the Sioux word mini and the Greek word polis, together meaning \"City of Waters\"."
  "the now Loring Pasta Bar in Dinkytown used to be the building where legendary musician Bob Dylan lived."
  "the first successful open heart surgery was performed on a 5-year-old girl on September 2, 1952, by Dr. Floyd John Lewis and Dr. Clarence Walton Lillehei at the University of Minnesota."
  "the nation’s first armored car was built in Minneapolis."
  "the Minneapolis Public Library was the first library in America to separate its children’s books from other sections."
  "Minneapolis has no sales tax on apparel and accessories."
  "an average of 10,000 cyclists use Minneapolis bike lanes each day."
  "there are over 20 lakes within Minneapolis’ city limits, leading to its well-deserved nickname \"City of Lakes.\""
  "St. Anthony Falls was the only natural waterfall on the entire Mississippi River."
  "the Walker Art Center is one of the 5 most visited modern/contemporary art museums in the US."
  "Charles Schulz, the creator of the Peanuts comic strip, is a Minneapolis native."
  "The Chanhassen Dinner Theatre is the largest dinner theatre in the US."
  "the Mall of America in Bloomington is the size of 78 football fields --- 9.5 million square feet."
  "Minneapolis baseball commentator Halsey Hal was the first to say \"Holy Cow\" during a baseball broadcast."
  "Minneapolis’ famed skyway system connecting 52 blocks (nearly five miles) of downtown makes it possible to live, eat, work and shop without going outside."
  "Minnesota has 90,000 miles of shoreline, more than California, Florida and Hawaii combined."
  "in 1919 a Minneapolis factory turned out the nations first armored cars."
  "there are 201 Mud Lakes, 154 Long Lakes, and 123 Rice Lakes commonly named in Minnesota."
  "Minnesota's waters flow outward in three directions: north to Hudson Bay in Canada, east to the Atlantic Ocean, and south to the Gulf of Mexico."
  "Twin Cities-based Northwest Airlines was the first major airline to ban smoking on international flights."
  "the state of Minnesota was named after the Dakota Indian name for the Minnesota River, \"Minisota\", which means \"sky-tinted water\"."
  "Frank C. Mars of Minneapolis introduced the Milky Way candy bar in 1923, Snickers in 1930 and 3 Musketeers in 1932."
  "the CDC 6600, the first supercomputer in the world, was built by Control Data Corporation (CDC) of Minnesota."
  "the first bus service in the United States was started in 1914 by Eric Wickman in Hibbing, Minnesota by transporting paid passengers (mainly iron ore miners) from Hibbing to Alice, Minnesota at 15 cents a ride. The bus line grew to become Greyhound Lines, Inc."
  "Gates Mansion, the first home to have air conditioning in the United States, was built in Minneapolis in 1913. The unit in the Minneapolis mansion of Charles Gates is approximately 7 feet high, 6 feet wide, 20 feet long."
  "The stapler was invented in Spring Valley, Minnesota by Charles Henderson."
  "Southdale Mall in Edina was the first enclosed climate-controlled mall in America."
  "there are 15,291 lakes in Minnesota that are over 10 acres in size"
  "the first Automatic Pop-up toaster was marketed in Minnesota in 1926."
  "Rollerblades were invented by two Minnesota students in Minneapolis."
  "the University of Minnesota in Minneapolis had the first organized cheerleaders in 1898, although women were not admitted into UM cheerleading until 1923."
  "the world's largest fake pelican stands in downtown Pelican Rapids, MN, at a height of 15.5 feet"
]

module.exports = (robot) ->
  robot.respond /gumbal(l)?/i, (message) ->
    message.send "Chew on this: " + message.random facts

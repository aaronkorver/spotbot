# Description:
#   Subscribe to Cat Facts!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cat fact - returns a random cat fact
#
# Author:
#   AlexWolf


facts = [
  "Cats have been domesticated for half as long as dogs have been."
  "A cat's whiskers are thought to be a kind of radar, which helps a cat gauge the space it intends to walk through."
  "Domestic cats purr both when inhaling and when exhaling."
  "The first official cat show in the UK was organised at Crystal Palace in 1871."
  "In just 7 years, one un-spayed female cat and one un-neutered male cat and their offspring can result in 420,000 kittens."
  "Cats can judge within 3 inches the precise location of a sound being made 1 yard away."
  "Baking chocolate is the most dangerous chocolate to your cat."
  "A cat has approximately 60 to 80 million olfactory cells (a human has between 5 and 20 million)."
  "It may take as long as 2 weeks for a kitten to be able to hear well. Their eyes usually open between 7 and 10 days, but sometimes it happens in as little as 2 days."
  "Cats that live together sometimes rub each others heads to show that they have no intention of fighting. Young cats do this more often, especially when they are excited."
  "The leopard is the most widespread of all big cats."
  "A tomcat (male cat) can begin mating when he is between 7 and 10 months old."
  "Cats have 30 vertebrae (humans have 33 vertebrae during early development, 26 after the sacral and coccygeal regions fuse)"
  "A steady diet of dog food may cause blindness in your cat - it lacks taurine."
  "Cats have been domesticated for half as long as dogs have been."
  "The first cat show was in 1871 at the Crystal Palace in London."
  "If your cat snores, or rolls over on his back to expose his belly, it means he trusts you."
  "A steady diet of dog food may cause blindness in your cat - it lacks taurine."
  "A cat can jump 5 times as high as it is tall."
  "It has been scientifically proven that stroking a cat can lower one's blood pressure."
  "Julius Ceasar, Henri II, Charles XI, and Napoleon were all afraid of cats."
  "Cats' hearing stops at 65 khz (kilohertz); humans' hearing stops at 20 khz."
  "The way you treat kittens in the early stages of it's life will render it's personality traits later in life."
  "Tabby cats are thought to get their name from Attab, a district in Baghdad, now the capital of Iraq."
  "The life expectancy of cats has nearly doubled since 1930 - from 8 to 16 years."
  "The average lifespan of an outdoor-only (feral and non-feral) is about 3 years; an indoor-only cat can live 16 years and longer. Some cats have been documented to have a longevity of 34 years."
  "Cats can be prone to fleas in the summertime: 794 fleas were counted on one cat by a Cats Protection volunteer in the summer of 1 992."
  "A cat has a total of 24 whiskers, 4 rows of whiskers on each side. The upper two rows can move independently of the bottom two rows."
  "A tiger's stripes are like fingerprints, no two animals have the same pattern."
  "A cat's brain is more similar to a man's brain than that of a dog."
  "In ancient Egypt, when a family cat died, all family members would shave their eyebrows as a sign of mourning."
  "The cat appears to be the only domestic companion animal not mentioned in the Bible."
  "As child Nikola Tesla was inspired to understand the secrets of electricity after being shocked by static electricity from his beloved cat, Macak."
  "The largest breed of cat is the Ragdoll with males weighing in at 1 5 to 20 lbs. The heaviest domestic cat on record was a neutered male tabby named Himmy from Queensland, Australia who weighed 46 lbs. 1 5 oz."
  "Cats can't taste sweets."
  "A cat has more bones than a human; humans have 206, but the cat has 230 (some cites list 245 bones, and state that bones may fuse together as the cat ages)."
  "Cats and kittens should be acquired in pairs whenever possible as cat families interact best in pairs."
  "Has your cat ever brought its prey to your door? Cats do that because they regard their owners as their kittens. The cats are teaching their kittens how to hunt by bringing them food. Most people aren't too delighted when a pet brings in their kill. Instead of punishing your cat, praise it for its efforts, accept the prey, and then secretly throw it away."
  "The more cats are spoken to, the more they will speak back. You will learn a lot from your cat's wide vocabulary of chirps and meows."
  "A cat sees about 6 times better than a human at night, and needs 16 the amount of of light that a human does - it has a layer of extra reflecting cells which absorb light."
  "Cats lived with soldiers in trenches, where they killed mice during World War I."
  "Milk can give some cats diarrhea."
  "If a cat is frightened, put your hand over its eyes and forehead, or let him bury his head in your armpit to help calm him."
  "When your cats rubs up against you, she is actually marking you as hers with her scent. If your cat pushes his face against your head, it is a sign of acceptance and affection."
  "Cats have the largest eyes of any mammal."
  "After humans, mountain lions have the largest range of any mammal in the Western Hemisphere."
  "The female cat reaches sexual maturity at around 6 to 10 months and the male cat between 9 and 12 months."
  "The ancestor of all domestic cats is the African Wild Cat which still exists today."
  "Cats are subject to gum disease and to dental caries. They should have their teeth cleaned by the vet or the cat dentist once a year."
  "Cats respond better to women than to men, probably due to the fact that women's voices have a higher pitch."
  "The Amur leopard is one of the most endangered animals in the world."
  "Cats respond most readily to names that end in an ee sound."
  "A cat can spend five or more hours a day grooming himself."
  "The cat's clavicle, or collarbone, does not connect with other bones but is buried in the muscles of the shoulder region. This lack of a functioning collarbone allows them to fit through any opening the size of their head."
  "The Pilgrims were the first to introduce cats to North America."
  "Cats take between 20-40 breaths per minute."
  "Fossil records from two million years ago show evidence of jaguars."
  "The Maine Coon is 4 to 5 times larger than the Singapura, the smallest breed of cat."
  "Purring does not always indicate that a cat is happy. Cats will also purr loudly when they are distressed or in pain."
  "Spaying a female before her first or second heat will greatly reduce the threat of mammary cancer and uterine disease. A cat does not need to have at least 1 litter to be healthy, nor will they miss motherhood. A tabby named Dusty gave birth to 420 documented kittens in her lifetime, while Kitty gave birth to 2 kittens at the age of 30, having given birth to a documented 218 kittens in her lifetime."
  "Phoenician cargo ships are thought to have brought the first domesticated cats to Europe in about 900 BC."
  "On average, a cat will sleep for 16 hours a day."
  "While many cats enjoy milk, it will give some cats diarrhea."
  "A tortoiseshell is black with red or orange markings and a calico is white with patches of red, orange and black."
  "A cat's brain is more similar to a man's brain than that of a dog."
  "Mountain lions are strong jumpers, thanks to muscular hind legs that are longer than their front legs."
  "Cats respond most readily to names that end in an ee sound."
  "Both humans and cats have identical regions in the brain responsible for emotion."
  "Cats eat grass to aid their digestion and to help them get rid of any fur in their stomachs."
  "Cat bites are more likely to become infected than dog bites."
  "The ancient Egyptians were the first civilisation to realise the cat's potential as a vermin hunter and tamed cats to protect the corn supplies on which their lives depended."
  "The cat's tail is used to maintain balance."
  "The Ancient Egyptian word for cat was mau, which means to see."
  "Edward Lear, author of The Owl and the Pussycat, is said to have had his new house in San Remo built to exactly the same specification as his previous residence, so that his much-loved tabby, Foss, would immediately feel at home."
  "A female cat will be pregnant for approximately 9 weeks - between 62 and 65 days from conception to delivery."
  "A cat's hearing is much more sensitive than humans and dogs."
  "Cats' hearing is much more sensitive than humans and dogs."
  "Cats have 32 muscles that control the outer ear (compared to human's 6 muscles each). A cat can rotate its ears independently 180 degrees, and can turn in the direction of sound 10 times faster than those of the best watchdog."
  "Cats sleep 16 to 18 hours per day. When cats are asleep, they are still alert to incoming stimuli. If you poke the tail of a sleeping cat, it will respond accordingly."
  "A cat will tremble or shiver when it is in extreme pain."
  "Not every cat gets high from catnip. Whether or not a cat responds to it depends upon a recessive gene: no gene, no joy."
  "Ever wondered why kittens can all be different colours and look so different from their mums? The fact is that one in four pregnant cats carries kittens fathered by more than one mate. A fertile female may mate with several tom-cats, which fertilise different eggs each time."
  "Most cats adore sardines."
  "Cats purr at the same frequency as an idling diesel engine, about 26 cycles per second."
  "Cats can get tapeworms from eating mice. If your cat catches a mouse it is best to take the prize away from it."
  "Neutering a male cat will, in almost all cases, stop him from spraying (territorial marking), fighting with other males (at least over females), as well as lengthen his life and improve its quality."
  "Recent studies have shown that cats can see blue and green. There is disagreement as to whether they can see red."
  "A cat's normal temperature varies around 101 degrees Fahrenheit."
  "Cats, especially older cats, do get cancer. Many times this disease can be treated successfully."
  "A cat's field of vision is about 200 degrees."
  "If your cat snores or rolls over on his back to expose his belly, it means he trusts you."
  "On February 28, 1 980 a female cat climbed 70 feet up the sheer pebble-dash outside wall of a block of flats in Bradford, Yorkshire and took refuge in the roof space. She had been frightened by a dog."
  "Cats with long, lean bodies are more likely to be outgoing, and more protective and vocal than those with a stocky build."
  "Jaguars are the only big cats that don't roar."
  "Six-toed kittens are so common in Boston and surrounding areas of Massachusetts that experts consider it an established mutation."
  "A female Amur leopard gives birth to one to four cubs in each litter."
  "It is estimated that cats can make over 60 different sounds."
  "Never give your cat aspirin unless specifically prescribed by your veterinarian; it can be fatal. Never ever give Tylenol to a cat. And be sure to keep anti-freeze away from all animals - it's sweet and enticing, but deadly poison."
  "The mountain lion and the cheetah share an ancestor."
  "An adult cat has 30 teeth, 16 on the top and 14 on the bottom."
]

module.exports = (robot) ->
  robot.respond /cat ?fact/i, (message) ->
    message.send message.random facts

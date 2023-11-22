math.randomseed( os.time() )

function choose(tab)
  return tab[math.random(#tab)]
end

function up(str)
  return (str.upper(str.sub(str, 1, 1))..str.sub(str, 2, -1)) 
end

function import(filename,tablename)
  local tablename = {}

   local file = io.open("assets/"..filename, "r");
   for line in file:lines() do
     table.insert (tablename, line);
   end
  return tablename
end

local descriptions = import("descriptions.txt",descriptions)
local interjections = import("interjections.txt",interjections)
local words = import("shakespeare_words.txt",words)
local technology = import("tech.txt",technology)
local object = import("objects.txt",object)
local universal = import("universals.txt",universal)
local industry = import("industries.txt",industry)
local honorific = import("honorifics.txt",honorific)
local name = import("names.txt",name)
local ergative = import("ergatives.txt",ergative)
local publication = {"small volume","book","pamphlet","zine","treatise","essay","publication","printed material","flyer","poster","memoir","novella","story","thesis","zine","paper","polemic","blog post","story","short essay","detailed report","write-up","article","collection of essays","anthology"}
local group = {"society","we","the people","our poor","the forgotten","the rest of us","the 99%","the abused","the invisible people","the homeless","the dispossesed","the rest of us","the world","the cities","the youth","the masses"}
local verb = import("verbs.txt",verb)
local action = import("actions.txt",action)
local preposition = import("prepositions.txt",preposition)
local adjs = import("adjs.txt",adjs)
local mood = import("moods.txt",mood)
local snippet = {"Excerpt","From the introduction","Forward","Thesis","Main argument","Concept","Main idea","Proposal","Abstract","Typical sentence","Objective","From the forward"}

function choose(tab)
  return tab[math.random(#tab)]
end

function title()
  print(up(choose(words)).." "..choose(technology))
  print()
end

function cover()
  illustration = choose(object)
  if math.random()<0.5 then
    illustration = illustration..", made out of "..choose(object).."s"
  end

  print("Cover illustration: a "..illustration..".")
  print()
end

function summary()
  print("A "..choose(publication).." about "..choose(universal).." perpetuated by the "..choose(industry).." industry. Written by "..choose(honorific).." "..choose(name)..".")
  print()
end 

function quote()
  --print(choose(snippet)..":")

  --local intro=choose(snippet)..": \""
  local intro = ""

  if math.random()<0.5 then
    intro = intro ..up(choose(ergative)).." the "..choose(universal)..". "
  end

  if math.random()<0.5 then
    intro = intro ..up(choose(group)).." must "..choose(verb).." our "..choose(universal).."."
  end

  if math.random()<0.5 then
    intro = intro .." To be "..choose(action).." "..choose(preposition).." "..choose(technology).." is to become "..choose(adjs).." for "..choose(industry).."."
  end

  if intro ~= "" then

    intro = choose(snippet)..": \""..intro .. "\""
    print(intro)
    print()
  end
end

function ending()
  print("How it ends: "..choose(mood)..".")
end

function writeReview()
  title()
  summary()
  print(up(choose(interjections))..". A "..choose(mood).." work by the author.")
  if math.random()<0.3 then
    print("Recommended.")
  elseif math.random()<0.5 then
    print("Not recommended.")
  else
    print(math.random(5).." out of 5.")
  end
end

function makeBook()
  if math.random()<0.5 then
    title()
  end

  if math.random()<0.8 then
    cover()
  end

  if math.random()<0.6 then
    summary()
  end

  if math.random()<0.6 then
    quote()
  end

  if math.random()<0.2 then
    ending()
  end
end

function compile()
  if math.random()<0.5 then
    makeBook()
  else
    writeReview()
  end
  print("----------------------------")
end

for i=1,5 do
  compile()
end

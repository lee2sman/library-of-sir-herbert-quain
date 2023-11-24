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

local description = import("descriptions.txt",description)
local pretitle = {"A history of","A Short History of","My work in","The end of","The death of","Dispatches on","A call for","Ten theses on","Women against","Revolutionary action on","Free","I am","Revolt for","Against","Occupy","On","Anti-"}
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

function introduction()
  print("# The Library of Sir Herbert Quain")
  print()
  print("Programmed, compiled and edited by Lee Tusman.")
  print()
  print("*A list of books, pamphlets, zines and assorted publications consisting of rants, screeds, denouncements, manifestos, disagreements, rejoinders and more.*")
  print()
  image()
  print()
  print("> *It is a laborious madness and an impoverishing one, the madness of composing vast books - setting out in five hundred pages an idea that can be perfectly related orally in five minutes. The better way to go about it is to pretend that those books already exist, and offer a summary, a commentary on them. --Jorge Luis Borges*")
  print()
end

function image()
  print("![](assets/books/"..math.random(0,31)..".jpg)  ")
  print()
end

function title()
  local t = up(choose(words))
  if math.random()<0.2 then
    t = up(choose(pretitle)).." " .. t
  end
  if math.random()<0.85 then
    t = t .. " " ..choose(technology)
  end
  print('# ' .. t)
  print()
end

function year()
  if math.random()<0.5 then
    print(math.random(1987,2023))
  else
    print(math.random(1880,2023))
  end
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
    print("> "..intro)
    print()
  end
end

function ending()
  print("How it ends: "..choose(mood)..".")
end

function more()
  print(up(choose(description)).." and "..choose(description))
end

function writeReview()
  title()
  image()
  summary()

  local opinion = up(choose(interjections))..". A "..choose(mood).." work by the author."

  if math.random()<0.4 then
    opinion = opinion .. " " .. up(choose(description)).. "."
  end

  print("*"..opinion.."*")

end

function makeBook()
  if math.random()<0.9 then
    title()
  end

  image()

  if math.random()<0.8 then
    year()
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

  if math.random()<0.2 then
    more()
  end
end

function compile()
  if math.random()<0.5 then
    makeBook()
  else
    writeReview()
  end
  print()
end

introduction()
for i=1,1750 do
  compile()
end

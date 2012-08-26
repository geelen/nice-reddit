# encoding: UTF-8

Bundler.require
require 'sinatra/reloader'
require 'net/http'

set :views, 'source'

get '/' do
  haml :index
end

get '/style.css' do
  content_type 'text/css'
  Sass.compile(File.read(File.dirname(__FILE__) + "/source/style.sass"), syntax: :sass)
end

get '/app.js' do
  coffee :app
end

#question,comments = JSON.parse(Net::HTTP.get(URI.parse("http://www.reddit.com/r/explainlikeimfive/comments/pcxo7/im_a_creationist_because_i_dont_understand.json?wat")))

get '/reddit.json' do
  #{title: question.data.children[0].data.title,
  # topcomment: comments.data.children[0].data.body}.to_json
  {
    title: "I'm a creationist because I don't understand evolution, please explain it like I'm 5 :)",
    topcomment: "The theory of evolution is the scientific theory that explains why there is so much variety and complexity in the natural world. Be warned that it doesn't explain what initially started life in the first place - all it explains is the variety of life we have. Also: it is not in any sense a moral philosophy. It is our understanding of our observations of the natural world. Evolution does not equal eugenics or anything like that. It's just a statement of the facts we see in the world. What we choose to do in light of understanding these facts does not come into it — in fact, understanding evolution can improve human wellbeing, as we can understand diseases much better.

    Another thing: the word ‘theory’. In normal everyday language, we usually use theory to mean ‘guess’ or ‘hypothesis’. In scientific terms, the theory is an explanation of the observable facts. A body of knowledge, if you will. For instance, ‘music theory’ is the body of knowledge surrounding musical composition. ‘Germ theory’ is the body of knowledge that explains illness and disease. ‘Cell theory’ is the theory that explains that all life is made of cells. ‘The theory of gravity’ is the study of gravity, and the explanations for the facts (or even laws) of gravity that we see in nature. The theory of evolution is no different. Evolution is a scientific, observable, fact, just like cells, germs, and gravity. The ‘theory of evolution’ is the study and explanation of these facts. If you've ever heard a creationist say ‘evolution is still only a theory’ or ‘evolution is not yet a law’ or ‘they're still trying to prove the theory of evolution’, then they are simply wrong, and misunderstanding the scientific meaning of the word theory. Theories don't become laws — theories *contain* laws. A law is just a simple mathematical observation that always seems to be true e.g. in electronics, ohm's law is that electrical current is equal to the voltage divided by resistance. Ohm's law is a part of the ‘theory of electronics’ if you like, although that term isn't really used.

    Ok, let's take 3 basic principles and then extend them.

    1. The children of parents are different to their parents. A puppy is not identical to its parents, just like you are not identical to your parents, but offspring does share qualities of both parents.

    2. Some changes are actually due to ‘mistakes’ made when reproducing. Sometimes the genes of a parent are slightly distorted when they make a baby. Most of these mistakes have no noticeable effect on the offspring. However...

    3. Some differences/mistakes can aid survival, some can cause premature death. For instance, an animal might be born with a genetic disease. This would be a ‘bad’ mutation. Alternatively, an animal might be born with slightly thicker fur. If this animal lived in a cold place, this would be a ‘good’ mutation. Organisms with better chance of survival have a better chance of passing their genes on to the next generation — including the new and improved ‘mistake’ genes. This is the most important principle. Once you fully internalise this, you will understand evolution.

    Now take these principles, and let them do their thing for *millions* of years. Eventually, these tiny mistakes and changes will build up. If we start with a very simple organism, a series of very gradual changes could turn it into a more complex organism.

    Now, is evolution ‘chance’? No! But is it therefore designed with an end goal? Also no! So what is the guiding force behind evolution? Well, it's called *natural selection*. This also explains the variety of organisms in the world. The world is full of different kinds of place. Let's take 3 places in the world as examples. Arctic, desert and forest. And now let's take an organism - the fox. Foxes live in all 3 of these places, but they're very different. Let's imagine a creature called (for now) proto-fox who lived hundreds of thousands of years ago. And now imagine that proto-foxes have spread out all over the world. Proto-foxes with thicker fur and more fat will survive better in the arctic, so out of a given litter of proto-foxes, the fat furry ones are more likely to live to have babies and and the skinny bald ones are more likely to die. These changes *are* essentially random, but whether they live or die is *not* random. After many generations, there will be no skinny bald ones left - just furry ones.

    Now let's look at the desert. Proto-foxes in the desert are better off skinny and with big ears to help them lose heat and keep cool. So out of a given litter, babies with bigger ears and skinny bodies are more likely to live and have more babies than fat ones with small ears. After many generations, there will be no fat small-eared proto-foxes left in the desert. Finally, the proto-foxes living in the forest will do better if they can eat lots of different things - there is such a variety of food in the forest, having a strong stomach able to handle all kinds of meat, fish and plant is a huge bonus. Baby proto-foxes living in the forest with strong stomachs are more likely to live and have more babies, while a baby with a weak stomach will more likely die and have no babies. Eventually, all the foxes in the forest will have strong stomachs.

    Now these 3 animals are too different to be called a proto-fox. We just have arctic, desert and red foxes! By just putting these animals in a different habitat and letting them either live to have babies or die childless based on the random changes they inherited from their parents, we get 3 distinct strands of what was once the same animal. This works with plants, bacteria, animals and fungi - all living things inherit from their parents, and all can potentially make good or bad mistakes. Whether these mistakes are passed on to their young is decided by the place in which they live and other factors. Now remember, the offspring of these 3 kinds of fox may find themselves in new environment, which will cause the offspring to diverge still into more and more varieties. From this, we can start with a single cell billions of years ago, with variety in its offspring, who had variety in their offspring, who had variety in their offspring, who had variety in their offspring. This makes evolution a beautiful family tree. It means we can look at our cousin the chimpanzee and look for a common ancestor we both share. But it also means we can look at an oak tree, and discover that a much longer time ago, we share a common ancestor with this oak tree. A starfish is nothing like a human, but at some point in history, our ancestors were begat by a single species. All life on Earth is related distantly, because we all evolved from the first life.

    The evidence for evolution: how do we know it is true? There is an **overwhelming** body of evidence for evolution. To roughly go over a few...

    * The fossil record is one handy piece of evidence. Rocks lower down in the earth are ‘older’ (as more rock piles up over then, they get buried). In these older rocks, deeper in the earth, we find *much* simpler fossilised organisms, and can observe a change to more complex organisms in the higher up rocks. We know the rocks are older because we have many dating methods, which we can cross-reference when examining a rock. They give the same answer each time, which is strong evidence that the dating methods are accurate.
    * Another way we know is by looking at DNA, the stuff that makes us us. Here's a triumphant example. Humans have 23 pairs of chromosomes, but our closest relatives, the great apes - chimpanzees, gorillas and orang-utans - all have 24 pairs of chromosomes. This seems to suggest that the ancestor we all share had 24 pairs of chromosomes too (the great apes are not our ancestors - they are our cousins, like our 3 foxes above were cousins). Where did this chromosome go in humans? This would seem to put the theory of evolution in jeopardy, but no! We have mapped and understood all the chromosomes in both chimpanzees and humans and compared them and... what's this?? One of the pairs of chromosomes in humans is exactly the same as 2 of the chimp chromosomes but fused together! We can perfectly see the exact difference and mechanism by which human chromosomes became different from the other great apes - 2 of them joined together into a single chromosome.
    * The life on Earth is evidence of evolution itself. We can see the different stages of evolution in different organisms. Take, for instance, the amazingly complex and clever eye. Our eyes are very well developed compared with most animals (save some birds of prey etc). How could such a complex thing have evolved? Well, we have a pretty good idea how, and we can actually see every stage of eye evolution in other organisms. An eye at its most basic is a light sensitive cell. We can find those in nature. Next is a patch of cells in such a shape that can detect direction of light. We can find those too. Next is a hole of cells creating a simple pin-hole. We see those in nature. And then we find the next step up, creatures with a lens. Then animals with a further step, muscles to focus the lens. Each ‘stage’ of the eye can be found in other animals. We can use this to trace the development of our own eyes.
    * The last evidence for evolution I will mention here is observation. Evolution is an ongoing process - everything is still evolving and we can see it evolving. The easiest example is the bacteria and viruses that make us ill. These organisms live, die and reproduce so quickly that they evolve extremely quickly, too. Why do we need to have a new flu vaccination every year? Because the influenza virus evolves. Why do we need to finish a course of anti-biotics if they are prescribed? Because if we only use half of the anti-biotics, we only kill the weakest half of the bacteria making us ill. The strongest half lives on and reproduces even more (because they won't have competition from their weaker brethren). We'd be *helping* the bacteria to evolve. [This experiment](http://en.wikipedia.org/wiki/E._coli_long-term_evolution_experiment) is an example of a way that we have actually observed evolution, including a new irreducibly complex adaptation — the ability to digest citric acid.

    The mechanism for evolution - natural selection - is simple, logical and effective. The evidence is overwhelming (there is a **lot** more than what I mentioned above). In fact, there is more evidence for evolution than any other theory in science. Just remember: natural selection, natural selection, natural selection. Random good changes will help an organism have more babies thanks to their environment. Random bad changes will cause an organism to have fewer babies thanks to their environment. Nature naturally selects the best changes! From here it is a numbers game. Things die and things live. The genes of those who live long enough to reproduce are passed on.

    There are other mechanisms than natural selection that guide evolution, but they have a much smaller impact.

    Now, if you've been raised under creationism, you may have been taught some misleading things. If you have any objections or questions, please ask. I'd be happy to try to answer your questions - I was once a creationist myself and realised that a lot of what the people at my Church told me about evolution was not true.

    tl;dr Random changes are naturally selected by non-random factors such as climate. Over millions of years, this produces big changes and a wide variety of species.

    Edits and errata: clarity, spelling and missing words. eslice corrected me on the consistency of the fossil record. RaindropBebop pointed out to me that ‘I'd also add one thing for the OP: natural selection does not select for good traits. It selects against bad ones. Traits which do not result in the extinction of a genetic line may not be good traits; but merely good enough.’ but simply distinguishing between good and bad is more LI5. mattc286 and CubicKinase point out that some other mechanisms that act on evolution are: Non-random mating, genetic drift, genetic migration, biased mutation, gene flow, sexual/artificial selection, and linkage. mattc286 also warns against equivocating evolution with natural selection. are Also [here's me next to Darwin](http://i.imgur.com/yTVmf.jpg)",

  }.to_json
end

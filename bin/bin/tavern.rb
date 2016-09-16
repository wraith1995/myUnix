nouns = [:admiral, :captain, :master, :wench, :wastrel, :whore, :mistress, :tailor, :lord, :king, :queen, :prince, :duke, :soldier, :nobleman, :gentlemen, :lady, :vampire, :slave, :priest, :nun, :abott, :judge, :begger, :friar, :artist, :hound, :citizen, :tyrant, :scholar, :vizier, :vagabond, :bard, :virgin, :hero, :traitor, :minstrel, :philosopher, :dragon, :goblin, :centaur]
adjectives = [:noble, :gentle, :kind, :bloody, :naked, :flogged, :befuddled, :mad, :lucky, :unlucky, :virgin, :drunk, :sober, :exsanguinated, :repentant, :funky, :good, :dirty, :pious, :devout, :outcast, :enraptured, :honorable, :insane, :profligate, :wise, :foolish, :scheming, :dead, :grim, :mighty, :philosophic, :heretic, :unrepentent]
print "#{nouns.length} #{adjectives.length} #{nouns.length*adjectives.length}"
while(gets.chomp =~ /^$/)
	puts "the #{adjectives[rand adjectives.length]} #{nouns[rand nouns.length]}"
    puts "the #{adjectives[rand adjectives.length]} #{nouns[rand nouns.length]}'s #{nouns[rand nouns.length]}"
end
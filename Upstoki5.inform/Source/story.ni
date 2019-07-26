"The City of Upstoki" by Geraldo Xexéo

The story genre is "Adventure". 
The release number is 6. 
The story headline is "When danger is coming". 
The story description is "You faintly remember that you were in danger, and you must do something. But what? Who are you? Your guts tell you that is better to solve this problem really fast."

Use scoring.
The maximum score is 100.

Include Basic Screen Effects by Emily Short. 

Book 1 Preparation

Instead of asking someone about something:
	if something is a room:
		say "it is easy";
	otherwise:
		continue the action.

Section 1 Money System  The Yobe

Price is a kind of value. 
$10 specifies a price with parts coins. 
A thing has a price. 
The price of a thing is usually $0.

Definition: a thing is worthless if the price of it is $0. 
Definition: a thing is valuable if it is not worthless.

Ownership relates one person (called the owner) to various things. 
The verb to own (he owns, they own, he owned, he is owned) implies the ownership relation. 

Definition: a thing is owned if the player owns it. 

Instead of buying something which is owned by the player: 
    say "You already own [the noun]." 

Table of Stolen Things
itemSF	tentativesSF
a thing	a number
with 10 blank rows

Instead of going somewhere when the player encloses something (called the stolen goods) which is not owned by the player: 
	say "You try to leave with [stolen goods] [paragraph break]";
	if there is an itemSF of stolen goods in the Table of Stolen Things:
		choose row with itemSF of stolen goods in the Table of Stolen Things;
		let x be tentativesSF entry + 1;
		now the tentativesSF corresponding to an itemSF of stolen goods in the Table of Stolen Things is  x;
	otherwise:
		say "you sneaky bastard [paragraph break]";
		choose a blank row in Table of Stolen Things;
		now  itemSF entry is stolen goods;
		now  tentativesSF entry is 1;
	if the owner of the stolen goods is not a person: 
		now the player owns the stolen goods; 
		continue the action; 
	if the owner of the stolen goods can see the player :
		say "'Hey there buddy, not so fast,' says [the owner of the stolen goods]. 'You going to buy [the stolen goods] first, or am I gonna call the cops?'"; 
		choose row with itemSF of stolen goods in the Table of Stolen Things;
		let y be tentativesSF entry;
		if y is 3 :
			say "You bastard! Guards! Guards!"; 
			wait for any key;
			say "[paragraph break] The guards arrive, they are many, and they are strong... You try to escape, but fail... You are beaten and arrested. They don't like thieves in the town... ";
			wait for any key; 
			say "[paragraph break] It seems that they have a very harsh law in the city: death for any foreigner that commits a crime!";
			say "You are taken to the executioner, who is an old friend of you, but kills you anyway";
			end the story  saying "You are dead"; 
	otherwise:
		continue the action;

 Instead of taking something (called the stolen goods) which is not owned by the player:
	if the owner of the stolen goods is not a person:
		now the player owns the stolen goods;
	if the owner of the stolen goods can see the player:
		say "You can look at it, but you can't leave without paying"; 
	continue the action.

Money is a kind of thing. 
Money can be spent or fresh. 
Definition: money is costly if its price is $10 or more. 
Definition: money is cheap if its price is $5 or less. 

Coin is a kind of money. 

A golden yobe is a kind of coin. 
The price of a golden yobe is $100.  
The description of a golden yobe is "A coin. It has a king's head in one side and a winged dragon with a spear.".

A silver yobe is a kind of coin. 
The price of a silver yobe is $10.  
The description of a silver yobe is "A coin. A queen's head in one side, a winged dragon (no spear) in the other". 

A copper yobe is a kind of coin. 
The price of a copper yobe is $1. 
The description of a copper yobe is "A coin. A king's head in one side, a spear (no dragon) in the other".

After taking inventory :
  say "Altogether, you've got [the player's cash] on your person".

To decide what price is the player's cash: 
	let sum be the total price of money enclosed by the player; 
	decide on sum. 

To decide what price is the sum in (item - a container): 
	let sum be the total price of the money in the item; 
	decide on sum. 

A thing can be for sale.

Before listing contents: group money together giving articles. 

Rule for printing room description details of something (called target) which is for sale: say " ([price of the target])". 

After  examining a for sale thing: 
    say "[The noun] costs [the price of the noun], payable to [the owner of the noun]." 

The cashbox is a container. 
The cashbox contains 1 golden yobes. 
The cashbox contains 10 silver yobes. 
The cashbox contains 100 copper yobes.

The block buying rule is not listed in the check buying rules.

Check buying something owned by someone: 
    if the noun is not for sale, say "[The owner of the noun] does not want to sell you [the noun]." instead; 
    if the player's cash is less than the price of the noun, say "You can't afford the asking price of [the price of the noun] for [the noun]." instead. 

Check buying something not owned by someone: 
    if the noun is not for sale, say "There is no one to sell you [the noun]." instead; 
    if the player's cash is less than the price of the noun, say "You can't afford the asking price of [the price of the noun] for [the noun]." instead. 

Carry out of buying something: 
	let coinchange be $0;
	let sum paid be $0; 
	while sum paid is less than the price of the noun: 
		let current target be the price of the noun minus the sum paid; 
		let amount offered be the best money from the player for the current target; 
		if the amount offered is money: 
			move the amount offered to the owner of the noun; 
			now the amount offered is spent; 
			increase the sum paid by the price of the amount offered; 
			let current target be the price of the noun minus the sum paid; 
	say "You hand [the owner of the noun] [a list of spent money]. [run paragraph on]"; 
	if the sum paid is greater than the price of the noun:
		now coinchange is the sum paid minus the price of the noun; 
	if coinchange is greater than the sum in the cashbox :
		say "[the player's cash] saved [sum in the cashbox]";
		now the player carries every spent money; 
		now every spent thing is fresh; 
		say "I should give you [coinchange] "; 
		say "'Whoa,' says [the owner of the noun], handing the cash back to you. 'I can't make change for that, man, sorry.'" instead;
	now every spent thing is in the cashbox; 
	now every spent thing is fresh; 
	while coinchange is greater than $0:
		let coinchange coin be the best money from the cashbox for coinchange; 
		decrease coinchange by the price of the coinchange coin ; 
		now coinchange coin is spent; 
		move coinchange coin to player; 
	if money is spent:
		say "[The owner of the noun] makes change with [a list of spent money]. [run paragraph on]"; 
	now every spent thing is fresh; 
	if the noun is not enclosed by the player and the owner of the noun can touch the noun: 
		say "'Here ya go,' says [the owner of the noun], handing [the noun] to you. [run paragraph on]"; 
		move the noun to the player; 
	if noun is an itemSF listed in the Table of Stolen Things:
		choose row with itemSF of noun in the Table of Stolen Things;
		blank out the whole row; 
	now the player owns the noun. 


Report buying something: 
    if the player owns the noun, 
        say "Your transaction is now complete, leaving you with [the player's cash]." 


Functional relation is a kind of value. 
The functional relations are overpayment, underpayment, or irrelevant. 
Money has a functional relation. 


To decide what money is the best money from (buyer - a thing) for (cost - a price): 
	repeat with bill offered running through money: 
		if the bill offered is enclosed by the buyer: 
			if the price of the bill offered is the cost:
				decide on the bill offered; 
			otherwise if the price of the bill offered is greater than the cost:
				now the functional relation of bill offered is overpayment; 
			otherwise:
				now the functional relation of the bill offered is underpayment; 
    [say "underpayment: [list of underpayment money] 
    overpayment: [list of overpayment money]";] 
	let the desired bill be the costliest money which is underpayment; 
	if the total price of underpayment money is less than the cost: 
		let desired bill be the cheapest money which is overpayment; 
	decide on the desired bill. 

Section 2 Interesting Rules

Report examining a supporter which supports something: 
    say "On [the noun] is/are [list of things on the noun]." 

Section 3  Some preparation


Instead of  attacking  person (called the dead): 
	say "You kill the [dead] with you bare hands and teeth... That was a bloody and messy and noisy death... "; 
	Wait for any key ; 
	Say "[paragraph break] From every direction twenty young, strong and very upset guards run in your direction. They beat you. And then they beat you more and more. You faint...."; 
	Wait for any key; 
	Say "[paragraph break] ...You  wake up, hours later, in a damp and small prison cell. You notice that you don't have a door in the cell. You've been buried alive in the infamous dungeons of Upstoki."; 
	end the story finally saying "You are dead".


when play begins:
	say "Welcome to the City of Upstoki surroundings. you feel that is better that  you get inside soon, but you really don't know why..."; 
	now every thing carried by Loriel is owned by Loriel; 
	now every thing carried by Guard is owned by Guard; 
	now every thing carried by the player is owned by the player.

The player carries 1 golden yobe.
The player carries 4 silver yobe. 
The player carries 4 copper yobe.

Section 4 Multimedia

Figure of CastleBridge is the  file "castle bridge.jpg".
[ http://www.acreativenomad.com/blog/blog/castles-and-coasts-in-wales/ ]

Figure of Guard is the file "medieval-soldier.jpg".
[http://www.publicdomainpictures.net/view-image.php?image=18062]

Section 5 Bribing

Bribing it for is an action applying to two visible things. 
Understand "Bribe [someone] for [something]" as bribing it for.

Instead of bribing someone  (called quem) for something (called isso) :
	[try asking quem about "[isso]";]
	say "Are you trying to buy [isso] from me?".


Book 2 The Adventure

Chapter 1 Entering the city

BigGoal is a scene. BigGoal begins when play begins. BigGoal ends when player is in Entrance of the city of Upstoki. 

Section 1 The Bridge


The Bridge of Upstoki is a room.

The description of the Bridge of Upstoki is "You are in the Bridge of Upstoki, in front of the Great Gate of the city of Upstoki, in front of you is the enourmous city of Upstoki, a legend of mistery, terror and wonders. Its walls are 30 meters high, and its towers are even higher. In the end of the Bridge there is the only know entrance to the city. South of it there is the Outside Market".

after looking in  Bridge of Upstoki:
	display the Figure of CastleBridge;
	continue the action.
	

Section 2 The Gate

The Great Gate of the city of Upstoki is a door.

The description of the Great Gate is "You are in front of the Great Gate of the city of Upstoki. It is beautiful and terrifying, 20  meters tall, made of iron, with a great circle in the middle with the symbol of the city: a winged crinsom dragon armed with a spear." 


The Great Gate is north of the  Bridge of Upstoki and south of the Entrance of the city of Upstoki. The Gate is a door. The gate is closed. The gate is locked.
The golden key unlocks the Great Gate.



After opening the Great Gate: 
	increase score by 20.
After unlocking the Great Gate with the golden key: 
	increase score by 20.
Check opening the Great Gate for the first time:
	increase score by 15.


Section 3 The Guard

The Guard is a man in the Bridge. "The [Guard] seems to be very worried. ". 

Understand "Walstron" as the Guard.

Instead of examining the Guard for the first time:
	now the printed name of the Guard is "Guard Walstron";
	now the Guard is proper-named;
	say "You look at the guard more closely and he announces 'I am Walstron, Lesser Guard of the Great Gate!'";
	say "[Guard] is openly carrying [a list of  things carried by the noun]." ;
	display Figure of Guard.
	

The guard wears a brown uniform. 
The guard carries a spear.
The guard carries a golden key. 
The guard owns the golden key.

After examining the Guard:
	display Figure of  Guard;
	continue the action.

After asking guard about "key" for the first time:
	say "This golden key opens the gate. It was trusted to me by the Great Keeper of The Great Gate!".

After doing it more than one time:
	say "This key is trusted to me, I would not sell it even for 9 silver yobes!".
	
After asking guard about "buy" for the first time:
	say "Why I would sell this very important key? Even if you pay 9 silver yobes I would not sell it!".

After doing it more than one time:
	say "I told you, this key was trusted to me. But we are in difficult times, things can get lost...".
	
Instead of asking guard about "sell":
	try asking guard about "buy".

Instead of asking guard about "buy key":
	try asking guard about "buy".

After asking guard about "enter" for the first time:  
	say "You need a pass to enter.";
	increase score by 5.

After doing it more than one time: 
	say "Bug off, I've told you to get a pass";
	decrease score by 1.

After asking guard about "gate" :  
	say "You need a pass to enter.";   
	increase score by 10.

After doing it more than one time: 
	say "Bug off, I've told you to get a pass";
	decrease score by 1.

After asking guard about "pass" : 
	say "You can ask Loriel for a pass."; 
	increase score by 10.

After doing it more than one time: 
	say "Bug off, I've told you to look for Loriel";
	decrease score by 1.

After asking guard about "Loriel" : 
	say "You can find Loriel in the Pass Tent, on the Outside Market"; 
	increase score by 10.

After doing it more than one time: 
	say "Bug off, I've told you to loo for the Tent";
	decrease score by 1.

Instead of giving the pass to guard: 
	now the gate  is  unlocked; 
	say "The guard picks the pass and carefully examine it. Giving a satisfying nod, he unlocks and opens the gate with the key and bows for you to pass."; 
        now the gate is open; 
	increase the score by 30.

Instead of buying key for the first time:
	try asking guard about  "key".

Instead of buying key for the second time:
	try asking guard about  "key".
	
The guard owns the golden key.
The price of the golden key is $100.
The golden key is for sale.

Section 4 The Outer Market

Pass is a thing.

South of the Bridge is the Outer Market.
The description  of Outer Market is "A typical but very small market, with shabby tents.  At South there is beautiful and shiny tent with a sign:  Passes for the city".


South of Outer  Market is Pass Tent.
Outside of  Pass Tent is Outer Market.
Instead of going inside in the Outer Market: say "Inside what?"

Section 5 The Pass Tent

The description of Pass Tent is "The tent is large. There are some shelves and books. At the end of the tent is a desk with a old  man sitted behind it. There is a sign in the table reading 'Pass: $12'. There is a pile of passes on the table"

Desk is a supporter in Pass Tent.
Desk is scenery. 


On the desk is pass.
Pass is for sale. 

The printed plural name of pass is "passes".
The description of pass is "A paper pass, with a winged crinson dragon with a spear on it and saying 'The holder of this pass allowed to enter Upstoki, but there is no guarantee that he or she (or it) will be allowed or able to leave the city'".
The price of a pass is $12.

Loriel is a man. Loriel is in Pass Tent.  Loriel owns pass.
The description of Loriel is "Loriel is an old man. He carries a bunch of papers that looks like a set os passes for the gate".

Loriel owns the desk.


Chapter 2 The City


Goal2 is a scene. Goal2 begins when player is in Entrance of the City of Upstoki.

Section 1 The Entrance of the City of Upstoki

The Entrance of the City of Upstoki is a room.

After going to the Entrance of the City of Upstoki for the first time:
	now the Great Gate is closed;
	now the Great Gate is locked;
	say "After you enter the city, you see Loriel and some guards entering the city after you. A platoon runs to the gate, closes and locks it. They also block it, and you noticed that it will be very difficult to leave the city for the following days.";
	move Loriel to Entrance;
	move Guard to Entrance;
	continue the action.

The description of the  Entrance of the City of Upstoki  is "[if unvisited]You enter the magnificent City of Upstoki for the first time. It is beautiful, but troubled![end if] You are at a large plaza. Guards run in all drections. The population, carrying sacs and cases, run north, following a large street that ends in a door in the mountain far away.".

Section 2 The Food Market of the City of Upstoki

The Food Market is a room. The Food Market is west of The Entrance.

Section 3 The Arms Market of the City of Upstoki

The Arms Market is a room. The Arms Market is east of the Entrance.

Section 4 The Street of King Lamborgy

A street is a Kind of room.

The First Quarter of the Street of King Lamborgy is a street. The First Quarter of the Street of King Lamborgy is north  of the Entrance.

The Second Quarter of the Street of King Lamborgy is a street. The Second Quarter of the Street of King Lamborgy is north  of the First Quarter of the Street of King Lamborgy.

The Third Quarter of the Street of King Lamborgy is a street. The Third Quarter of the Street of King Lamborgy is north  of the Second Quarter of the Street of King Lamborgy.

The Fourth Quarter of the Street of King Lamborgy is a street. The Fourth Quarter of the Street of King Lamborgy is north  of the Third Quarter of the Street of King Lamborgy.


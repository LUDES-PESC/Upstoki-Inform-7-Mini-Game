"UpstokiNew" by Geraldo


The story genre is "Adventure". 
The release number is 3. 
The story headline is "When danger is coming". 
The story description is "You faintly remember that you were in danger, and you must do something. But what? Who are you? Your guts tell you that is better to solve this problem really fast."

The maximum score is 100.

Include Basic Screen Effects by Emily Short. 
Use scoring.

Book 1 Preparation



Section 1 Money System  The Yobe

[ this table maintains how many times someone tries to steal something ]

Table of Stolen Things
itemSF	tentativesSF
thing	a number
with 10 blank rows

[ about price and value ]

Price is a kind of value. 
$10 specifies a price with parts coins. 
A thing has a price. 
The price of a thing is usually $0.
Definition: a thing is worthless if the price of it is $0. 
Definition: a thing is valuable if it is not worthless.

[ about property ]

Ownership relates one person (called the owner) to various things. 
The verb to own (he owns, they own, he owned, he is owned) implies the ownership relation. 

Definition: a thing is owned if the player owns it. 

Instead of buying something which is owned by the player: 
    say "You already own [the noun]." 

Instead of going somewhere when the player encloses something (called the stolen goods) which is not owned by the player: 
    if stolen goods is an itemSF listed in the Table of Stolen Things begin;
      choose row with itemSF of stolen goods in the Table of Stolen Things;
      increase tentativesSF entry by 1  ;
    otherwise; 
      choose a blank row in Table of Stolen Things;
      change itemSF entry to the stolen goods;
      increase tentativesSF entry by 1;
    end if;
    if the owner of the stolen goods is not a person begin; 
        now the player owns the stolen goods; 
        continue the action; 
    end if; 
    if the owner of the stolen goods can see the player begin;
        say "'Hey there buddy, not so fast,' says [the owner of the stolen goods]. 'You going to buy [the stolen goods] first, or am I gonna call the cops?'"; 
       choose row with itemSF of stolen goods in the Table of Stolen Things;
       let y be tentativesSF entry;
       if y is 3 begin; 
          say "You bastard! Guards! Guards!"; 
          wait for any key;
          say "[paragraph break] The guards arrive, they are many, and they are strong... You try to escape, but fail... You are beaten and arrested. They don't like thieves in the town... ";
           wait for any key; 
           say "[paragraph break] It seems that they have a very harsh law in the city: death for any foreigner that commits a crime!";
           end the game in death; 
       end if;
    otherwise; continue the action;
    end if;
   

Instead of taking something (called the stolen goods) which is not owned by the player:
if the owner of the stolen goods is not a person then
        now the player owns the stolen goods;
 if the owner of the stolen goods can see the player then
        say "'You can look at it, but you can't leave without paying"; 
continue the action.



[ about money ]

Money is a kind of thing. 
Coin is a kind of money. 

A golden yobe is a kind of coin. The price of a golden yobe is $100.  
The description of a golden yobe is "A gold coin. It has a king's head in one side and a winged dragon with a spear.".

A silver yobe is a kind of coin. The price of a silver yobe is $10.  
The description of a silver yobe is "A silver coin. A queen's head in one side, a winged dragon (no spear) in the other". 

A copper yobe is a kind of coin. The price of a copper yobe is $1. 
The description of a copper yobe is "A copper coin. A king's head in one side, a spear (no dragon) in the other".

After taking inventory :
  say "Altogether, you've got [the player's cash] on your person".

To decide what price is the player's cash: 
    let sum be the total price of money enclosed by the player; 
    decide on sum. 

To decide what price is the sum in (item - a container): 
    let sum be the total price of the money in the item; 
    decide on sum. 

Before listing contents: group money together giving articles. 

[ sales ]

A thing can be for sale.

Rule for printing room description details of something (called target) which is for sale: say " ([price of the target])". 

After  examining a for sale thing: 
    say "[The noun] costs [the price of the noun], payable to [the owner of the noun]." 

[ this helps on change ]

The cashbox is a container. The cashbox contains 100 golden coins. 
The cashbox contains 1000 silver coins. The cashbox contains 10000 copper coins.

The block buying rule is not listed in the check buying rules. 

[ about buying ]

Check buying something owned by someone: 
    if the noun is not for sale, say "[The owner of the noun] does not want to sell you [the noun]." instead; 
    if the player's cash is less than the price of the noun, say "You can't afford the asking price of [the price of the noun] for [the noun]." instead. 

Check buying something not owned by someone: 
    if the noun is not for sale, say "There is no one to sell you [the noun]." instead; 
    if the player's cash is less than the price of the noun, say "You can't afford the asking price of [the price of the noun] for [the noun]." instead. 

[ inicio do complicado ]

Carry out buying something: 
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
	if the sum paid is greater than the price of the noun, let change be the sum paid minus the price of the noun; 
	if change is greater than the sum in the cashbox: 
		now the player carries every spent money; 
		now every spent thing is fresh; 
		say "'Whoa,' says [the owner of the noun], handing the cash back to you. 'I can't make change for that, man, sorry.'" instead; 
	now every spent thing is in the cashbox; 
	now every spent thing is fresh; 
	while change is greater than $0: 
		let change coin be the best money from the cashbox for change; 
		decrease change by the price of the change coin ; 
		now change coin is spent; 
		move change coin to player; 
	if money is spent, say "[The owner of the noun] makes change with [a list of spent money]. [run paragraph on]"; 
	now every spent thing is fresh; 
	if the noun is not enclosed by the player and the owner of the noun can touch the noun: 
		say "'Here ya go,' says [the owner of the noun], handing [the noun] to you. [run paragraph on]"; 
		move the noun to the player; 
	if noun is an itemSF listed in the Table of Stolen Things:
		choose row with itemSF of noun in the Table of Stolen Things;
		blank out the whole row; 
	now the player owns the noun. 

[ fim do complicado ]

Money can be spent or fresh. 

Report buying something: 
    if the player owns the noun, 
        say "Your transaction is now complete, leaving you with [the player's cash]." 

[ terceira parte]

Definition: money is costly if its price is $10 or more. 
Definition: money is cheap if its price is $5 or less. 

Functional relation is a kind of value. The functional relations are overpayment, underpayment, or irrelevant. Money has a functional relation. 

To decide what money is the best money from (buyer - a thing) for (cost - a price): 
	repeat with coin offered running through money: 
		if the coin offered is enclosed by the buyer: 
			if the price of the coin offered is the cost, decide on the coin offered; 
			if the price of the coin offered is greater than the cost, now the functional relation of coin offered is overpayment; 
			otherwise now the functional relation of the coin offered is underpayment; 
		otherwise: 
			now the functional relation of the coin offered is irrelevant; 
    [say "underpayment: [a list of underpayment money] 
    overpayment: [a list of overpayment money]";] 
	if the total price of underpayment money is less than the cost: 
		decide on the cheapest money which is overpayment; 
	otherwise: 
		decide on the costliest money which is underpayment. 



Section 2 Interesting Rules

Report examining a supporter which supports something: 
    say "On [the noun] is/are [list of things on the noun]." 

Section 3  Some preparation


Instead of  attacking  person (called the dead): say "You kill the [dead] with you bare hands and teeth... That was a bloody and messy death... "; Wait for any key ; Say "[paragraph break] The Great Gate opens and twenty young, strong and very upset guards run in your direction. They beat you. And then they beat you more and more. You faint...."; Wait for any key; Say "[paragraph break] ...You  wake up, hours later, in damp and small prison cell. You notice that you don't have a door in the cell. You've been buried alive in the infamous dungeons of Upstoki."; end the game in death.

Pass is a thing.

When play begins:
 say "Welcome to the City of Upstoki surroundings. you feel that is better that  you get inside soon, but you really don't know why..."; 
 now every thing carried by Loriel is owned by Loriel; 
 now every thing carried by the player is owned by the player.

The player carries 1 golden yobe. 
The player carries 4 silver yobe. 
The player carries 4 copper yobe. 

Book 2 The Adventure

Chapter 1 Entering the city

Section 1 The Bridge

The Bridge of Upstoki is a room.

The description of the Bridge of Upstoki is "You are in the Bridge of Upstoki, in front of the Great Gate of the city of Upstoki, in front of you is the enourmous city of Upstoki, a legend of mistery, terror and wonders. Its walls are 30 meters high, and its towers are even higher. In the end of the Bridge there is the only know entrance to the city. South of it there is the Outside Market".

Section 2 The Gate

The Great Gate of the city of Upstoki is a door.

The description of the Great Gate is "You are in front of the Great Gate of the city of Upstoki. It is beautiful and terrifying, 20  meters tall, made of iron, with a great circle in the middle with the symbol of the city: a winged crinsom dragon armed with a spear." 

The Great Gate is north of the  Bridge of Upstoki and south of the Entrance of the city of Upstoki. The Gate is a door. The gate is closed. The gate is locked.
The golden key unlocks the Great Gate.

After opening the Great Gate: increase the score by 20 points.
After unlocking the Great Gate with the golden key: increase the score by 20 points.
Check opening the Great Gate:
increase the score by 15 points.


Section 3 The Guard

A man called guard is in the Bridge. 
The guard wears a crimson uniform. 
The guard carries a golden key. 


After asking guard about "enter" for the first time:  
say "You need a pass to enter.";
increase the score by 10 points.

After doing it more than one time: 
say "Bug off, I've told you to get a pass";
increase the score by -1 points.

After asking guard about "gate" :  say "You need a pass to enter.";   increase the score by 10 points.

After doing it more than one time: 
say "Bug off, I've told you to get a pass";
increase the score by -1 points.

After asking guard about "pass" : say "You can ask Loriel for a pass."; increase the score by 10 points.

After doing it more than one time: 
say "Bug off, I've told you to look for Loriel";
increase the score by -1 points.

After asking guard about "Loriel" : say "You can find Loriel in the Pass Tent, on the Outside Market"; increase the score by 10 points.

After doing it more than one time: 
say "Bug off, I've told you to loo for the Tent";
increase the score by -1 points.

Instead of  giving the pass to guard: 
	change the gate to unlocked; 
	say "The guard picks the pass and carefully examine it. Giving a satisfying nod, he unlocks and opens the gate with the key and bows for you to go. He also keeps the pass"; 
           change the gate to open;   
           move pass to guard;
	increase the score by 30 points.

The guard owns the golden key.
The price of the golden key is $100.
The golden key is for sale.

Section 4 The Outer Market

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

BigGoal is a scene. BigGoal begins when play begins. 
BigGoal ends when player is in Entrance of the city of Upstoki. 

	



Chapter 2 The City

Goal2 is a scene. Goal2 begins when player is in Entrance of the City of Upstoki.

The Entrance of the city of Upstoki is a room.

After entering the Entrance of the City of Upstoki for the first time:
change the Great Gate to closed;
change the Great Gate to locked;
say "After you enter the city, you see Loriel and some guards entering the city after ou. A platoon runs to the gate, closes and locks it. They also block it, and you noticed that it will be very difficult to leave the city for the following days.";
move Loriel to Entrance.

The description of the  Entrance of the city of Upstoki for the first time is
"You arrive at a large plaza. Guards run in all drections. The population, carrying sacs and cases, run north, following a large street that ends in a door in the mountain far away.".

The description of the  Entrance of the city of Upstoki for more than one time is
"Guards run in all drections. The population, carrying sacs and cases, run north, following a large street that ends in a door in the mountain far away.".


Instead of kissing the guard :
say "Go away";




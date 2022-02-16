class AstralnekoTemp
    # Player animations - stores the last direction the player was holding; everything else can be determined algorithmically
	attr_accessor :lastPlayerDirection
	
	def initialize
		@lastPlayerDirection = 2
	end
	
	def setLastPlayerDir(dir)
		@lastPlayerDirection = dir
    end
end
$Astralneko_Temp = AstralnekoTemp.new

class AstralnekoStorage
	# Time overrides
	attr_accessor :overrideTime
	attr_accessor :timeToOverride
	
	def initialize
		@overrideTime = false
		@timeToOverride = 0
	end
	
	def timeOverride?
		return overrideTime
	end
	
	def setTimeOverride(time)
		@overrideTime = true
		@timeToOverride = time
	end
	
	def removeTimeOverride
		@overrideTime = false
	end
end
$Astralneko_Storage = AstralnekoStorage.new

# Saves the AstralnekoStorage global variable.
SaveData.register(:astralneko_storage) do
	load_in_bootup
    ensure_class :AstralnekoStorage
    save_value { $Astralneko_Storage }
    load_value { |value| $Astralneko_Storage = value }
    new_game_value { AstralnekoStorage.new }
end

alias pbGetTimeNow_astralneko pbGetTimeNow
def pbGetTimeNow
	if $Astralneko_Storage.timeOverride?
		return $Astralneko_Storage.timeToOverride
	else
		return pbGetTimeNow_astralneko
	end
end

def anTimeOverride(*args)
    if args.size == 2 || args.size == 3
		$Astralneko_Storage.setTimeOverride(Time.local(Time.now.year,Time.now.month,Time.now.day,args[0],args[1]))
	else
		if args[0].is_a?(Time)
			$Astralneko_Storage.setTimeOverride(args[0])
		else
		    $Astralneko_Storage.setTimeOverride(Time.local(Time.now.year,Time.now.month,Time.now.day,args[0],0,0))
		end
	end
end

def anRemoveTimeOverride
	$Astralneko_Storage.removeTimeOverride
end

# Play player animation
def anPlayPlayerAnimation(animname, length=1, frequency=2, vehicle=false)
    $Astralneko_Temp.setLastPlayerDir($game_player.direction)
	meta = GameData::Metadata.get_player($Trainer.character_ID)
	if meta
		charset = 1                                 # Regular graphic
		if vehicle
			if $PokemonGlobal.diving;     charset = 5   # Diving graphic
			elsif $PokemonGlobal.surfing; charset = 3   # Surfing graphic
			elsif $PokemonGlobal.bicycle; charset = 2   # Bicycle graphic
			end
		end
		newCharName = pbGetPlayerCharset(meta,charset,nil,true)
		animation = "" + newCharName + "_" + animname
		case length
		when 1
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation,
				  0, 2, 0,
				PBMoveRoute::Wait,frequency
			])
		when 2
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 1,
				PBMoveRoute::Wait,frequency
			])
		when 3
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency
			])
		when 4
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 3,
				PBMoveRoute::Wait,frequency
			])
		when 5
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 3,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 0,
				PBMoveRoute::Wait,frequency
			])
		when 6
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 3,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 1,
				PBMoveRoute::Wait,frequency
			])
		when 7
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 3,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 2,
				PBMoveRoute::Wait,frequency
			])
		when 8
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 3,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 3,
				PBMoveRoute::Wait,frequency
			])
		end
	end
end

def anReversePlayerAnimation(animname, length=1, frequency=2, vehicle=false)
    $Astralneko_Temp.setLastPlayerDir($game_player.direction)
	meta = GameData::Metadata.get_player($Trainer.character_ID)
	if meta
		charset = 1                                 # Regular graphic
		if vehicle
			if $PokemonGlobal.diving;     charset = 5   # Diving graphic
			elsif $PokemonGlobal.surfing; charset = 3   # Surfing graphic
			elsif $PokemonGlobal.bicycle; charset = 2   # Bicycle graphic
			end
		end
		newCharName = pbGetPlayerCharset(meta,charset,nil,true)
		animation = "" + newCharName + "_" + animname
		case length
		when 1
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation,
				  0, 2, 0,
				PBMoveRoute::Wait,frequency
			])
		when 2
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 0,
				PBMoveRoute::Wait,frequency
			])
		when 3
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency
			])
		when 4
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 3,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency
			])
		when 5
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 2, 3,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency
			])
		when 6
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 4, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 3,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency
			])
		when 7
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 4, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 3,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency
			])
		when 8
			pbMoveRoute($game_player,[
				PBMoveRoute::TurnDown,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 3,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
			  	  0, 4, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 4, 0,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 3,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 2,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 1,
				PBMoveRoute::Wait,frequency,
				PBMoveRoute::Graphic,animation, 
				  0, 2, 0,
				PBMoveRoute::Wait,frequency
			])
		end
	end
end

def anEndPlayerAnimation
	meta = GameData::Metadata.get_player($Trainer.character_ID)
	if meta
		charset = 1                                 # Regular graphic
		if $PokemonGlobal.diving;     charset = 5   # Diving graphic
		elsif $PokemonGlobal.surfing; charset = 3   # Surfing graphic
		elsif $PokemonGlobal.bicycle; charset = 2   # Bicycle graphic
		end
		newCharName = pbGetPlayerCharset(meta,charset,nil,true)
		case $Astralneko_Temp.lastPlayerDirection
		when 2
		pbMoveRoute($game_player,[
			PBMoveRoute::TurnDown,
			PBMoveRoute::Graphic,newCharName, 
			  0, 2, 0
		])
		when 4
		pbMoveRoute($game_player,[
			PBMoveRoute::TurnDown,
			PBMoveRoute::Graphic,newCharName, 
			  0, 4, 0
		])
		when 6
		pbMoveRoute($game_player,[
			PBMoveRoute::TurnDown,
			PBMoveRoute::Graphic,newCharName, 
			  0, 6, 0
		])
		when 8
		pbMoveRoute($game_player,[
			PBMoveRoute::TurnDown,
			PBMoveRoute::Graphic,newCharName, 
			  0, 8, 0
		])
		end
	end
end

def anMart(itemlist)
    badges = $Trainer.badge_count
	
	buyableItems = []
	for i in 0...itemlist.length
		if itemlist[i+1].is_a?(Integer)
			if badges >= itemlist[i+1]
				buyableItems.push(itemlist[i])
			end
		end
	end
	pbPokemonMart(buyableItems)
end

def anStackBitmapsSingle(baseBitmap, addBitmap)
	return nil if !baseBitmap || !addBitmap
	
	# Ensure the new bitmap can fit the larger of the two widths
	if addBitmap.width > baseBitmap.width
		width = addBitmap.width
	else
		width = baseBitmap.width
	end
	# Ensure the new bitmap can fit the larger of the two heights
	if addBitmap.height > baseBitmap.height
		height = addBitmap.height
	else
		height = baseBitmap.height
	end
	
	# blt the two bitmaps together on a new bitmap
	result = Bitmap.new(width,height)
	result.blt(0,0,baseBitmap,Rect.new(0,0,baseBitmap.width,baseBitmap.height))
	result.blt(0,0,addBitmap,Rect.new(0,0,addBitmap.width,addBitmap.height))
	return result
end

# The above function, but generalized to any amount of Bitmap objects instead of two
def anStackBitmaps(*args)
	result = Bitmap.new(10,10)
	for i in args.size
		if args[i].is_a?(Bitmap)
			result = anStackBitmapsSingle(result,args[i])
		else # Assume filename string if not a Bitmap
			if pbResolveBitmap("Graphics/"+args[i])
				bitmap = Bitmap.new(args[i])
				result = anStackBitmapsSingle(result,bitmap)
			else
				return nil
			end
		end
	end
	return result
end

# Generate a new random name from a list
def anRandomName
  names = ["Pi","Jo","Bob","Max","Joe","Leo","Ann","Tia","Mia","Kim","Mike","Mark",
          "Alex","Joey","Anne","Zoey","Jill","Kate","Robin","Wayne","Scott","Jimmy",
          "Chloe","Donna","Sonya","Pansy","Dudley","Daniel","Landon","Thomas","Rachel",
          "Noelle","Stacey","Cammie","Forrest","Esteban","Malcolm","Webster","Marilyn",
          "Jasmine","Jessica","Crystal","Jonathan","Marshall","Lawrence","Tristian","Mallorie",
          "Kristine","Veronica","Scarlett","Cristiano","Marcellus","Lillianna","Kimberley","Wellington",
          "Florentino","Jacqueline","Antoinette","Christopher","Maximillian","Heorhiy","Georg","Juhan",
          "Anna","Seong-Su","Adelheid","Mair","Deon","Bruno","Théophile","Xuân","Hameed","Bat-Erdene",
          "Vince","Tófi","Amalthea","'Efrayim","Osborn","Ashley","Braith","Silouanos","Pierpaolo",
          "Vaska","Maina","Olev","Seweryna","Zétény","Karolyn","Srinivas","Yvain","Anakletos",
          "Puanani","Rowanne","Carys","Cüneyt","Münire","Ignacij","Olimpia","Chrtomir","Habib","Scottie",
          "Nobutoshi","Pius","Ruadhán","Cunobelinus","Naila","Jean-Charles","Ida","Tanguy","Thirza",
          "Takeshi","Rein","Philon","Firdausi","Alya","Odovacar","Chiyembekezo","Thórfrethr","Goronwy",
          "Ondrej","Mélodie","Helen","Ștefan","Atropos","Jourdain","Brooklynn","Ankhbayar","Zuzana",
          "Vashti","Hadubert","'El'azar","Lennox","Bernice","Carolyn","Moreen","Defne","Hefin","Salka",
          "Basil","Mwenye","Jie","Jamil","Zelda","Melike","Iara","Nevena","Nick","Etenesh","Camila",
          "Ahura","azda","Barbro","Sondra","Kristen","Branden","Meena","Jakov","Leyton","Noè",
          "Ilona","Iúile","Sifiso","Giiwedinokwe","Gülten","Fadi","Yianni","Augustinas","Shahnaz",
          "Chukwuma","Cynebald","Amaya","Cupid","Faramund","Ensar","Plácida","Kreso","Valérian",
          "Sviatlana","Leifr","Ventseslav","Puneet","Halle","Efstathios","Aubrie","Margaréta","Chima",
          "Solon","Suz","Natalija","Freda","Sona","Pasco","Atanasij","Danya","Nadeem","Farquhar",
          "Ezra","Orsina","Kassiopeia","Axelle","Meginhard","Yaren","Susumu","Joaquin","Batyah",
          "Athanasia","Hecuba","Hikmet","Marshall","Liudevit","Seher","Jaffar","Laetitia","Rawiya",
          "Xenokrates","Brage","Aisling","Bolívar","Gennadi","Kyra","Mildburg","Gunda","Jean-Jacques",
          "Lasse","Furkan","Romina","Michayla","Gordon","Sobieslaw","Kira","Bea","Reine","Gunilla",
          "Avra","Prisca","Aoife","Detlev","Mikki","Werknesh","Pieter","'Ach'av","Thatcher","Merrick",
          "Venceslás","Taurai","Raffaele","Andries","Iqbal","Otgonbayar","Yin","Orla","Othman","Leifur",
          "Abosede","Muhammad","'Azazyahu","Eseoghene","Mannes","Warner","Noemin","Skanda","Amram",
          "Cennet","Sabriyya","Golnaz","Mahdi","Sajjad","Yenifer","Mellan","Augustín","Azel","Ayaan",
          "Araminta","Bèr","Zubin","Maitiú","Voitto","Ants","Annett","Zenon","Prokopiy","Zsófika",
          "Abbey","Ji-U","Kamau","Pelagios","Liudvikas","Shulammit","Efrat","Alvis","Quidel","Lodewijk",
          "Menashe","Burke","Yima","Kelleigh","Ranko","Vidya","Aurélien","Gamil","Lanford","Govad",
          "Körbl","Thamarai","Nkruma","Jagienka","Millard","Parthenia","Kailey","Saodat","Mar","Eadgar",
          "Agnar","Adelajda","Elle","Vanda","Ömer","Wulf","Colombina","Henrika","Lilach","Arrigo","Ender",
          "Ulric","Quanah","Aliya","Niven","Lovemore","Ileen","Aimilios","Ilike","Reinaldo","Midge","Caomhán",
          "Nitya","Florentin","Germaine","Tasnim","Kou","Hollie","Percival","Vladislav","Esau","Shan","Visvaldis",
          "Cherry","Agnese","Blodwen","Aritra","Alberico","Therese","Berry","Nuno","Ahava","Arduino",
          "Ayesha","Dylan","Gage","Tzila","Sasithorn","Gerolt","Alfhild","Charmion","Gregório","Serapion",
          "Skadi","Joël","Tristan","Todor","Savva","Kizzy","Uzochi","Cyndi","Finley","Dana","Midhat","Sherife",
          "Tawnie","Kersti","Onur","Aparecida","Leocadia","Philomène","Tighearnán","Ziad","Paskal","Lowie",
          "Ioubal","Tellervo","Abdülkadir","Eija","Bachtiar","Nimet","Aljbeta","Urska","Odarka","Hyginos","Hallie",
          "Margriet","Yanna","Anastázie","Eskandar","Harinder","Cam","Hadia","Vanna","Aamina","Markos","Giustino",
          "Walery","Hildred","Salomea","Maite","Abessalom","Brigitte","Samuele","Jerrik","Carole","Paavo","Verginia",
          "Trajanka","Kellen","Arati","Hayyim","Edite","Ioses","Hurshit","Rosaline","Bityah","Nada","Iounia","Linette",
          "Hewie","Tami","Tonio","Krystine","Abidemi","Fynn","Zyta","Iuliu","Adalberht","Jofie","Curro","Jeremías",
          "Winfrith","Basilius","Sebastiano","Mümtaz","Constantino","Jacquelyn","Savely","Selby","Cenric","Mæja",
          "Sib","Phirun","Alena","Missie","Éric","Oluwafemi","Tai","Abraam","Ulriikka","Oralie","Gutierre","Koki",
          "Genista","Cindi","Russ","Fatsani","Emygdius","Allegra","Darden","Lovrenco","Hui","Máximo","Faysal",
          "Assol","Washti","Dumuzi","Hine","Përparim","Corradino","Spartacus","Fechín","Valéria","Angus",
          "Xulio","Liora","Beowulf","Stamatios","Noèle","Òscar","Liisi","Tilo","Drusa","Tapani","Bodil","Si-Woo",
          "Kamala","Borys","Safaa'","Mihaila","Johanna","Ayako","Alta","Arlet","Wilfrid","Chidubem","Vilhelmo",
          "Agafon","Hirune","Phoebe","Bryony","Lawan","Mattéo","Zviadi","Rade","Lenka","Domnius","Kealoha",
          "Æthelthryth","Vytautas","Yocheved","Amilcare","Libena","Savina","Golshan","Afonso","Veta","Ofir",
          "Jaci","Nkiruka","Louiza","Iacob","Philippe","Amirani","Bethari","Maire","Oshrat","Damhán","Ermete","Fidelia",
          "Herk","Osa","Evyatar","Jo","Lina","Reva","Niraj","Sancheriv","Shehrazad","Baha","Ameqran","Cabdulqaadir",
          "Shari","Wei","Zalán","Mikhal","Hallvarthr","Mátyás","Cerys","Yeong-Su","Marya","Achard","Benvenuto",
          "Radomir","Alisa","Silvie","Aulus","Rabia","Dragan","Erlingur","Ortrun","Giacomo","Ryota","Tudur","Amariah",
          "Sparrow","Geena","Macsen","Su-Bin","Nessa","Antica","Nele","Dileep","Arman","Tomás","Alon","Kerstin",
          "Pema","Moos","Lilia","Ita","Devnet","Liam","Jochebed","Maria Vittoria","Effimia","Dionysia","Munkhtsetseg",
          "Aku","Evvie","Macaria","Tanja","Irinushka","Hálfdan","Cayetana","Varfolomei","Vasya","Marcelino","Elior"]
  return names[rand(names.size)] # could be rand(612) but this future proofs it
end

# Generates a random gender, based loosely on the name of the character.
def anRandomGender(name="X")
  guess = defined?(Trainer.nonbinary?) ? rand(3) : rand(2) # 0 = male, 1 = female, 2 = nonbinary (if defined)
  # To maintain the guess, the following checks must not succeed:
  # Name ends in L/O/N/S, 1/2 chance
  guess = 0 if name[/[l|o|n|s]$/] != "" && rand(2) == 0
  # Name ends in O/E/R, 1/4 chance
  guess = 0 if name[/[o|e|r]$/] != "" && rand(4) == 0
  # Name ends in A/IE, 1/2 chance
  guess = 1 if name[/[a|ie]$/] != "" && rand(2) == 0
  # Name ends in A/D/Z/Y, 1/4 chance
  guess = 1 if name[/[a|d|z|y]$/] != "" && rand(4) == 0
  # Whatever guess now is, return it
  return guess
end
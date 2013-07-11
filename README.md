# Botémon - IRC bot for Pokéfag

Datas are got from Smogon and then cached. Convertion id -> name is performed by PokémonDB.

You can try Botémon in #task-force and #omnivium, in irc.rizon.net
 

`Installation: [sudo] gem install botemon

Usage: botemon <bot_name> <bot_password> <server> <channels>`


- pkmn Bulbasaur
  * Request Pokédex data by name

- pkmn 1
  * Request Pokédex data by id

- moveset Bulbasaur LC
  * Request Smogon movesets by name and tier

- ability Synchronize
  * Request the description of the given ability

- pktrivia
  * Start the trivia game

- pktrivia Bulbasaur
  * Try to foresee the mysterious Pokémon

- pkdebug
  * Check what is the mysterious Pokémon. Only for selected users.

- pkstop
  * Abort the game. Only for channel operators and the user who has started the game.

- pkversion
  * Get the version of Botémon

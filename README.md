# Botémon - IRC bot for Pokéfags

Datas are fetched from Smogon and then are cached. `id -> name` conversion performed by PokémonDB.

You can try Botémon in #task-force and #omnivium at irc.rizon.net


`Installation: [sudo] gem install botemon`

`Usage: botemon <bot_name> <bot_password> <server> <channels>`


- pkmn Bulbasaur
  * Request Pokédex data by name.

- pkmn 1
  * Request Pokédex data by id.

- ability Synchronize
  * Request the description of the given ability.

- item Leftovers
  * Request the description of the given item.

- move Reflect
  * Request the description of the given move.

- moveset Bulbasaur LC BW
  * Request Smogon movesets by name, tier and metagame (optional, default is bw).

- pkrandom
  * Get info about a random Pokémon.

- pktrivia
  * Start the trivia game.

- pktrivia Bulbasaur
  * Try to foresee the mysterious Pokémon.

- pkdebug
  * Check what is the mysterious Pokémon. Only for selected users.

- pkstop
  * Abort the game. Only for channel operators and the user who has started the game.

- pkversion
  * Get the version of Botémon.


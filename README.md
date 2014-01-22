# Botémon - IRC bot for Pokéfags

Data are fetched from [Smogon](https://github.com/RoxasShadow/Smogon) and then cached. `id -> name` conversion is performed from Marriland.

You can try Botémon in `#task-force` and `#omnivium` at `irc.rizon.net`.


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
  * Request Smogon movesets by name, tier and metagame (it's optional, by default it's bw).

- pstats Scizor 70 Adamant 0/252/0/0/6/252 15/31/30/2/31/31
  * Calculate the final stats of a level 70 scizor with the given EVs and IVs.

- pstats Scizor 70 Adamant 0/252/0/0/6/252
  * Calculate the final stats of a level 70 scizor with the given EVs and all the IVs set to 31.

- pkrandom
  * Get infos about a random Pokémon.

- pktrivia
  * Start the trivia game.

- pktrivia Bulbasaur
  * Try to foresee the mysterious Pokémon.

- pkdebug
  * Reveal who is the mysterious Pokémon. Only for selected users.

- pkstop
  * Abort the game. Only for channel operators and the user who started the game.

- pkcache
  * Create a new cache. Only for channel operators.

- pkhelp
  * Print all available commands

- pkversion
  * Print the version of Botémon.


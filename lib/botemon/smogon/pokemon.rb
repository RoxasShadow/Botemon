#--
# Copyright(C) 2013 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# This file is part of Botémon.
#
# Botémon is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Botémon is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Botémon.  If not, see <http://www.gnu.org/licenses/>.
#++

module Smogon
  class Pokemon
    attr_accessor :name, :_name, :types, :tier, :abilities, :base_stats, :moves
    
    def to_s
      "Name: #{name}\nAbility: #{abilities.join(', ')}\nType: #{types.join(?/)}\nTier: #{tier}\nBase stats: #{base_stats.join(?/)}\nMoves: #{moves.join(', ')}"
    end
    
    def clues
      "Ability: #{abilities.join(', ')}\nType: #{types.join(?/)}\nTier: #{tier}\nBase stats: #{base_stats.join(?/)}"
    end
    
    def self.to_pokemon(ary)
      return Pokemon.new.tap { |pokemon|
        pokemon.name       = ary['name']
        pokemon._name      = ary['_name']
        pokemon.types      = ary['types']
        pokemon.tier       = ary['tier']
        pokemon.abilities  = ary['abilities']
        pokemon.base_stats = ary['base_stats']
        pokemon.moves      = ary['moves']
      }
    end
    
    def to_ary
      { 'name'       => name,
        '_name'      => _name,
        'types'      => types,
        'tier'       => tier,
        'abilities'  => abilities,
        'base_stats' => base_stats,
        'moves' => moves
      }
    end

    def stats(level, nature, evs, ivs)
      natures = {
        :jolly   => { :plus => :spe,   :minus => :atksp },
        :rash    => { :plus => :atksp, :minus => :defsp },
        :hardy   => { :plus => :none,  :minus => :none  },
        :brave   => { :plus => :atk,   :minus => :spe   },
        :naughty => { :plus => :atk,   :minus => :defsp },
        :calm    => { :plus => :defsp, :minus => :atk   },
        :careful => { :plus => :defsp, :minus => :atksp },
        :adamant => { :plus => :atk,   :minus => :atksp },
        :docile  => { :plus => :none,  :minus => :none  },
        :lax     => { :plus => :def,   :minus => :defsp },
        :quirky  => { :plus => :none,  :minus => :none  },
        :gentle  => { :plus => :defsp, :minus => :def   },
        :naive   => { :plus => :spe,   :minus => :defsp },
        :hasty   => { :plus => :spe,   :minus => :def   },
        :mild    => { :plus => :atksp, :minus => :def   },
        :modest  => { :plus => :atksp, :minus => :atk   },
        :relaxed => { :plus => :def,   :minus => :spe   },
        :quiet   => { :plus => :atksp, :minus => :spe   },
        :bashful => { :plus => :none,  :minus => :none  },
        :impish  => { :plus => :def,   :minus => :atksp },
        :lonely  => { :plus => :atk,   :minus => :def   },
        :serious => { :plus => :none,  :minus => :none  },
        :bold    => { :plus => :def,   :minus => :atk   },
        :timid   => { :plus => :spe,   :minus => :atk   },
        :sassy   => { :plus => :defsp, :minus => :spe   },
      }

      fields     = [ :hp, :atk, :def, :atksp, :defsp, :spe ]
      evs        = Hash[fields.zip evs]
      ivs        = Hash[fields.zip ivs]
      base_stats = Hash[fields.zip @base_stats]
      nature     = natures[nature.downcase.to_sym]

      [].tap { |stats|
        fields.each_with_index { |field|
          iv        = ivs[field].to_i
          ev        = evs[field].to_i
          base_stat = base_stats[field].to_i
          multipler = case field
            when nature[:plus]  then 1.1
            when nature[:minus] then 0.9
            else                     1
          end

          if field == :hp
            stats << (((iv + 2 * base_stat + ev / 4) * level / 100) + 10 + level).floor
          else
            stats << ((((iv + 2 * base_stat + ev / 4) * level / 100) + 5) * multipler).floor
          end
        }
      }
    end
  end
end
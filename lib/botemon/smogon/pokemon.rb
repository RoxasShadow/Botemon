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
    attr_accessor :name, :_name, :types, :tier, :abilities, :base_stats
    
    def to_s
      "Name: #{name}\nAbility: #{abilities.join(', ')}\nType: #{types.join(?/)}\nTier: #{tier}\nBase stats: #{base_stats.join(?/)}"
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
      }
    end
    
    def to_ary
      { 'name'       => name,
        '_name'      => _name,
        'types'      => types,
        'tier'       => tier,
        'abilities'  => abilities,
        'base_stats' => base_stats
      }
    end
  end
end
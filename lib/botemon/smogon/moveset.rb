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
  class Moveset
    attr_accessor :pokemon, :name, :tier, :item, :ability, :nature, :moves, :evs

    def initialize
      @item    = []
      @ability = []
      @nature  = []
      @moves   = []
    end
    
    def to_s
      "Item: #{item.join(' / ')}\nAbility: #{ability.join(' / ')}\nNature: #{nature.join(' / ')}\nMoves: #{''.tap { |s| moves.each { |move| s << move.join(' / ') + ', '}}[0..-3]}\nEVs: #{evs}"
    end
    
  end
end
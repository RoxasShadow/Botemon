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

class Pokedex
  def self.id2name(id)
    begin
      return Nokogiri::HTML(open("http://pokemondb.net/pokedex/#{id}")).xpath('//div[@class="navbar"]/h1')[0].text
    rescue
      return nil
    end
  end
   
  def self.get(name, storage)
    return nil if name == nil
    
    if storage.is_cached?(name)
      return storage.get name
    else
      pokemon = Smogon::Pokedex.get name
      storage.add pokemon
      storage.save
      return pokemon
    end
  end
end
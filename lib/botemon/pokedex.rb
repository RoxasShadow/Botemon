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
    return storage.get(name) if storage.is_cached? name
    
    begin
      url = URI::encode "http://www.smogon.com/bw/pokemon/#{name}"
      
      pokemon = Pokemon.new
      smogon = Nokogiri::HTML(open(url))
    rescue
      return nil
    end
    
    pokemon.name  = smogon.xpath('//td[@class="header"]/h1').last.text
    pokemon._name = pokemon.name.downcase
    
    smogon.xpath('//table[@class="info"]/tr/td/a')[0..-2].each { |type|
      (pokemon.types ||= []) << type.text
    }
    
    pokemon.tier = smogon.xpath('//table[@class="info"]/tr/td/a').last.text
    
    smogon.xpath('//td[@class="ability"]/dl/dt/a').each { |ability|
      (pokemon.abilities ||= []) << ability.text
    }
    
    begin
      (pokemon.abilities ||= []) << smogon.xpath('//td[@class="ability"]/dl/dt/em/a').first.text
    rescue
      # No dream world ability :(
    end
    
    smogon.xpath('//td[@class="bar"]').each { |base_stat|
      (pokemon.base_stats ||= []) << base_stat.text.strip
    }
    
    storage.add pokemon
    storage.save
    return pokemon
  end
end
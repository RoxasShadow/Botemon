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

class Movedex 
  def self.id2name(id)
    begin
      return Nokogiri::HTML(open("http://pokemondb.net/pokedex/#{id}")).xpath('//div[@class="navbar"]/h1')[0].text
    rescue
      return nil
    end
  end
  
  def self.tiers
    ['uber', 'ou', 'bl', 'uu', 'bl2', 'ru', 'nu', 'lc', 'limbo', 'nfe']
  end
   
  def self.get(name, tier)
    return nil if name == nil || tier == nil || !Movedex.tiers.include?(tier.downcase)
    
    begin
      url = URI::encode "http://www.smogon.com/bw/pokemon/#{name}/#{tier}"
      
      moveset = Moveset.new
      smogon = Nokogiri::HTML(open(url))
    rescue
      return nil
    end
    
    moveset.pokemon = smogon.xpath('//td[@class="header"]/h1').last.text
    moveset.name    = smogon.xpath('//td[@class="name"]/h2').first.text
    moveset.tier    = smogon.xpath('//table[@class="info"]/tr/td/a').last.text
    
    section = smogon.xpath('//table[@class="info strategyheader"]/tr')[1].children
    moveset.item    = section[2].text.gsub(/\n/m, '').gsub(/\t/m, '').strip
    moveset.ability = section[4].text.gsub(/\n/m, '').gsub(/\t/m, '').strip
    moveset.nature  = section[6].text.gsub(/\n/m, '').gsub(/\t/m, '').strip
    
    section = smogon.xpath('//table[@class="info moveset"]/tr')[1].children
    moveset.moves   = section[0].text.strip.gsub(/\n/, '').gsub(/~/, ',').gsub(/\s\s/, '')[2..-1]
    moveset.evs     = section[2].text.strip
    
    return moveset
  end
end
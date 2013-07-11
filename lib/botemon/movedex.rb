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
   
  def self.get(name, tier)
    return nil if name == nil || tier == nil
    
    begin
      url = URI::encode "http://www.smogon.com/bw/pokemon/#{name}/#{tier}"
      
      smogon = Nokogiri::HTML(open(url))
    rescue
      return nil
    end
    
    movesets = []
    
    smogon.xpath('//table[@class="info strategyheader"]').each { |s|
      moveset = Moveset.new
      
      moveset.pokemon = smogon.xpath('//tr/td[@class="header"]/h1').last.text
      moveset.name    = s.xpath('tr')[1].xpath('td[@class="name"]/h2').first.text
      moveset.tier    = smogon.xpath('//div[@id="content_wrapper"]/ul/li/strong').last.text
      
      s.xpath('.//a').each { |a|
        (moveset.item    ||= []) << a.text if a['href'].include? '/items/'
        (moveset.ability ||= []) << a.text if a['href'].include? '/abilities/'
        (moveset.nature  ||= []) << a.text if a['href'].include? '/natures/'
      }
      
      movesets << moveset
    }
    
    i = 0
    smogon.xpath('//table[@class="info moveset"]').each { |s|
      moveset = movesets[i]
      
      continue = false
      s.xpath('.//td')[0].text.each_line { |a|
        a = a.gsub(/\n?/, '').strip
        if a == ?~
          continue = false
        elsif a == ?/
          continue = true
        elsif a.empty?
          next
        elsif a != ?~ && a != ?/
          if continue
            moveset.moves.last << a
          else
            (moveset.moves ||= []) << [a]
          end
          continue = false
        end
      }
      
      moveset.evs = s.xpath('.//td').last.text.strip
      
      movesets[i] = moveset
      i += 1
    }
   
    return movesets
  end
end
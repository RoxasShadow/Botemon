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

class Storage
  attr_accessor :file, :db
  
  def initialize(file)
    @file = file
    @db = [].tap { |db|
      (File.exists?(file) ? JSON.load(File.read(file)) : []).each { |p| db << Smogon::Pokemon.to_pokemon(p) }
    }
  end
  
  def is_cached?(name)
    return @db.select { |p| p._name == name.downcase }.any?
  end
  alias :include? :is_cached?
  
  def get(name)
    return @db.select { |p| p._name == name.downcase }.first
  end
  
  def get_all
    @db
  end
  alias :dump :get_all
  
  def add(pokemon)
    return unless pokemon
    @db << pokemon unless is_cached?(pokemon.name)
  end
  alias :put :add
  
  def save
    [].tap { |ary|
      @db.each { |p| ary << p.to_ary }
      File.open(@file, 'wb') { |f|
        f.write JSON.dump(ary)
      }
    }
  end
end
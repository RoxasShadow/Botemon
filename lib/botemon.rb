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

require 'open-uri'
require 'json'

require 'cinch'
require 'cinch/plugins/login'
require 'smogon'

require 'botemon/string'
require 'botemon/smogon/pokemon'
require 'botemon/smogon/moveset'
require 'botemon/storage'
require 'botemon/pokedex'
require 'botemon/abilitydex'
require 'botemon/itemdex'
require 'botemon/movedex'
require 'botemon/movesetdex'

require 'botemon/version'

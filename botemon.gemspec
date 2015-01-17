Kernel.load 'lib/botemon/version.rb'

Gem::Specification.new do |s|
	s.name          = 'botemon'
	s.version       = Botemon::VERSION
	s.author        = 'Giovanni Capuano'
	s.email         = 'webmaster@giovannicapuano.net'
	s.homepage      = 'http://www.giovannicapuano.net'
	s.platform      = Gem::Platform::RUBY
	s.summary       = 'IRC bot for Pokéfags.'
	s.description   = 'IRC bot for Pokéfags with (Poké|Ability|Item|Move|Moveset)dex and a trivia game.'
 	s.licenses      = 'GPL-3'

	s.require_paths = ['lib']
	s.files         = Dir.glob('lib/**/*.rb')
 	s.executables   = 'botemon'

	s.add_dependency 'cinch'
	s.add_dependency 'cinch-login'
	s.add_dependency 'cinch-colorize'
	s.add_dependency 'smogon'
end

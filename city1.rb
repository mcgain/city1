require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'matrix'

Hasu.load "game/main.rb"
Hasu.load "game/buildings_generator.rb"
Hasu.load "game/point.rb"
Hasu.load "game/roads_generator.rb"

Game.run unless /-rcity/ =~ ARGV[0]

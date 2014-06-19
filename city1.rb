require 'rubygems'
require 'bundler/setup'
Bundler.require

Hasu.load "game/main.rb"
Hasu.load "game/buildings_generator.rb"
Hasu.load "game/point.rb"
Hasu.load "game/roads_generator.rb"

Game.run

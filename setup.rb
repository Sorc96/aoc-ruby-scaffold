# frozen_string_literal: true

require 'zeitwerk'

CodeLoader = Zeitwerk::Loader.new.tap do |loader|
  loader.push_dir("#{__dir__}/lib")
  loader.enable_reloading
  loader.setup
end

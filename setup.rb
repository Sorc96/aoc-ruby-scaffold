# frozen_string_literal: true

require 'zeitwerk'

Zeitwerk::Loader.new.tap do |loader|
  loader.push_dir(File.join(__dir__, 'lib'))
  loader.setup
end

# frozen_string_literal: true

require_relative 'notebook_handler'
require_relative 'person'
require 'psych'

# Notebook
module Notebook
  # Input methods
  module Input
    DATA_FILE = File.expand_path('../data/data.yaml', __dir__)

    # to print message use message w/out '\n'
    def self.num_input(message)
      loop do
        print message.to_s
        line = gets

        return nil if line.nil?

        return Float(line.strip)
      rescue ArgumentError => _exception
        puts 'incorrect input, try again'
      end
    end

    def self.string_input(message)
      loop do
        print message.to_s
        line = gets

        if line.nil?
          puts 'This field cannot be empty!'
          next
        end
        line = line.strip
        if line.empty?
          puts 'This field cannot be empty!'
          next
        end
        return line
      end
    end

    def self.phone_input(message)
      loop do
        line = string_input(message)
        # delete all spaces in the string
        line.gsub!(/\s+/, '')

        # parse only valid phone numbers
        # (+ or NUMBER)NUMBERS
        return line if line.match?(/^([+]|\d)\d+$/)

        puts 'Invalid number, try again'
      end
    end

    def self.read_file
      notebook = Notebook.new
      all_info = File.exist?(DATA_FILE) ? Psych.load_file(DATA_FILE) : notebook

      required_keys = %w[name surname patronymic cell\ phone home\ phone address status]
      all_info.each do |person|
        return notebook if person.keys != required_keys

        notebook.add(Person.new(*person.fetch_values(*required_keys)))
      end
      notebook
    rescue Psych::SyntaxError => e
      puts "File cannot be loaded: #{e}"
      notebook
    end

    def self.save(notebook)
      # p Psych.dump(notebook)
      # File.open(DATA_FILE, 'w') do |file|
      #  file.write(Psych.dump(notebook))
      # end
    end
  end
end

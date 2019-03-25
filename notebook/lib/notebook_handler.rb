# frozen_string_literal: true

module Notebook
  # incapsulates notebook
  class Notebook
    def initialize
      @list = []
    end

    def add(person)
      @list.push(person)
    end

    def remove(person)
      @list.delete(person)
    end

    def change_address(name, surname, m_name, new_address)
      @list.each do |p|
        next unless p.name == name && p.surname == surname && p.m_name == m_name

        p.address = new_address
      end
    end

    def change_phone(name, surname, m_name, new_phone)
      @list.each do |p|
        next unless p.name == name && p.surname == surname && p.m_name == m_name

        p.cell_phone = new_phone
      end
    end

    def sort
      @list.sort_by! { |person| yield(person) }
    end

    def event(status)
      invited = []
      @list.each do |person|
        invited.push(person) if person.status == status
      end
      invited
    end

    def each
      @list.each { |person| yield(person) }
    end
  end
end

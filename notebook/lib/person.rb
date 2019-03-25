# frozen_string_literal: true

module Notebook
  # stores info about one person
  class Person
    attr_reader :name, :surname, :m_name, :cell_phone,
                :home_phone, :address, :status
    attr_writer :cell_phone, :address

    def initialize(name, surname, m_name, cell_phone,
                   home_phone, address, status)
      @name = name
      @surname = surname
      @m_name = m_name
      @cell_phone = cell_phone
      @home_phone = home_phone
      @address = address
      @status = status
    end

    def ==(other)
      @name == other.name &&
        @surname == other.surname &&
        @m_name == other.m_name
    end

    def to_s
      str = "\nName: #{@name}\nSurname: #{@surname}\nMiddle name: #{@m_name}" \
            "\nCell phone: #{@cell_phone}\nHome phone: #{@home_phone}" \
            "\nAddress: #{@address}\nStatus: #{@status}"
      str
    end
  end
end

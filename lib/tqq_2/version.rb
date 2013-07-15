# -*- encoding: utf-8 -*-
module TqqOAuth2
  
  class Version
    MAJOR = 0 unless defined? MAJOR
    MINOR = 1 unless defined? MINOR
    PATCH = 4 unless defined? PATCH
    PRE = nil unless defined? PRE

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end

    end

  end
end
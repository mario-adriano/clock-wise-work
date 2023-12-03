# typed: false
# frozen_string_literal: true

require "sorbet-runtime"

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  extend T::Sig
end

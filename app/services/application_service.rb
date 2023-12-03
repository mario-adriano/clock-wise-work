# typed: strict
# frozen_string_literal: true

class ApplicationService
  extend T::Sig

  sig { params(params: T.nilable(ActionController::Parameters), entity: T.nilable(ApplicationRecord)).void }
  def initialize(params, entity)
    @params = params
    @entity = entity
  end

  class << self
    extend T::Sig

    sig do
      params(params: T.nilable(ActionController::Parameters), entity: T.nilable(ApplicationRecord)).returns(T.untyped)
    end
    def call(params = nil, entity = nil)
      T.unsafe(self).new(params, entity).call
    end
  end
end

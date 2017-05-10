require 'orderable2/orderable_helper'

module Orderable2
  class Railtie < Rails::Railtie
    initializer "orderable2.orderable_helper" do
      ActiveSupport.on_load(:action_view) do
        include OrderableHelper
      end
    end
  end
end

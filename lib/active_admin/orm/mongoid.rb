# Mongoid-specific plugins should be required here

# require 'active_admin/mongoid/comments'
require 'active_admin/orm/mongoid/adaptor'
require 'active_admin/orm/mongoid/filter_form_builder'
require 'active_admin/orm/mongoid/document'
require 'active_admin/orm/mongoid/criteria'

require 'active_admin/orm/mongoid/order_clause'
require 'active_admin/orm/mongoid/filters/formtastic_addons'

module ActiveAdmin
  module Orm
    module Mongoid
      class Railtie < ::Rails::Railtie
        config.after_initialize do
          I18n.backend.reload!
        end
      end
    end
  end

  # class << self
  #   alias setup_without_mongoid setup
  #
  #   # Load monkey patches *after* the setup process
  #   def setup *args, &block
  #     setup_without_mongoid *args, &block
  #
  #   end
  # end
end

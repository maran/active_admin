require 'active_admin/comments/namespace_helper'
# ActiveAdmin::Application.allow_comments = false

module ActiveAdmin
  module Orm
    module Mongoid
      module Comments

        module NamespaceHelper
          def comments?
            false
          end
        end

      end
    end
  end
end

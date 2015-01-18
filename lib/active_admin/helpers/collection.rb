module ActiveAdmin
  module Helpers
    module Collection
      # 1. removes `select` and `order` to prevent invalid SQL
      # 2. correctly handles the Hash returned when `group by` is used
      def collection_size(c = collection)
        if collection.first.present?
          if collection.first.class.included_modules.include?(Mongoid::Document)
            if(not c.empty? and c.first.class.included_modules.include?(Mongoid::Document))
              if c.first.class.embedded?
                 c.count
              else
                c.count(true)
              end
            else
              c.count
            end
          else
            c = c.except :select, :order

            c.group_values.present? ? c.count.count : c.count
          end
        else
          0
        end
      end

      def collection_is_empty?(c = collection)
        collection_size(c) == 0
      end
    end
  end
end

module ActiveAdmin
  module Inputs
    class FilterBooleanInput < ::Formtastic::Inputs::BooleanInput
      include FilterBase

      def to_html
        input_wrapping do
          [ label_html,
            check_box_html
          ].join("\n").html_safe
        end
      end

      def check_box_html
        template.check_box_tag("#{object_name}[#{method}]", checked_value, checked?, input_html_options)
      end

      def search_method
        method.to_s.match(search_conditions) ? method : "#{method}_eq"
      end

      def checked?
        object && boolean_checked?(object.send(search_method), checked_value)
      end

      def input_html_options
        { :name => "q[#{search_method}]" }
      end

      def search_conditions
        /true|false|present|blank|null|not_null/
      end

    end
  end
end

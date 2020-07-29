# frozen_string_literal: true
# Modified from: https://github.com/rails/rails/blob/master/activerecord/lib/active_record/connection_adapters/postgresql/oid/point.rb

module Types
  class GeoType < ActiveRecord::Type::Value
    include ActiveModel::Type::Helpers::Mutable

    LatLng = Struct.new(:lat, :lng)

    def type
      :point
    end

    def cast(value)
      case value
      when ActiveSupport::HashWithIndifferentAccess, Hash
        value = value.with_indifferent_access
        build_point(value['lat'], value['lng'])
      when ::String
        return if value.blank?
        value = value[1...-1] if value.start_with?("(") && value.end_with?(")")
        lat, lng = value.split(",")
        build_point(lat, lng)
      when ::Array
        build_point(*value)
      else
        value
      end
    end

    def serialize(value)
      case value
      when Types::GeoType::LatLng
        "(#{number_for_point(value.lat)},#{number_for_point(value.lng)})"
      when ::Array
        serialize(build_point(*value))
      else
        super
      end
    end

    def type_cast_for_schema(value)
      if ActiveRecord::LatLng === value
        [value.x, value.y]
      else
        super
      end
    end

    private

      def number_for_point(number)
        number.to_s.delete_suffix(".0")
      end

      def build_point(lat, lng)
        LatLng.new(Float(lat), Float(lng))
      end
  end
end

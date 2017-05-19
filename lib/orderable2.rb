require 'orderable2/railtie' if defined?(Rails)

module Orderable2
  extend ActiveSupport::Concern

  def sort_order(order = nil, options = {})
    calculate_order(order).map do |column,  direction|
      t = "#{column} #{direction}"
      t += ' NULLS FIRST' if options.has_key?(column.to_sym) && options[column.to_sym].include?(:nulls_first)
      t += ' NULLS LAST' if options.has_key?(column.to_sym) && options[column.to_sym].include?(:nulls_last)
      t
    end.join(' ')
  end

  private

  def calculate_order(default_order = nil)
    if params[:order]
      params[:order].split(',').map do |stmt|
        stmt_array = stmt.split(':')
        { stmt_array.first.to_sym => stmt_array.last.to_sym }
      end.reduce({}, :merge)
    else
      default_order || { id: :asc }
    end
  end
end

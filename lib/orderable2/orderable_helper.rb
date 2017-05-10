module OrderableHelper
  def orderable_for(attr, options = {})
    label = I18n.t("orderable.#{attr}", default: attr.to_s.humanize)
    sort_params = params[:order] || ''

    this_clauses, other_clauses = sort_params.split(',').partition do |sort_param|
      sort_param.split(':').first == attr.to_s
    end

    this_clause = this_clauses.first
    this_clause ||= ''

    direction = this_clause.split(':').last

    if direction.nil?
      arrow = ''
      next_dir = "#{attr}:asc"
    elsif direction == 'asc'
      arrow = '&uarr;'
      next_dir = "#{attr}:desc"
    elsif direction == 'desc'
      arrow = '&darr;'
      next_dir = ''
    else
      raise StandardError, direction
    end
    label = label + ' ' + arrow

    if options[:single]
      new_order = [next_dir]
    else
      new_order = other_clauses + [next_dir]
    end

    link_to label.html_safe, request.query_parameters.merge(order: new_order.join(','))
  end
end

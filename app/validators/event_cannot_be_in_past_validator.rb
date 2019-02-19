class EventCannotBeInPastValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors.add(attribute, (options[:message] || "cannot take place in the past ")) if in_past(record)
  end

  private

  def in_past(record)
    the_start = record.started_at
    the_start.past?
  end

end
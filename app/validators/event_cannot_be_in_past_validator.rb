class EventCannotBeInPastValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors.add(attribute, (options[:message] || " can't be before the start date. Pick a date after ")) if in_past(record)
  end

  private

  def in_past(record)
    the_end = record.ended_at
    the_start = record.started_at
    the_end.past? || the_start.past?
  end

end
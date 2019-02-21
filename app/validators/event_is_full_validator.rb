class EventIsFullValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return if record.event.blank?
    record.errors.add(attribute, " event is full") if record.event.users.size > record.event.capacity
    return if record.event.capacity.blank?
    record.errors.add(attribute, (options[:message] || "the users amount cannot excess capicity ")) if is_capacity_full(record)
  end

  private

  def is_capacity_full(record)
    return if record.event.blank?
  end
end



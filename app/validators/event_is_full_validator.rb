class EventIsFullValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return if record.capacity.blank?
    record.errors.add(attribute, (options[:message] || "the users amount cannot excess capicity ")) if is_capacity_full(record)
  end

  private
  def is_capacity_full(record)
    (record.users.size) >= (record.capacity)
  end
end
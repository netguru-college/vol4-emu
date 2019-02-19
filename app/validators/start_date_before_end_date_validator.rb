class StartDateBeforeEndDateValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    the_end = record.ended_at
    the_start = record.started_at



    unless the_end >= the_start
      record.errors.add attribute, (options[:message] || " can't be before the start date. Pick a date after #{the_start.strftime("%d/%m/%y")}!")
    end
  end

end
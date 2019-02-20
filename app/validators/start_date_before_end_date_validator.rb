class StartDateBeforeEndDateValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    the_end = record.ended_at
    the_start = record.started_at


    unless the_end > the_start
      record.errors.add attribute, (options[:message] || " cannot be before #{the_end.strftime("%d/%m/%y/%H:%M")}!")
    end
  end

end
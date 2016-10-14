class DateRangeValidator < ActiveModel::Validator
  def validate(record)
    start_date = record.send('start_date')
    end_date = record.send('end_date')
    return if end_date.blank?
    record.errors.add(:start_date, 'invalid_date_range') if start_date.blank? || (end_date < start_date)
  end
end

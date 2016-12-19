require 'csv'

namespace :seed do
  desc 'Import Courses from a csv file'
  task import_courses: :environment do
    load_csv(true) do |row|
      row['teacher'] = Teacher.find_or_create_by(name: row['teacher'])
      Course.create(row.to_hash)
    end
  end

  private

  def csv_file
    ARGV.each { |a| task a.to_sym }
    path = ARGV[1]
    @csv_file ||= File.open(path, 'r')
  end

  def load_csv(headers)
    csv = CSV.new(csv_file, headers: headers)
    csv.lazy.each { |row| yield row }
  end
end

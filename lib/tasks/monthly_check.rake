# require_relative '../lob_export.rb'

namespace :db do
  desc "the best 75 lines of code ever written"
  # include LobExport
  task :monthly_check => :environment do
    puts "running monthly check"
      LobExport
    # if Date.today.day == 1
    # end

  end
end


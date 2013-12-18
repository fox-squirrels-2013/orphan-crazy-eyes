# require_relative '../lob_export.rb'

namespace :db do
  desc "the best 75 lines of code ever written"
  task :monthly_check => :environment do
    puts "running monthly check"
    # if Date.today.day == 1
      LobExport
    # end
  end
end


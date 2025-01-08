module Sinatra
  module RetailerApp
    module Routing
      module SampleRoutes
        def self.registered(app)
          app.get '/sample' do
            # Executes the SQL query and stores the results
            
            results = ActiveRecord::Base.connection.exec_query("SELECT * FROM testing")
            ActiveRecord::Base.connection.close
            # Convert the results into an array of hashes for easy display
            formatted_results = results.map { |row| row }

            # Print the formatted results for debugging
            puts formatted_results

            # Return a response that includes the results
            "Sample route working! Results: #{formatted_results.inspect}"
          end
        end
      end
    end
  end
end

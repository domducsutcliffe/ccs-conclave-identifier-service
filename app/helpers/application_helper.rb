module ApplicationHelper
  class IdentifiersHelper
    def self.generate_id
      "#{format('%03d', (rand * 1000))}#{format('%03d', ((Time.now.to_f - Time.now.to_i) * 1000))}".to_i
    end
  end
end

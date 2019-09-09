class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :thumb_image, :main_image  

    def self.angular
        where(subtitle: "Angular")
    end

    def self.rubyonrails
        where(subtitle: "Ruby on Rails")
    end

    scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
end
    
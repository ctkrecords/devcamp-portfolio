class Portfolio < ApplicationRecord
    includes Placeholder
    validates_presence_of :title, :body, :thumb_image, :main_image  

    def self.angular
        where(subtitle: "Angular")
    end

    def self.rubyonrails
        where(subtitle: "Ruby on Rails")
    end

    scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end
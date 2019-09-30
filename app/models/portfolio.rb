class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }
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

    def self.by_position
        order("position ASC")
    end
end
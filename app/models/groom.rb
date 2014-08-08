class Groom < Attendee

  	before_save :default_values

    def is_groom?
        return true
    end

private

  def default_values
    self.description ||= 'El Novio'
  end
end
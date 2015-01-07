class Guest < Attendee

	self.per_page = 50

    def is_guest?
        return true
    end
end
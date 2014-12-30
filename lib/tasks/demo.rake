namespace :demo do
  desc "Removes demo data"
  task remove: :environment do
  	begin
  		Wedding.friendly.find('demo').destroy
    rescue ActiveRecord::RecordNotFound => e
    	puts "Demo wedding not found"
    end
  end

  desc "Loads demo data"
  task load: :environment do
  	demo_data = YAML.load_file('db/demo_data.yml')
  	wedding = Wedding.new(demo_data["wedding"])
  	wedding.slug = "demo"
  	wedding.save

  	save_attendee(Groom, demo_data["groom"], wedding)	

  	save_attendee(Bride, demo_data["bride"], wedding)	

  	demo_data["guests"].each do |g|
	    save_attendee(Guest, g, wedding)
	end

	save_events(wedding, demo_data["events"])
  end

  desc "Sets up demo data"
  task setup: [:remove, :load]

  def prepare_for_paperclip(attributes, attr_name)
  	if attributes.has_key? attr_name
  		attributes[attr_name] = File.open Rails.root.join('lib/assets/demo/images', attributes[attr_name])
  	end
  end

  def save_attendee(model_class, data, wedding)
  	attributes = data["attributes"]
  	prepare_for_paperclip(attributes, "avatar")
  	attendee = model_class.new(attributes)
  	attendee.wedding = wedding
  	attendee.save
  	if data.has_key? "messages"
  		save_messages(attendee, data["messages"])
  	end
  	if data.has_key? "pictures"
  		save_pictures(attendee, data["pictures"])
  	end
  	if data.has_key? "songs"
  		save_songs(wedding, attendee, data["songs"])
  	end
  end

  def save_messages(attendee, messages)
  	messages.each do |message|
  		m = Message.new(message)
  		m.attendee = attendee
  		m.save
        m.create_activity :create, owner: m.attendee if (attendee.is_groom? or attendee.is_bride?)
  	end
  end

  def save_pictures(attendee, pictures)
  	pictures.each do |picture|
  		prepare_for_paperclip(picture, "image")
  		p = Picture.new(picture)
  		p.attendee = attendee
  		p.save
        p.create_activity :create, owner: p.attendee if (attendee.is_groom? or attendee.is_bride?)
  	end
  end

  def save_events(wedding, events)
  	events.each do |event|
  		prepare_for_paperclip(event, "image")
  		e = Event.new(event)
  		e.wedding = wedding
  		e.save
  	end
  end

  def save_songs(wedding, attendee, songs)
  	songs.each do |song|
  		s = Song.new(song)
  		s.wedding = wedding
  		s.attendee = attendee
  		s.save
  	end
  end

end

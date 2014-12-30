module NotificationsHelper

	def notification_text(notification)
		sentence_beginning = "Nuevo comentario en"
		if notification.resource_type.to_sym == :Message
			resource_type = link_to("mensaje", notification)
			article = "un"
			sentence_ending = "en el que has comentado"
		else
			resource_type = link_to("foto", notification)
			article = "una"
			sentence_ending = "en la que has comentado"
		end
		if notification.key.to_sym == :owned
			text = "#{sentence_beginning} tu #{resource_type}"
		else
			text = "#{sentence_beginning} #{article} #{resource_type} #{sentence_ending}"
		end
		return text
	end
end

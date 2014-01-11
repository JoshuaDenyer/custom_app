module ApplicationHelper

	#returns title depending on the page
	def full_title(page_title)
		base_title = "Custom App"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end

class ContactsController < ApplicationController


	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			flash[:success] = "Email Sent!"
			redirect_to :back
		else
			flash[:error] = "Error sending email."
			redirect_to :back
		end
	end


	private

		def contact_params
			params.require(:contact).permit(:name, :email, :comments)
		end
	

end


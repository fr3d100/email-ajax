class EmailsController < ApplicationController
  def index
  	@emails = Email.order('id')
  	@numUnread = Email.where(read: false).length
  end

  def update
  	@email = Email.find(params['id']);
  	if @email.read == false
  		 @email.update(read: true)
  	end

  	respond_to do |format|
  		format.html {redirect_to emails_path} 
  		format.js
  	end
  end

  def edit
  	@email = Email.find(params['id']);
  end

  def destroy
  	@email = Email.find(params['id'])

 		respond_to do |format|
 			format.html {redirect_to emails_path}
 			format.js
 		end
	 #@email.destroy
	end

end

class GroupsController < ApplicationController

before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy] 

	def index

 if user_signed_in?

      @groups = Group.where( :user_id => current_user.id)

   else

redirect_to login_path


    end

    end

  

    def show

      

    	 @group = Group.find(params[:id])
       @posts = @group.posts 
		
    end

   	def new
   		@group = Group.new

    end

    def edit

	  @group = current_user.groups.find(params[:id])

    end


	def create

		 @group = current_user.groups.new(group_params)

   if @group.save
     redirect_to groups_path
   else
     render :new
   end

    end

    def update

    @group = current_user.groups.find(params[:id])

   if @group.update(group_params)
     redirect_to groups_path, notice: "修改單字表成功"
   else
     render :edit
   end
		
    end



    def destroy 
      @group = current_user.groups.find(params[:id])
      @group.destroy
      redirect_to groups_path, alert: "單字表已刪除"

    end


    def test

       @group = current_user.groups.find(params[:id])
        @posts = @group.posts

        @tests = @posts

     end


def quiz

@group = current_user.groups.find(params[:id])
        @posts = @group.posts

        @quizs = @posts


end




 private
 
 def group_params 
   params.require(:group).permit(:title)
 end

 


end

class CommentsController < ApplicationController
        before_action :authorize_request, except: %i[index show search]
        before_action :set_post, only: [:show, :update, :destroy]
      
        def search
          @Comments = Comment.all.where(name: params[ :post_name])
          render json: { message: "ok", comments: @comments }
        end
      
          def index
              @Comments = Comment.all
              render json: { message: "ok", comments: @comments }
            end
          
            def show
              begin
                @comment = Comment.find(params[:id])
                render json: { message: "ok", comment: @comment }
              rescue ActiveRecord::RecordNotFound
                render json: { message: 'no comment matches that ID' }, status: 404
              rescue StandardError => e
                render json: { message: e.to_s }, status: 500
              end
            end
          
        
            # POST /comments
            def create
              @comment = @current_user.comments.build(comment_params)
                # @comment = Comment.new(comment_params)
              if @comment.save
                render json: @comment, status: :created, location: @comment
              else
                render json: @comment.errors, status: :unprocessable_entity
              end
            end
          
            # PATCH/PUT /comments
            def update
              if @comment.update(comment_params)
                render json: @comment
              else
                render json: @comment.errors, status: :unprocessable_entity
              end
            end
          
            # DELETE /comments/1
            def destroy
              @comment.destroy
            end
          
            private
      
              def set_post
                @comment = Comment.find(params[:id])
              end
      
              def comment_params
                params.require(:comment).permit(:name, :maker, :effect_subtype, :notable_users, :songs_used_on, :photo)
              end

end

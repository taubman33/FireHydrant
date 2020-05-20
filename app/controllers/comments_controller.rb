class CommentsController < ApplicationController
        before_action :authorize_request, except: %i[index show search]
        before_action :set_post, only: [:show, :update, :destroy]
      
        def search
          @Comments = Post.all.where(name: params[ :post_name])
          render json: { message: "ok", posts: @posts }
        end
      
          def index
              @Comments = Post.all
              render json: { message: "ok", posts: @posts }
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
          
        
            # POST /posts
            def create
              @comment = @current_user.posts.build(post_params)
                # @comment = Post.new(post_params)
              if @comment.save
                render json: @comment, status: :created, location: @comment
              else
                render json: @comment.errors, status: :unprocessable_entity
              end
            end
          
            # PATCH/PUT /posts/1
            def update
              if @comment.update(post_params)
                render json: @comment
              else
                render json: @comment.errors, status: :unprocessable_entity
              end
            end
          
            # DELETE /posts/1
            def destroy
              @comment.destroy
            end
          
            private
              # Use callbacks to share common setup or constraints between actions.
              def set_post
                @comment = Comment.find(params[:id])
              end
          
              # Only allow a trusted parameter "white list" through.
              def post_params
                params.require(:comment).permit(:name, :maker, :effect_subtype, :notable_users, :songs_used_on, :photo)
              end

end

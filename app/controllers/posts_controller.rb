class PostsController < ApplicationController
    before_action :authorize_request, except: %i[index show search]
    before_action :set_post, only: [:show, :update, :destroy]
  
    def search
      @Posts = Post.all.where(name: params[ :post_name])
      render json: { message: "ok", posts: @posts }
    end
  
      def index
          @Posts = Post.all
          render json: { message: "ok", posts: @posts }
        end
      
        def show
          begin
            @post = Post.find(params[:id])
            render json: { message: "ok", post: @post }
          rescue ActiveRecord::RecordNotFound
            render json: { message: 'no post matches that ID' }, status: 404
          rescue StandardError => e
            render json: { message: e.to_s }, status: 500
          end
        end
      
    
        # POST /posts
        def create
          @post = @current_user.posts.build(post_params)
            # @post = Post.new(post_params)
          if @post.save
            render json: @post, status: :created, location: @post
          else
            render json: @post.errors, status: :unprocessable_entity
          end
        end
      
        # PATCH/PUT /posts/1
        def update
          if @post.update(post_params)
            render json: @post
          else
            render json: @post.errors, status: :unprocessable_entity
          end
        end
      
        # DELETE /posts/1
        def destroy
          @post.destroy
        end
      
        private
         
          def set_post
            @post = Post.find(params[:id])
          end
      
          def post_params
            params.require(:post).permit(:name, :maker, :effect_subtype, :notable_users, :songs_used_on, :photo)
          end
      end
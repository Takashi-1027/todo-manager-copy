class SeeksController < ApplicationController
  def seek
    @range = params[:range]
    @seek = params[:seek]
    @word  = params[:word]

      # タイトルの検索
      if @seek == "perfect_much"
        # @tasks = Task.all
        @tasks = current_user.tasks

        # 一つのフォームに複数の検索をかけるときに、次のソースのような書き方ができる。
        # Task.where(title: @word).or(priority: @word).or(status: @word)

        if @word.present?   #もし@wordが何もなかったら（完全一致）という意味になる。
          @tasks = @tasks.where("title like?", "#{@word}")
        end

      elsif @seek  == "forward_mach"
        @tasks = Task.where("title like?", "#{@word}%")
      elsif @seek  == "backward_mach"
        @tasks = Task.where("title like?", "%#{@word}")
      elsif @seek  == "pertical_mach"
        @tasks = Task.where("title like?", "%#{@word}%")
      else
        @tasks = Task.all
      end

      # 優先度の検索
      if params[:priority].present?
        @tasks = @tasks.where(priority: params[:priority])
      end

       # 進捗状況の検索
      if params[:status].present?
        @tasks = @tasks.where(status: params[:status])
      end
  end
end

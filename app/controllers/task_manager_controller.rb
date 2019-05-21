class TaskManagerController < ApplicationController
  def index
    redirect_to "/task_manager/0"
  end

  def create_list
    if params[:title] != ""
    list = List.create title: params[:title]
      redirect_to "/task_manager/#{list.id}"
    end
  end

  def list
    @lists = List.all
    @tasks = Task.all

    if not List.exists?(params[:id])
      @current_list = @lists.first
    else
      @current_list = List.find(params[:id])
    end
  end

  def delete_list
    list_to_del = params[:list]
    tasks_to_del = Task.where(list_id: list_to_del)

    if List.all.size == 1
      list_to_redirect = 0
    elsif list_to_del.to_i == List.first.id
      list_to_redirect = List.where("id > ?", list_to_del).first.id
    else
      list_to_redirect = List.where("id < ?", list_to_del).last.id
    end
    tasks_to_del.each do |task|
      task.destroy()
    end
    if List.exists?(id: list_to_del)
      List.find(list_to_del).destroy()
    end
    redirect_to "/task_manager/#{list_to_redirect}"
  end

  def create_task
    if params[:title] != ""
      Task.create title: params[:title], list_id: params[:id]
      redirect_to "/task_manager/#{params[:id]}"
  end
  end

  def delete_task
    if Task.exists?(id: params[:id])
    Task.find(params[:id]).destroy()
  end
    redirect_to "/task_manager/#{params[:list]}"
  end
end

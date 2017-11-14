module TasksHelper

  # 回傳編輯按鈕
  def task_edit_button(task)
    link_to 'EDIT', edit_task_path(task), class: 'btn btn-primary'
  end

  # 回傳刪除按鈕
  def task_delete_button(task)
    # 無法刪除的 todos 直接回傳 nil，不顯示按鈕
    return unless task.can_destroy?
    link_to 'DEL', task_path(task), class: 'btn btn-danger', method: :delete, data: { confirm: 'You sure to delete it ?' }
  end

end
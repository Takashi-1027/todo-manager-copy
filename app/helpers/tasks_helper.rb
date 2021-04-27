module TasksHelper
  def sort_form(sort)
    if sort.nil?
      [['優先度が高い順', 'priority'], ['進捗が進んでる順', 'status'], ['投稿が新しい順', 'new'], ['投稿が古い順', 'old']]
    elsif sort == "priority"
      [['優先度が高い順', 'priority'], ['進捗が進んでる順', 'status'], ['投稿が新しい順', 'new'], ['投稿が古い順', 'old']]
    elsif sort == "status"
      [['進捗が進んでる順', 'status'], ['優先度が高い順', 'priority'], ['投稿が新しい順', 'new'], ['投稿が古い順', 'old']]
    elsif sort == "new"
      [['投稿が新しい順', 'new'], ['優先度が高い順', 'priority'], ['進捗が進んでる順', 'status'], ['投稿が古い順', 'old']]
    elsif sort == "old"
      [['投稿が古い順', 'old'], ['優先度が高い順', 'priority'], ['進捗が進んでる順', 'status'], ['投稿が新しい順', 'new']]
    end
  end
end

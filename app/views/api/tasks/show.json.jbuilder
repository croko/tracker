json.cache!(@task) do
  json.id @task.id
  json.name @task.name
  json.description @task.description
  json.url url_for(api_task_url(@task))
  json.status @task.status
  json.user @task.user.name
  json.created @task.user.created_at

  json.comments @task.comments do |comment|
    json.author comment.user.name
    json.body comment.body
  end
end

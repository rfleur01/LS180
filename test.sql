SELECT lists.*, 
       COUNT(todos.id) AS todos_count,
       COUNT(NULLIF(todos.completed, true)) AS todos_remaining
FROM lists 
LEFT OUTER JOIN todos ON todos.list_id = lists.id 
GROUP BY lists.id;


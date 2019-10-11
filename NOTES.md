TaskWiz

Controllers

  SessionsController
  UsersController
  TasksController
  CommentsController

Models

  User
    has_many tasks
    has_many comments through tasks
  Task
    has_many comments
    has_many users through comments
  Comment
    belongs_to user
    belongs_to taks
Views

  users
    new
    edit
    show

  tasks
    new
    index
    edit
    show


Basic functions:

  [] A user can signup as an admin or a user
  [] A user should be able to view all their assigned tasks and edit them likely need a nested routes users/:id/tasks/:id & users/:id/tasks/:id/edit
  [] An admin can assign tasks to other users. 

To do's:

  [] Build routes
  [] Generate controllers
  [] Stub out methods
    [] 
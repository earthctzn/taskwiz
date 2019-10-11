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
  [] A user can log in with Google or Facebook
  [] A user should be able to view all their assigned tasks and edit their status. Will likely need nested routes users/:id/tasks/:id & users/:id/tasks/:id/edit
  [] A user can comment on their tasks
  [] Users can view and comment on eachothers tasks but only edit their own tasks.
  [] An admin can assign tasks to other users.
  [] An admin can view, create, edit and delete tasks and users

To do's:

  [] Build routes
    [] Build nested route for users/:id/tasks/:id & users/:id/tasks/:id/edit
    [] Build nested route for Admin flow
  [] Generate controllers
  [X] Add .env file and include in .gitignore
  [X] Add omniauth.rb file
  [] Stub out methods
    [] 
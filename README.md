# Specifications for the Rails Assessment

Specs:

 [x] Using Ruby on Rails for the project
 [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)

    Users have many comments and tasks have many comments

 [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

    Comments belong to users and tasks.

 [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

    Task has many users through comments and users have many commented_tasks through comments.

 [X] Include at least one manytomany relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

    Users have many commented tasks through comments tasks have many users through comments.

 [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

    Comments have content that is submitted by the user.

 [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    
    User, Task, Comment.

 [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  
    There are 5. You can see them in action in the nav bar once logged in. 

 [X] Include signup (how e.g. Devise)
 [X] Include login (how e.g. Devise)
 [X] Include logout (how e.g. Devise)
 [X] Include third party signup/login (how e.g. Devise/OmniAuth)
 [X] Include nested resource show or index (URL e.g. users/2/recipes)

    /users/4/tasks
    /users/4/tasks/1
    /users/4/tasks/1/edit

 [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

    /users/4/tasks/1/new
  
 [X] Include form display of validation errors (form URL e.g. /recipes/new)

    /users/new
    /users/tasks/new
    /tasks/comments/new

Confirm:
 [X] The application is pretty DRY
 [X] Limited logic in controllers
 [X] Views use helper methods if appropriate
 [X] Views use partials if appropriate

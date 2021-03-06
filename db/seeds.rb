
[ User, Ingredient, Recipe , IngredientRecipe ].each( &:delete_all )

puts 'Create users :'
%w( admin user1 user2 user3 ).each do |name|
  User.create( email: "#{name}@example.com", password: "#{name}password", name: "#{name}" )
end

puts 'Create a list of ingredients :'
%w( sugar salt eggs peppers olive oil ).each do |ingredient|
  Ingredient.create( name: ingredient )
end

puts 'Create a list of recipes :'
30.times do |n|
  Recipe.create( title: "recipe#{n}", description:"description for recipe #{n}")
end

puts 'add all recipes to the first user'
( Recipe.all ).each do |recipe|
  ( User.first ).recipes << recipe
end

puts 'add ingredients to first recipe:'
( Ingredient.all ).each do |ingredient|
  Recipe.first.ingredient_recipes.create( ingredient: ingredient, quantity: 2, unit: "Kg" )
end

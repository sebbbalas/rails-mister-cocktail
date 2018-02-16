module CocktailsHelper
  def cocktail_image_path_for(cocktail)
   cl_image_path cocktail.photo
  end
end

module MoviesSearchHelper
    def get_category_name(category_id)
        MovieCategory.find(category_id).name.capitalize
    end

    def get_badge_color(category_id)
        category_id == 1 ? 'pink' : 
        category_id == 2 ? 'secondary' : 
        category_id == 3 ? 'success' : 
        category_id == 4 ? 'primary' : 
        category_id == 5 ? 'warning text-dark' : 
        category_id == 6 ? 'purple' : 
        category_id == 7 ? 'dark' : 
        category_id == 8 ? 'info' : 'danger'
    end
end

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)

 new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"),:class => "ss")
  end
  
  def add_partial_to_form(name)
    new_form = render("form")
    link_to_function(name, h("show_new_form(this,\"#{escape_javascript(new_form)}\")"))
  end

  def show_form(name,f)
    show_form = render("show",:survey => f)
    link_to_function(name, h("show_details(this,\"#{escape_javascript(show_form)}\")"))
  end
end

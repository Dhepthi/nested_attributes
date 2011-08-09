function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
  show_submit_button();
}

function show_new_form(link, content) {

  $(link).parent().before(content);
  $(link).hide();
}

function show_details(link, content) {

  $(link).parent().after(content);
  $(".aa").hide();
}
function show_submit_button()
{
$(".ss").click(function(){
$(this).parent().next(".aa").show();
});

}


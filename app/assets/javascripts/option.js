$(document).ready(function(){
  var optionsCount = 0
  bindShowFormEvent('#add_item_button', '.new_item_form_div')
})

var bindShowFormEvent = function(showButton, form) {
  $('body').on('click', showButton, function(){
    $(this).siblings(form).slideToggle()
  })
}
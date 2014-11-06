$(document).ready(function(){
  var optionsCount = 0
  bindShowFormEvent('#add_item_button', '.new_item_form_div')
  bindChangeAddButtonEvent()
})

var bindShowFormEvent = function(showButton, form) {
  $('body').on('click', showButton, function(){
    $(this).siblings(form).slideToggle()
  })
}

var bindChangeAddButtonEvent = function() {
  $('body').on('click', '#add_option_button', function(){
    $(this).val('Add Another Option')
  })
}
$(document).ready(function(){
  bindNameSearchEvent()
})

var bindNameSearchEvent = function() {
  $('body').on('keyup', '.name_input', function(){
    var url = $(this).parents('.new_item').attr('action') + '/name_search'
    var search_term = $(this).val()
    $.ajax({
      url: url,
      method: 'GET',
      data: search_term
    })
    .done(function(){
      console.log('success')
    })
    .fail(function(){
      console.log('fail')
    })
  })
}
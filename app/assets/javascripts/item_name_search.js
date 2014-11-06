$(document).ready(function(){
  bindNameSearchEvent()
  bindChooseResultEvent()
  bindCancelSearchEvent()
})

var bindNameSearchEvent = function() {
  $('body').on('click', '.search_button', function(e){
    e.preventDefault()
    var searchButton = $(this)
    var url = $(this).parents('.new_item').attr('action') + '/name_search'
    var search_term = $(this).siblings('input').val()
    var type = $(this).parents('.new_item_form_div').find('#item_category').val()
    $.ajax({
      url: url,
      method: 'GET',
      data: {search_term: search_term, type: type}
    })
    .done(function(data){
      searchButton.siblings('.results').slideUp( function(){
        searchButton.siblings('.results').empty()
        searchButton.siblings('.results').append(data)
      })
      searchButton.siblings('.results').slideDown()
    })
    .fail(function(){
      console.log('fail')
    })
  })
}

var bindChooseResultEvent = function() {
  $('body').on('click', '.search_result', function(){
    var name = $(this).children('.result_name').text()
    var abv = $(this).children('.result_abv').text().replace(' ', '').replace('% abv', '')
    $(this).parents('.new_item_form_div').find('.name_input').val(name).effect('highlight', {color: '#a3aac6'}, 500)
    $(this).parents('.new_item_form_div').find('.item_abv').val(parseFloat(abv)).effect('highlight', {color: '#a3aac6'}, 1000, function(){
        $(this).parents('.new_item_form_div').find('.results').slideUp()
    })
  })
}

var bindCancelSearchEvent = function() {
  $('body').on('click', '.cancel_search', function() {
    $(this).parent().slideUp()
  })
}
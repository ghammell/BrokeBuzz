$(document).ready(function(){
  bindNameSearchEvent()
  bindChooseResultEvent()
})

var bindNameSearchEvent = function() {
  $('body').on('click', '.search_button', function(e){
    e.preventDefault()
    var searchButton = $(this)
    var url = $(this).parents('.new_item').attr('action') + '/name_search'
    var search_term = $(this).siblings('input').val()
    var type = $(this).parents().find('#item_category').val()
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
    $(this).parents().find('.name_input').val(name).effect('highlight', {color: '#a3aac6'}, 500)
    $(this).parents().find('.item_abv').val(parseFloat(abv)).effect('highlight', {color: '#a3aac6'}, 1000, function(){
        $(this).parents().find('.results').slideUp()
    })
  })
}
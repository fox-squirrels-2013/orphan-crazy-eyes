$(document).ready(function(){
/////////////////////////////

$('button.vote-button').on('click', function(event) {
    event.preventDefault()
    console.log('wtf')
    debugger
    var id = $(this).siblings().attr('id')

    $.ajax({
      url: '/votes/' + id,
      type: 'post'
    })
    .done(function(data){
      console.log('data', data)
    })
  })

/////////////////////////////
})
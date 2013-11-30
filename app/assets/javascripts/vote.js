$(document).ready(function(){
/////////////////////////////

$('button.vote-button').on('click', function(event) {
    event.preventDefault()
    console.log('wtf')
    // console.log(@user)
    // debugger
    var id = $(this).siblings().attr('id')

    $.ajax({
      url: '/votes',
      type: 'post',
      data: {image_id: id}
    })
    .done(function(data){
      console.log('data', data)
    })
  })

/////////////////////////////
})
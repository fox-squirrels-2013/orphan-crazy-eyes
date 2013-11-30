$(document).ready(function(){
/////////////////////////////

$('button.vote-button').on('click', function(event) {
    event.preventDefault()
    console.log('wtf')
    // console.log(@user)
    // debugger
    var id = $(this).siblings().attr('id')
    var imgSrc = $(this).siblings().attr('src')
    $.ajax({
      url: '/votes',
      type: 'post',
      data: {instagram_id: id, image_url: imgSrc}
    })
    .done(function(data){
      console.log('data', data)
    })
  })

/////////////////////////////
})
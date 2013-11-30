$(document).ready(function(){
/////////////////////////////

  $('button.vote-button').on('click', function(event) {
      event.preventDefault()
      var id = $(this).siblings().attr('id')
      var imgSrc = $(this).siblings().attr('src')
      $.ajax({
        url: '/votes',
        type: 'post',
        data: {instagram_id: id, image_url: imgSrc}
      })
      .done(function(data){
        console.log('still need to count up the votes, son')
      })
    })

/////////////////////////////

    $('.your-pictures').hide()
    $('.all-the-pictures').show()

    $('button.filter-button').on('click', function(event) {
      event.preventDefault()
      $('.your-pictures').toggle()
      $('.all-the-pictures').toggle()
    })

/////////////////////////////
})
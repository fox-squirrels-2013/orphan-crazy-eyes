$(document).ready(function(){
/////////////////////////////

  $('button.vote-button').on('click', function(event) {
        event.preventDefault()
      var $thisButton = $(this)
      var id = $(this).siblings().attr('id')
      var imgSrc = $(this).siblings().attr('src')
      var $votes = $(this).siblings().children()
      var $newVoteCount = Number($votes.text())+1
      $.ajax({
        url: '/votes',
        type: 'post',
        data: {instagram_id: id, image_url: imgSrc}
      })
      .done(function(data){
        $votes.text($newVoteCount)
        $thisButton.attr('disabled', true)
      })
    })

/////////////////////////////

  $('button[disabled=false]').attr('disabled', false)

/////////////////////////////

    $('div.your-pictures').hide()
    $('div.all-the-pictures').show()

    $('button.filter-button').on('click', function(event) {
      console.log("hello!!")
      event.preventDefault()
      $('div.your-pictures').toggle()
      $('div.all-the-pictures').toggle()
    })

/////////////////////////////
})
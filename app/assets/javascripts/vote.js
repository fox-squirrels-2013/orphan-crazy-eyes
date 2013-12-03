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
// ToDo: Since this hides 2 and un-hides 2 each time,
// can this be refactored to use button and then style
// button to blend in with the navbar

    $('li.all-pics-li').on('click', function(event) {
      event.preventDefault()
      $(this).toggleClass('hidden')
      $('li.my-pics-li').toggleClass('hidden')
      $('div.your-pictures').toggleClass('hidden')
      $('div.all-the-pictures').toggleClass('hidden')
    })

    $('li.my-pics-li').on('click', function(event) {
      event.preventDefault()
      $(this).toggleClass('hidden')
      $('li.all-pics-li').toggleClass('hidden')
      $('div.your-pictures').toggleClass('hidden')
      $('div.all-the-pictures').toggleClass('hidden')
    })




/////////////////////////////
})
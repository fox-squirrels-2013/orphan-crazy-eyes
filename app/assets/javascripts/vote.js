$(document).ready(function(){
/////////////////////////////

$('button.vote-button').on('click', function(event) {
  // debugger
  event.preventDefault()
  var $thisButton = $(this)
  // var $heart = $(this).children()
  // var $heart2 = $(this).children()
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
    // $heart.remove()
    // $heart2.append('<img alt=​"Medium_orange_heart" class=​"heart" height=​"20" src=​"/​light_grey_heart.png" width=​"20">​')
  })
})

/////////////////////////////

$('button[disabled=false]').attr('disabled', false)

/////////////////////////////
// ToDo: Since this hides 2 and un-hides 2 each time,
// can this be refactored to use button and then style
// button to blend in with the navbar

$('li.all-pics').on('click', function(event) {
  event.preventDefault()
  $(this).toggleClass('hidden')
  $('li.my-pics').toggleClass('hidden')
  $('div.your-pictures').toggleClass('hidden')
  $('div.all-the-pictures').toggleClass('hidden')
})

$('li.my-pics').on('click', function(event) {
  event.preventDefault()
  $(this).toggleClass('hidden')
  $('li.all-pics').toggleClass('hidden')
  $('div.your-pictures').toggleClass('hidden')
  $('div.all-the-pictures').toggleClass('hidden')
})

/////////////////////////////
})

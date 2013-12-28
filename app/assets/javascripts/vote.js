$(document).ready(function(){
/////////////////////////////

$('button.vote-button').on('click', function(event) {
  event.preventDefault()
  var $thisButton = $(this)
  var $heart = $(this).children()
  var id = $(this).siblings().attr('id')
  var imgSrc = $(this).siblings().attr('src')
  var $votes = $(this).siblings().children()
  var $currentVoteCount = Number($votes.text())
  var $newVoteCount = $currentVoteCount+1
  $.ajax({
    url: '/votes',
    type: 'post',
    data: {instagram_id: id, image_url: imgSrc}
  })
  .done(function(data){
    $votes.text($newVoteCount)
    $thisButton.attr('disabled', true)
    $heart.css('background', 'rgba(195,195,195,1)')
  })
})

/////////////////////////////

$('button[disabled=false]').attr('disabled', false)
$('button.vote-button[disabled=true]').children().css('background', 'rgba(195,195,195,1)')

/////////////////////////////
// toggle not presently a feature

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

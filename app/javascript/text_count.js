window.addEventListener('load', function(){
  const text = document.getElementById('text_check_2');
  const count = document.getElementById('count2');
  text.addEventListener('keydown',function () {
    count.innerHTML = 140 - text.value.length
    if ( count.innerHTML < 0){
      count.style.color = 'red'
    } else{
      count.style.color = 'grey'
    }
  })
})

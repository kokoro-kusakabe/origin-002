window.addEventListener('load', function(){
  const text = document.getElementById('text_check_1');
  const count = document.getElementById('count1');
  text.addEventListener('keydown',function () {
    count.innerHTML = 50 - text.value.length
    if ( count.innerHTML < 0){
      count.style.color = 'red'
    } else{
      count.style.color = 'grey'
    }
  })
})
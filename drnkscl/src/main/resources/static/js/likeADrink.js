
const likeBtn = document.getElementById('likeABtn');

const heartIcon = document.querySelector('.fa-heart');

// likeBtn.addEventListener('click', function(){
//	alert('drink liked')
// }, false);


function lightUp(e){
	e.preventDefault();
	heartIcon.classList.add('shiny');
}


heartIcon.addEventListener('click', lightUp)



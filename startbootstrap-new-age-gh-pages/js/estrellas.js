var calif = document.getElementById('calificacion').innerHTML
var star5 = document.getElementById('star5')
var star4 = document.getElementById('star4')
var star3 = document.getElementById('star3')
var star2 = document.getElementById('star2')
var star1 = document.getElementById('star1')
console.log(calif)

if (calif >= 4.5) {
    star5.checked = true
    star4.checked = true
    star3.checked = true
    star2.checked = true
    star1.checked = true
} else if (calif < 4.5 && calif >= 3.5) {
    star4.checked = true
    star3.checked = true
    star2.checked = true
    star1.checked = true
} 
 else if (calif < 3.5 && calif >= 2.5) {
    star3.checked = true
    star2.checked = true
    star1.checked = true
} 
 else if (calif < 2.5 && calif >= 1.5) {
    star2.checked = true
    star1.checked = true
} 
 else if (calif < 1.5 ) {
    star1.checked = true
} 

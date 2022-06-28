document.addEventListener('turbolinks:load', function () {
  let count = 0
  const line = document.querySelector('.height-change-line')
  const el = document.querySelector('.jumbotron-long')
  const cb = function(entries, observer) {
      entries.forEach(entry => {
          if(entry.isIntersecting) {
              // console.log('inview')
              // el.classList.toggle('height-change')
          } else {
              if(count == 0) {
              console.log('outview')
              el.classList.toggle('height-change')
              count += 1
              }
          }
      })
  }
  const io = new IntersectionObserver(cb);
  io.observe(line);
});

// document.addEventListener('DOMContentLoaded', function () {
// const line = document.querySelector('.height-change-line')
// const el = document.querySelector('.jumbotron-long')
// const cb = function(entries, observer) {
//     entries.forEach(entry => {
//         if(entry.isIntersecting) {
//             console.log('inview')
//             el.classList.toggle('height-change')
//         } else {
//             console.log('outview')
//             el.classList.toggle('height-change')
//         }
//     })
// }

// const io = new IntersectionObserver(cb);
// io.observe(line);
// });
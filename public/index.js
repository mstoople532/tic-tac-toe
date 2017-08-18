function addEventlistenerToCells (className, event, fn) {
  let cells = document.getElementsByClassName(className)
  for (var el = 0; el < cells.length; el++) {
    cells[el].addEventListener(event, fn)
  }
}

function grabCellPosition (event) {
  var cell = event.target.getAttribute('data-position')
  return cell
}
addEventlistenerToCells('cell', 'click', grabCellPosition)
// fetch("/api/board")
// .then(req => req.json())
// .then(data => {
//   console.log(data);
//   // update the dom show an x
// })

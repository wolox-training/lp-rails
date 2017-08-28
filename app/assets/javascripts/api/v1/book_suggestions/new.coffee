$().ready ->
  $('#new_book_suggestion').submit (event) ->
    event.preventDefault()
    $.post("/api/v1/book_suggestions", $('#new_book_suggestion').serialize() )
      .done (booksug) ->
          $("#js-suggestions").append(
            '<li>' +
              '<h2>' + booksug.title + '</h2>' +
              '<h3>' + booksug.author + '</h3>' +
              '<h3><a href="' + booksug.link + '"></a>' +
              '<p>' + booksug.publisher + '</p>' +
              '<p>' + booksug.year + '</p>' +
              '<p> Suggested to: </p>' +
              '<p> ' + booksug.user['first_name'] + ' ' + booksug.user['last_name'] '</p>' +
            '</li>'
          )
    return false

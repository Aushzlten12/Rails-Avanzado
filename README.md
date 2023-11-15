# Actividad Rails-Avanzado

## Vistas parciales, validaciones y filtros

### Vistas Parciales

En el texto de la actividad, se muestra el uso de una vista parcial usando html.erb en la vista index. Para este caso en el que nuestras vistas son del formato html.haml
La vista parcial será _movie.html.haml 

```haml
# _movie.html.haml
%tr
  %td= movie.title
  %td= movie.rating
  %td= movie.release_date
  %td= link_to "More about #{movie.title}", movie_path(movie)
```
Su ubicación fue en /app/views/layouts . Para implementarlo en index.html.haml

```haml
%table#movies
  %thead
    %tr
      %th Movie Title
      %th Rating
      %th Release Date
      %th More Info
  %tbody
    - @movies.each do |movie|
      = render partial: 'movie', locals: {movie: movie}
```

Además de esa vista parcial, se ha añadido una vista parcial para el footer, ya que esta se usará en todas las vistas.

```haml
%footer
  %p Current Date: "#{Time.now.strftime('%Y-%m-%d')}"
```
En el directorio /app/views/layouts. Y lo implementamos en index.html.haml

```haml
= render partial: 'layouts/footer'
```
Así mismo en las vistas restantes.

### Validaciones


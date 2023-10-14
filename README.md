# NBA | API
ste proyecto de Flutter se enfoca en consumir la API pública de la NBA para obtener información sobre equipos, jugadores y juegos. Se han implementado tres endpoints: `teams`, `players` y `games`. Para cada uno de estos endpoints, se ha creado una pestaña en una barra de navegación inferior para facilitar la navegación.
## Capturas de pantalla
| Teams | Games | Players |
| :---: | :---: |:---: |
|![Captura de pantalla 1](assets/view_teams.png)|![Captura de pantalla 1](assets/view_games.png)|![Captura de pantalla 1](assets/view_players.png)|
## Estrucutra del proyecto
El proyecto se estructura de la siguiente manera:
- `assets`: contiene los recursos estáticos de la aplicación.
- `lib`: contiene el código fuente de la aplicación.
  - `main.dart`: contiene el punto de entrada de la aplicación.
  - `src`: contiene el código fuente de la aplicación.
    - `app.dart`: contiene la aplicación.
    - `api`: contiene la funcion para obtener los datos de la API.
    - `pages`: contiene las páginas de la aplicación.
    - `widgets`: contiene los widgets que se utilizan en las páginas de la aplicación.
## Librerías Utilizadas

- **http**: Para realizar solicitudes HTTP a la API de la NBA. [Documentación](https://pub.dev/packages/http)

- **flutter_svg**: Para trabajar con gráficos SVG. [Documentación](https://pub.dev/packages/flutter_svg)

## Recursos
- **API**: [Documentación de la API](https://www.balldontlie.io/home.html#introduction)
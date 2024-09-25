# app_weather_pt

App de clima que consume api OpenWeather para mostrar informacion meteorologica sobre la ubicacion actual de la persona, pidiendo permisos al usuario para poder acceder a esta. Utilize una estructura de windgets y un patron de diseño de la extension Bloc.

Funcionalidades:

Estructura Visual:
- La aplicación tiene un diseño moderno con un fondo oscuro y elementos visuales llamativos como círculos y gradientes.
- Utiliza un Stack para superponer elementos y crear un efecto de profundidad.
- El diseño se adapta a diferentes tamaños de pantalla gracias al uso de MediaQuery.

Obtención de Datos Meteorológicos:
- Emplea un BlocBuilder para escuchar los cambios en el estado del BLoC encargado de gestionar los datos meteorológicos.
- Cuando se obtiene la información del clima, se muestran los siguientes datos:
- Nombre de la ciudad
- País
- Icono del clima correspondiente al código recibido
- Temperatura en grados Celsius
- Descripción del clima (ej: "Despejado", "Lluvioso")
- Fecha y hora actual

Actualización de Datos:
- El botón "Actualizar" se encarga de solicitar nuevos datos meteorológicos y actualizar la interfaz.

Gestión de Estado:
- Se utiliza un patrón BLoC (Business Logic Component) para separar la lógica de negocio de la interfaz de usuario. 


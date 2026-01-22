# lacomer

Proyecto de prueba de maquetación para LaComer (Flutter).
Versión usada: Flutter 3.32.8.
Orientado principalmente a celulares; para tablets se aplican ajustes de
layout responsivo y compatibilidad funcional al no contar con diseño
específico.

## Arquitectura (breve)

- `lib/app/config`: constantes, tema, assets y configuración base.
- `lib/app/localization`: carga de textos desde `assets/lang/es.json`.
- `lib/app/ui`: pantallas y widgets por feature (login/home).
- `lib/main.dart`: arranque, tema, localización y orientación vertical.

## Estructura de carpetas

- `assets/images`: imágenes en PNG (banner).
- `assets/svg`: iconografía y recursos SVG.
- `assets/lang`: textos por idioma.
- `lib/app/ui/home`: vista Home y widgets.
- `lib/app/ui/login`: vista Login y widgets.

— Julio A Motolinía

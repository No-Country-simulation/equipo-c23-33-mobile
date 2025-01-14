# C23-33 Mobile

Este repositorio contiene la aplicación móvil y el backend para el proyecto **C23-33 Mobile**. La aplicación está desarrollada con Flutter, y el backend utiliza Node.js con conexión a servicios como Firebase y PostgreSQL.

## Estructura del Proyecto

```
C23-33 Mobile/
├── README.md
├── apps/
│   ├── mobile/         # Código fuente de la app móvil Flutter
│   └── backend/        # Código fuente del backend Node.js
│       ├── api/       # Rutas o controladores para la API
│       ├── services/  # Conexión a Firebase, PostgreSQL, etc.
│       └── utils/     # Funciones o helpers específicos del backend
```

## Instalación

### Requisitos

- **Flutter**: Asegúrate de tener Flutter instalado. Puedes encontrar las instrucciones [aquí](https://docs.flutter.dev/get-started/install).
- **Node.js**: Descarga e instala Node.js desde [aquí](https://nodejs.org/).

### Pasos

1. Clona este repositorio:
   ```bash
   git clone git@github.com:No-Country-simulation/c23-33-mobile.git
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd c23-33-mobile
   ```
3. Instala las dependencias del backend:
   ```bash
   cd apps/backend
   npm install
   ```
4. Configura el entorno para la app móvil:
   ```bash
   cd ../mobile
   flutter pub get
   ```
5. Ejecuta la aplicación móvil o el backend según sea necesario.

## Contribución

### Estrategia de trabajo

- **Pull Requests**: Todos los miembros deben realizar un pull request para realizar cambios en el repositorio.
- **Ramas dedicadas**: Crear ramas para cada feature, fix o tarea con nombres descriptivos, como `feature/login` o `fix/typo-header`.

#### Buenas prácticas al trabajar con Git

1. **Commits claros y específicos**:
   - Realizar commits por archivo o por conjunto lógico de cambios.
   - Asegurarse de que los mensajes de los commits describan claramente los cambios realizados.

2. **Actualizar el repositorio antes del merge**:
   - Ejecutar siempre `git pull` antes de realizar un merge para asegurarse de trabajar con la última versión del código.

3. **Estrategia de ramas**:
   - Usar ramas dedicadas para cada feature, fix o tarea.
   - Nombrar las ramas de manera descriptiva (por ejemplo, `feature/login`, `fix/typo-header`).

4. **Resolución de conflictos**:
   - Resolver conflictos antes de realizar el merge para evitar problemas en el repositorio principal.
   - Revisar cuidadosamente los archivos en conflicto con un editor visual si es necesario.

5. **Revisión antes de la fusión**:
   - Todos los miembros del equipo deben realizar un pull request para que los cambios puedan ser revisados antes de integrarse al repositorio principal.
   - Utilizar herramientas como GitHub para centralizar esta revisión.

#### Otros puntos destacados

- **Verificar los cambios pendientes**:
  - Utilizar `git status` para comprobar el estado del repositorio antes de hacer commits o pulls.

- **Deshacer cambios no deseados**:
  - Para descartar cambios en un archivo: `git checkout -- <archivo>`.
  - Para resetear completamente al último commit: `git reset --hard HEAD`.

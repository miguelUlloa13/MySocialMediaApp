# Bienvenido a mi repositorio MySocialMediaApp

MySocialMediaApp es una App gratuita para **iOS!** el cual desarrollé para una prueba técnica para Teknei , pero sobre todo para demostrar mis conocimientos adquiridos como desarrollador iOS. Haber realizado la aplicación me permitió mejorar, adquirir y acentuar mis habilidades .


# Informacion general

 1. iOS Version 12.0+
 2. Xcode 12.0+
 3. Swift 5+
 4. Soporta modo oscuro
 5. IQKeyboardManager

> **ProTip:** -   Por razones de compatibilidad, no se selecciono la versión mas recientes de **iOS** y **Xcode**.



## Estructura del proyecto

 - Utils: Personalización de fuente de texto de la App, alertas y botones.
 - Controller: Enruta comandos a los modelos y vistas.
	 - Controlador de la vista Login
	 - Controlador de la vista Users
	 - Controlador de la vista EditRegistration
   - Controlador de la celda reusable RegistrationTableViewCell
   - Controlador de la vista HeaderView
   - Controlador de la vista FooterView
 - View: Se encarga del diseño y presentación.
	 - LaunchScreen: Splashscreen de la App
   - LoginView: Pantalla login
   - UsersView: Pantalla principal o Users
   - EditRegistrationView: Pantalla de detalle 
	 - RegistrationTableViewCell: Celda personalizada o Item
   - HeaderView:
   - FooterView:
 - Model: Maneja datos y lógica de negocios.
	 - UserResponseModel: Modelo de la respuestas de la conexión a la Api
	 - UserDataModel: Modelo de los datos obtenidos de la Api
	 - NetworkError: Tipo de errores que podemos encontrar al intentar consultar la API
	 - APIClient: Clase para realizar la conexión a la API
   - ValidateString:
   - CoreDataHelper:
   - KeychainHelper:
 - Assets: Recursos gráficos

 

## Instalación

 - Ingresar en Terminal o Xcode: `git clone https://github.com/miguelUlloa13/MyNewsApp.git`

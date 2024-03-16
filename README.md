# Bienvenido a mi repositorio MySocialMediaApp

MySocialMediaApp es una App gratuita para **iOS!** el cual desarrollé para una prueba técnica para Teknei, pero sobre todo para demostrar mis conocimientos adquiridos como desarrollador iOS. Haber realizado la aplicación me permitió mejorar, adquirir y acentuar mis habilidades .

![AppLogo2](https://github.com/miguelUlloa13/MySocialMediaApp/assets/110041833/6c6ebd7b-9f6e-46c8-84ea-a6c68ebe9859)

# Información general

 1. iOS Version 12.0+
 2. Xcode 12.0+
 3. Swift 5+
 4. Soporta modo oscuro
 5. IQKeyboardManager

> **ProTip:** -   Por razones de compatibilidad, no se selecciono la versión mas recientes de **iOS** y **Xcode**.

<img width="334" alt="Screenshot 2024-03-15 at 2 31 21 p m" src="https://github.com/miguelUlloa13/MySocialMediaApp/assets/110041833/8686cad6-a583-439d-984a-3ff516206311"> <img width="334" alt="Screenshot 2024-03-15 at 2 33 00 p m" src="https://github.com/miguelUlloa13/MySocialMediaApp/assets/110041833/d8bae50f-d1b9-4e27-a56b-a48ae494ada6">



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
   - LoginView: Pantalla login. Autenticación de usuarios
   - UsersView: Pantalla principal o Users. Despliega una lista con el o los usuarios extraidos de la api
   - RegistrationTableViewCell: Celda reusable que contiene los datos de registro de un usuario
   - EditRegistrationView: Pantalla de detalle del registro del usuario
   - HeaderView: Contiene logo de App y boton para Log out
   - FooterView: Contiene Fecha y hora actual, y nombre del participante
 - Model: Maneja datos y lógica de negocios.
	 - UserResponseModel: Modelo de la respuestas de la conexión a la Api
	 - UserDataModel: Modelo de los datos obtenidos de la Api
	 - NetworkError: Tipo de errores que podemos encontrar al intentar consultar la API
	 - APIClient: Clase para realizar la conexión a la API
   - ValidateString: Clase para validar si una cadena contiene: Letras o Numeros, ademas, valida el formato correcto de un email
   - CoreDataHelper: Persistencia de datos. Clase para guardar usuarios con su respectuvo registro mediante framework CoreData
   - KeychainHelper: Salvar credenciales de usuario. Clase para guardar las credenciales del usuario (username y password) de forma segura mediante framework Keychain
 - Assets: Recursos gráficos. Imagenes y colores de la App

## Video Demo
[![ScreenRecording2024-03-15at2 52 09p m -ezgif com-video-to-gif-converter](https://github.com/miguelUlloa13/MySocialMediaApp/assets/110041833/bfc10004-90f9-498b-95d8-4451ec08017a)](https://youtube.com/shorts/xjO50G7mQVo?feature=share)

## Instalación

 1. El proyecto utiliza CocoaPods para gestionar sus dependencias. Si cuenta instalado CocoaPods pasar a paso 2, sino ingresar en terminal:

	- `sudo gem install cocoapods` 

	Si cuantas con Macbook M1 o Macbook     M2 basado en el chip Apple Silicon:

	-  `brew install cocoapods`
 
> **ProTip:** -   Para mayor detalle de instalación [Install Cocoapods on M1 and M2 Macbook easily without Errors](https://medium.com/@developer.sreejithnp/install-cocoapods-on-m1-and-m2-macbook-easily-without-errors-b2e0b04eea09).

2. Ingresar en Terminal o Xcode: `git clone https://github.com/miguelUlloa13/MySocialMediaApp.git`
- Terminal:
	- Abrir Terminal e ingresar *git clone https://github.com/miguelUlloa13/MySocialMediaApp.gi* 	
![Screenshot 2024-03-15 at 4 14 20 p m](https://github.com/miguelUlloa13/MySocialMediaApp/assets/110041833/139e2244-e55e-4483-ac36-2a7321320906)

- XCode:
	- Abrir Xcode y seleccionar *Clone Git Repository...* 	
![Screenshot 2024-03-15 at 4 15 23 p m](https://github.com/miguelUlloa13/MySocialMediaApp/assets/110041833/a6d754b8-33e7-4cb5-b1f4-8fc0040bec9b)
	- Seleccionar *Clone*
![Screenshot 2024-03-15 at 4 15 51 p m](https://github.com/miguelUlloa13/MySocialMediaApp/assets/110041833/92f5b135-89cd-4c7e-a84a-005799710949)

3. Abrir el proyecto descargado y abrir *MySocialMediaApp.xcworkspace*:

![Screenshot 2024-03-15 at 4 25 55 p m](https://github.com/miguelUlloa13/MySocialMediaApp/assets/110041833/d6386e48-b5a8-4405-9c89-1e254ea77ae6)

4. Ejecutar el proyecto:

![Screenshot 2024-03-15 at 4 26 19 p m](https://github.com/miguelUlloa13/MySocialMediaApp/assets/110041833/be658099-9b68-445d-88b1-5355bd80d95d)


# Contacto
Sígueme y contáctame en Linkedin. Las Pull requests son bienvenidas 😄.

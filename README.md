//Creating flutter project using commands//
-- flutter create 'project name' ( once you run this command it will generate project for you)
-- Our project will start from 'lib' folder
-- 'lib' folder contains main.dart file
-- flutter application will run on dart language developed bu google.

<!-- commands for flutter project -->

-- flutter create 'project name'
-- flutter run (to run project)
-- flutter doctor ( any issues available related to fluuter)
-- flutter --version (to know about flutter version)
-- flutter pub get (to install any plugins)
<!-- mainly used commands as of now -->

<!-- How to create multiplle enviornments using in dotenv plugin -->

-- Every application will work on multiple enviorments like dev,staging,prod 
-- To implement this we need to install 'flutter_dotenv' plugin 
-- to install add 'flutter_dotenv' in pubspec.yaml file under dependencies 
-- after adding need to run this command 'flutter pub get'
-- after successful installiation we need to create a 3 different file .env.dev, .env.staging, .env.prod under the root folder
-- add files in pubspec.yaml in .env.dev, .env.staging, .env.prod under assets section
-- run flutter pub get to update the pubspec.yaml file
-- next coming to main.dart file to access the enviornment
-- import the library 'import 'package:flutter_dotenv/flutter_dotenv.dart';
-- add the below lines to access the file
-- await dotenv.load(fileName: '.env.dev') -- it loads the files, await loadEnvironment() -- it call the environment function
-- Future<void> loadEnvironment() async {
  String envFileName;
  print('Attempting to load environment file:');
  switch (const String.fromEnvironment('FLUTTER_ENV')) {
    case 'development':
      envFileName = '.env.dev';
      break;
    case 'staging':
      envFileName = '.env.staging';
      break;
    case 'production':
      envFileName = '.env.prod';
      break;
    default:
      throw Exception('Unknown environment');
  }

  await dotenv.load(fileName: envFileName);
}
-- create a vaibale to access the .env details like 'final baseURL = dotenv.env['Base_URl'];'
-- use variable where ever you want in the widget
-- after completion of process use like this -- 'flutter run --dart-define=FLUTTER_ENV=development' (to access the developement related stuff)
  
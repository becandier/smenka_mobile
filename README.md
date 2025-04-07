# Comrades Devs Template

## Setup for new project
This is step for setup for every new project. 

### 1. Identifier
A new identifier should be like this: com.app.**yourshortprojectname**
yourshortprojectname should be without "_" and Uppercase symbols. 

Initial identifier for template is **com.app.templatecmd**

#### 1. a. Create a new identifier 
1. iOS: 
	Go to https://developer.apple.com/account/resources/identifiers and create new identifier. 
2. Replace  com.app.templatecmd everywhere in project to your identifier. 

### 2. Firebase

Go to https://console.firebase.google.com and create new project. 
Following instruction replace default project to your new project. 

**Required features added:**
1. Remote config:
	1.a. Remote config with field:
	- API_ENDPOINT_DEV (STRING)
	- API_ENDPOINT_PROD (STRING)
	- PRIVACY_POLICY (STRING)
	- MIN_VERSION (STRING) - if current version is smaller then min version, user will not able to use app. 
	- TECH_WORK (BOOL) - if this field is true user will not be able to use app.  
	- DEBUG_MODE_PASSWORD (STRING) - password for debug mode

### 3. Icon
For setup icon of application change file <assets/logo.png> and run command:

    dart run flutter_launcher_icons
   
### 4. Launch screen 
Default launch screen is scale app logo on file 

> lib/app/main_app/view/loading_app.dart

## Setup for new developer
This is step for a situation when project is ready and have been added new developer. 
### 1. FVM
https://fvm.app/documentation/getting-started
You should be use fvm for work with project. This is guide for installation for your computer. The project already has fvm. Actual flutter version in pubcpec.yaml file. 

### 2. flutter_gen
All assets add to project with flutter_gen. Check documentation. https://pub.dev/packages/flutter_gen 

### 3. Localization
All text in UI should have localisation. 
1 step. You add value in every .arb file (lib/l10n) 
2 step. Generate locale make loc (flutter gen-l110n)
3 step. Use with context (context.l10n.hello)
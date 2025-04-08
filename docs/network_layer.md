## Network Layer Documentation

  

This document describes how to work with the network layer in our application using Dio with sealed classes for error handling.

  

## Setup

  

```dart

// DioInitializer class

Future<void> initialize(AppServiceLocator locator) async {

final dio = Dio();

dio.interceptors.add(TalkerDioLogger(talker: locator.get<Talker>()));

dio.interceptors.add(ApiErrorInterceptor());

dio.interceptors.add(DioHeadersIntercaption());

dio.options.baseUrl = locator.get<AppConfig>().apiEndPoint;

locator.register<Dio>(dio);

}

```

  

## Making API Requests

  

```dart

// Direct usage

final response = await dio.post<dynamic>('/users', data: { /* data */ });

  

// Or with API client

class  AuthApi {

AuthApi(this.client);

final  Dio client;

  

Future<String?> register({

required  String name, required  String email,

required  String password, required  String passwordConfirm,

}) async {

final response = await client.post<dynamic>('/register', data: {

'name': name, 'email': email,

'password': password, 'password_confirmation': passwordConfirm,

});

return response.data['token'] as  String?;

}

}

```

  

## Error Handling

  

```dart

try {

await dio.post<dynamic>('/users', data: { /* data */ });

} on  DioException  catch (e) {

if (e.error is ApiException) {

final apiException = e.error as  ApiException;

switch (apiException) {

case  ValidationException():

// Handle validation errors (HTTP 422)

final errors = apiException.errors; // Map<String, String?>

// Display errors to the user

case  UnauthorizedException():

// Handle authentication errors (HTTP 401)

// Redirect to login

case  NetworkException():

// Handle network connectivity issues

// Show offline message

case  ServerException():

// Handle server errors (HTTP 500, 502, 503, 504)

// Show generic error message

}

}

}

```

  

## Form Validation Example

  

```dart

class  _LoginFormState  extends  State<LoginForm> {

Map<String, String?> _errors = {};

Future<void> _login() async {

try {

await context.read<Dio>().post<dynamic>('/login', data: {

'email': _emailController.text,

'password': _passwordController.text,

});

Navigator.of(context).pushReplacementNamed('/home');

} on  DioException  catch (e) {

if (e.error is ApiException) {

final apiException = e.error as  ApiException;

switch (apiException) {

case  ValidationException():

setState(() => _errors = apiException.errors);

case  UnauthorizedException():

// Show unauthorized message

case  NetworkException():

// Show network error

case  ServerException():

// Show server error

}

}

}

}

@override

Widget  build(BuildContext context) {

return  Form(

child: Column(

children: [

TextFormField(

controller: _emailController,

decoration: InputDecoration(

labelText: 'Email',

errorText: _errors['email'],

),

),

// Other form fields

ElevatedButton(onPressed: _login, child: Text('Login')),

],

),

);

}

}

```

  

## BLoC/Cubit Usage

  

```dart

class  AuthCubit  extends  Cubit<AuthState> {

AuthCubit(this._authApi) : super(AuthInitial());

final  AuthApi _authApi;

Future<void> login(String email, String password) async {

emit(AuthLoading());

try {

final response = await _authApi.login(email: email, password: password);

emit(AuthSuccess(response));

} on  DioException  catch (e) {

if (e.error is ApiException) {

final apiException = e.error as  ApiException;

switch (apiException) {

case  ValidationException():

emit(AuthValidationError(apiException.errors));

case  UnauthorizedException():

emit(AuthError('Invalid credentials'));

case  NetworkException():

emit(AuthError('Network error'));

case  ServerException():

emit(AuthError('Server error'));

}

} else {

emit(AuthError('An unexpected error occurred'));

}

}

}

}

```
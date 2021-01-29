import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {});
  }

  @observable
  bool passwordVisible = false;

  @action
  void TogglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loggedIn = false;
  
  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool loading = false;

  
  
  @computed // Sempre tem que ter GET
  Function get loginPressed =>
       (isEmailValid && isPasswordValid && !loading) ? login : null;

  @computed
  bool get isEmailValid => email.length > 15;

  @computed
  bool get isPasswordValid => password.length > 7;



  @action
  Future<void> login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 4));
    loading = false;
  
    loggedIn = true;
  }
  
}

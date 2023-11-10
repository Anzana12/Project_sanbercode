import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart' hide Auth;
import 'package:provider/provider.dart';

import 'package:zanapk/providers/auth.dart';

const users = const {
  'test@gmail.com': '123456',
  'zana@gmail.com': '123456',
};

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUserSignUp(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<Auth>(context, listen: false)
            .signup(data.name, data.password);
      } catch (err) {
        print(err);
        return err.toString();
      }
      return null;
    });
  }

  Future<String> _authUserLogin(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<Auth>(context, listen: false)
            .login(data.name, data.password);
      } catch (err) {
        print(err);
        return err.toString();
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'zanAPK',
      logo: 'assets/img/zanimage.jpg',
      onLogin: _authUserLogin,
      onSignup: signupUser,
      onSubmitAnimationCompleted: () {
        Provider.of<Auth>(context, listen: false).tempData();
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  Future<String> signupUser(SignupData data) {
    return Future.value("Signup succsesful");
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'main_tab_controller.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
            padding: const EdgeInsets.all(50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Username",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter your email";
                      }
                      if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return null;
                      }
                      return "Please enter a valid email address";
                    },
                    decoration: InputDecoration(
                        hintText: 'Email Address',
                        isDense: true,
                        labelStyle: TextStyle(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1))),
                  ),
                  SizedBox(height: 30),
                  Text("Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (value) {
                      this.login(model, context);
                    },
                    controller: pwController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter your password";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        isDense: true,
                        labelStyle: TextStyle(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1))),
                  ),
                  SizedBox(height: 16),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      )),
                  SizedBox(height: 32),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 40,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.black12,
                                  offset: new Offset(0.0, 0),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: FlatButton(
                                onPressed: () {},
                                child: Text('New User',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)))),
                        Container(
                            height: 40,
                            decoration: new BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.black12,
                                  offset: new Offset(0.0, 0),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: FlatButton(
                                onPressed: () {},
                                child: Text('Log In',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))))
                      ])
                ],
              ),
            )),
      ),
    );
  }

  login(LoginViewModel model, BuildContext context) {
    if (_formKey.currentState.validate()) {
      model.logUserIn(emailController.text, pwController.text).then((value) => {
            if (value)
              {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainTabController()))
              }
            else
              {
                print(value),
                this.showAlertDialog("Error",
                    "An error has occurred please try again", "Ok", context)
              }
          });
    }
  }

  showAlertDialog(
      String title, String content, String buttonTitle, BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(buttonTitle),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home.dart';
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

      ///onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
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
                          labelText: 'Email Address',
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                              BorderSide(color: Colors.grey, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                              BorderSide(color: Colors.grey, width: 1.0))),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (value){
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
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                              BorderSide(color: Colors.grey, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                              BorderSide(color: Colors.grey, width: 1.0))),
                    ),
                    FlatButton(
                        onPressed: () {},
                        textColor: Colors.green,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(decoration: TextDecoration.underline),
                        )),
                    SizedBox(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {},
                            color: Colors.white,
                            child: const Text('Request New Account',
                                style: TextStyle(fontSize: 18)),
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              this.login(model, context);
                            },
                            textColor: Colors.white,
                            color: Colors.blue,
                            child:
                            const Text('Login', style: TextStyle(fontSize: 18)),
                          )
                        ])
                  ],
                ),
              )),
        ),
      ),
    );
  }

  login(LoginViewModel model, BuildContext context){
    if (_formKey.currentState.validate()) {
      model.logUserIn(
          emailController.text, pwController.text)
          .then((value) => {
        if (value)
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Home()),
            )
          }else{
          print(value),
          this.showAlertDialog("Error", "An error has occurred please try again", "Ok", context)
        }
      });
    }
  }

  showAlertDialog(String title, String content, String buttonTitle, BuildContext context) {

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

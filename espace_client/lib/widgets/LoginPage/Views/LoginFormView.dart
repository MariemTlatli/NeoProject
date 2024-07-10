import 'package:email_validator/email_validator.dart';
import 'package:espace_client/Constants.dart' as constants;
import 'package:espace_client/utils/CustomButton.dart';
import 'package:espace_client/utils/Header.dart';
import 'package:espace_client/widgets/MyContainer/Views/MyContainerView.dart';

import 'package:espace_client/widgets/LoginPage/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginFormView extends StatefulWidget {
  LoginFormView({super.key});

  @override
  _LoginFormViewState createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<LoginFormView> {
  final _formKey = GlobalKey<FormState>(); // Create a GlobalKey for the Form

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: constants.defaultBackgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyHeader(text: constants.headerText),
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Consumer<UserModel>(builder: (context, user, child) {
                  return Column(
                    children: <Widget>[
                      Container(
                        color: constants.defaultBackgroundColor,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Visibility(
                              visible: user.isTextFieldMailVisible,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  fillColor: constants.MyGreyColor,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: constants.IconEmailColor,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer une adresse e-mail';
                                  }
                                  if (!EmailValidator.validate(value)) {
                                    user.setMail(value);
                                    return 'Veuillez entrer une adresse e-mail valide';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Visibility(
                              visible: user.isTextFieldPasswordVisible,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    fillColor: constants.MyGreyColor,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: constants.IconEmailColor,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez entrer un mot de passe';
                                    } else {
                                      user.setPassword(value);
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Visibility(
                              visible: user.isTextFieldConfirmPasswordVisible,
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Confirm password',
                                  fillColor: constants.MyGreyColor,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: constants.IconEmailColor,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez réecrire votre mot de passe';
                                  } else {
                                    user.setConfirmPassword(value);
                                  }

                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: user.isTextFieldMailVisible,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomButton(
                            myPadding: 30.0,
                            onPressed: () {
                              if (user.isTextFieldMailVisible) {
                                if (_formKey.currentState!.validate()) {
                                  user.setVisibleMail(false);
                                  user.setVisiblePass(true);
                                  user.setVisibleConfirmPass(false);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Adresse e-mail valide !')),
                                  );
                                }
                              } else if (user.isTextFieldPasswordVisible) {
                                if (_formKey.currentState!.validate()) {
                                  user.setVisiblePass(false);
                                  user.setVisibleConfirmPass(true);
                                }
                              } else if (user
                                  .isTextFieldConfirmPasswordVisible) {
                                if (user.Getpassword == user.confirmPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Mot de passe valide !')),
                                  );
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return MyConatinerView();
                                  }));
                                } else {
                                  user.setVisibleMail(true);
                                  user.setVisibleConfirmPass(false);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Mot de passe invalide !')),
                                  );
                                }
                              }
                            },
                            text: 'Se Connecter',
                            color: constants.ButtonColor,
                          )),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

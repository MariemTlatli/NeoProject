import 'package:espace_client/Constants.dart' as constants;
import 'package:espace_client/widgets/LoginPage/Models/UserModel.dart';
import 'package:espace_client/widgets/LoginPage/Provider/UserProvider.dart';
import 'package:espace_client/widgets/LoginPage/Views/LoginFormView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({Key? key}) : super(key: key);

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isMobile = (screenWidth <= 600 && screenHeight <= 700);

    return ChangeNotifierProvider(
      create: (context) {
        return (UserProvider());
      },
      child: Scaffold(
        body: Column(
          children: [
            (isMobile)
                ? Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: constants.defaultSecondryColor,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.network(constants.MonLogo),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Center(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(child: LoginFormView()),
                      ],
                    ),
                  )
                : Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: constants.defaultSecondryColor,
                              ),
                              child: Column(children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: constants.defaultSecondryColor,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Image.network(
                                                  constants.MonLogo),
                                            ),
                                            const Expanded(
                                              flex: 1,
                                              child: SizedBox(),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            constants.defaultTransparentColor,
                                      ),
                                      child: Text(
                                        constants.sousTextLogo,
                                        style: TextStyle(
                                            color: constants
                                                .defaultBackgroundColor,
                                            fontSize: constants.fontSizeTitre,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        LoginFormView(),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

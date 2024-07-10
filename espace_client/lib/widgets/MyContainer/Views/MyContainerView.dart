import 'package:espace_client/utils/Drawer.dart';
import 'package:espace_client/utils/ErrorPage.dart';
import 'package:espace_client/widgets/AcceuilPage/Views/AcceuilView.dart';
import 'package:espace_client/widgets/MyContainer/Models/PageInfos.dart';
import 'package:espace_client/widgets/MyContainer/Views/pageHeader.dart';
import 'package:espace_client/widgets/QuittancePage/Views/quittancePage.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:espace_client/Constants.dart' as constants;

class MyConatinerView extends StatefulWidget {
  const MyConatinerView({super.key});

  @override
  State<MyConatinerView> createState() => _MyConatinerViewState();
}

class _MyConatinerViewState extends State<MyConatinerView> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isMobile = (screenWidth <= 600 && screenHeight <= 700);

    return ChangeNotifierProvider(
        create: (context) => PageInfos(),
        child: Scaffold(
          appBar: (isMobile) ? constants.myAppBar : null,
          drawer: (isMobile)
              ? MyDrawer(
                  isMobile: isMobile,
                )
              : null,
          backgroundColor: constants.defaultBackgroundColor,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: constants.IconEmailColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Icon(
              Icons.message,
              color: constants.defaultBackgroundColor,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Visibility(
                  visible: isMobile ? false : true,
                  child: Expanded(
                      flex: 2,
                      child: MyDrawer(
                        isMobile: isMobile,
                      )),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Consumer<PageInfos>(
                          builder: (context, pageInfos, child) {
                            return PageHeader(
                              isMobile: isMobile,
                              visibilityRechercheBarre:
                                  (pageInfos.GetSelectedItemIndex == 0)
                                      ? true
                                      : false,
                              index: pageInfos.GetSelectedItemIndex,
                              titre: "Acceuil",
                              sousTitre: constants.maListeTitres[
                                  pageInfos.GetSelectedItemIndex],
                              visibleIconButton: true,
                              visibleButton:
                                  (pageInfos.GetSelectedItemIndex == 1 ||
                                          pageInfos.GetSelectedItemIndex == 6)
                                      ? true
                                      : false,
                              textButton: (pageInfos.GetSelectedItemIndex == 1)
                                  ? constants.maListeButtonsText[0]
                                  : constants.maListeButtonsText[1],
                              onPressed: () {},
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Consumer<PageInfos>(
                          builder: (context, pageInfos, child) {
                            switch (pageInfos.GetSelectedItemIndex) {
                              case 0:
                                return AcceuilView();
                              case 1:
                                return const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ErrorPage(
                                          titre:
                                              "Quelque chose s\'est mal passé",
                                          sousTitre:
                                              'Veuillez resseayer plus tard'),
                                    ]);
                              case 2:
                                return QuittancePage(
                                  isMobile: isMobile,
                                );
                              case 3:
                                return const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ErrorPage(
                                          titre:
                                              "Quelque chose s\'est mal passé",
                                          sousTitre:
                                              'Veuillez resseayer plus tard'),
                                    ]);
                              case 4:
                                return const ErrorPage(
                                    titre: "Quelque chose s\'est mal passé",
                                    sousTitre: 'Veuillez resseayer plus tard');
                              case 6:
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text('Mes sinistres')]);
                              default:
                                return AcceuilView();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ErrorPage(
        titre: "Mes Documents", sousTitre: 'Quelque chose s\'est mal passé');
  }
}

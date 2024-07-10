import 'package:espace_client/Constants.dart';
import 'package:espace_client/widgets/MyContainer/Models/PageInfos.dart';
import 'package:espace_client/widgets/MyContainer/Views/MyContainerView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:espace_client/Constants.dart' as constants;

class MyDrawer extends StatefulWidget {
  final bool isMobile;
  const MyDrawer({super.key, required this.isMobile});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageInfos(),
      child: Drawer(
        backgroundColor: constants.defaultSecondryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Mon logo', style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                color: constants.defaultSecondryColor,
              ),
            ),
            drawerItem(context, 'Accueil', Icons.home, 0),
            drawerItem(context, 'Contrats', Icons.file_copy, 1),
            drawerItem(context, 'Quittances', Icons.receipt, 2),
            drawerItem(context, 'Attestations', Icons.check_circle, 3),
            drawerItem(context, 'Documents', Icons.folder, 4),
            drawerItem(context, 'Devis', Icons.edit, 5),
            drawerItem(context, 'Sinistres', Icons.warning, 6),
            drawerItem(context, 'Résiliations', Icons.cancel, 7),
            drawerItem(context, 'Déconnexion', Icons.exit_to_app, 8),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(
      BuildContext context, String title, IconData icon, int index) {
    final pageInfos = context.watch<PageInfos>();

    return ListTile(
      selectedTileColor: defaultBackgroundColor,
      tileColor: defaultSecondryColor,
      leading: Icon(icon,
          color: pageInfos.GetSelectedItemIndex == index
              ? defaultSecondryColor
              : defaultBackgroundColor),
      title: Text(title,
          style: TextStyle(
              color: pageInfos.GetSelectedItemIndex == index
                  ? defaultSecondryColor
                  : defaultBackgroundColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4)),
      selected: pageInfos.GetSelectedItemIndex == index,
      onTap: () {
        pageInfos.setSelectedItemIndex(index);
        if (index == 8) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MyConatinerView();
          }));
        }
      },
    );
  }
}

import 'package:espace_client/utils/Drawer.dart';
import 'package:espace_client/widgets/QuittancePage/Models/Contrat.dart';
import 'package:flutter/material.dart';

//---------------- mes couleurs ------------------
var defaultTransparentColor = Color.fromARGB(0, 31, 29, 161);
var defaultBackgroundColor = Colors.white;
var defaultPrimaryColor = Colors.blueAccent;
var IconEmailColor = Colors.lightBlue;
var ButtonColor = Colors.red;
var greenColor = const Color.fromARGB(255, 42, 158, 102);
Color MyGreyColor = const Color.fromARGB(255, 220, 219, 219);

var defaultSecondryColor = Color(0xFF313042);
// ------------------ logo de l'entreprise  ------------
String MonLogo = "https://bysur.com/assets/images/logo.png";
// ------------------ Text sous le logo dans login
String sousTextLogo = "Mon Espace Client";
double fontSizeTitre = 28;
// COLOR  defaultBackgroundColor
// ----------------------- Header login
String NetworkImageHeader =
    'https://us.123rf.com/450wm/lightfieldstudios/lightfieldstudios1801/lightfieldstudios180102348/93684092-watch-and-turned-off-smartphone-on-wooden-table.jpg?ver=6';

String headerText = "MyText";
// ----------------------- container
var appBarColor = defaultSecondryColor;
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  surfaceTintColor: Colors.white,
  title: Text(' '),
  /*actions: [
    Expanded(
      flex: 1,
      child: Image.network(MonLogo),
    ),
  ],*/
  centerTitle: false,
);
// -------------------------------- PageHeader titre et boutton Text

List<String> maListeTitres = [
  'Bonjour Rihem',
  'mes contrats',
  'mes quittances',
  'mes attestations d\'assucrances',
  'Mes documents',
  'Mes devis',
  'Mes sinistres',
  'Mes résiliations',
  'Déconnexion',
];
List<String> maListeButtonsText = [
  'Souscrire un contrat',
  'Déclarer une sinistre',
];
// ----- barre de recherche fonction en paramètres

// ----------------- Acceuil view
List<String> maListePriorite = [
  'faible',
  'moyenne',
  'important',
];
// ------------------ Quittance page
String myHint = 'Priorité';
String myHintStatus = 'Statut';
String myHintAnnesQuittances = 'Années de quittances';
String myHintAnnesQuittances2 = "Années";
List<String> maListeStatus = [
  'Planifiée',
  'En cours',
  'Terminée',
];
Map<String, MaterialColor> someMap = {
  'Planifiée': Colors.red,
  'En cours': Colors.blue,
  'Terminée': Colors.green,
};
List<String> maListeAnneesQuittances = [
  '2020',
  '2021',
  '2022',
  '2023',
  '2024',
];

final contrat0 = Contrat(
  numeroContrat: 'numero Contrat',
  primeContrat: 'prime Contrat',
  datePayementContrat: 'date Payement ',
  statueContrat: 'statue Contrat',
  telechargerContrat: 'telecharger Contrat',
);

final contrat1 = Contrat(
  numeroContrat: 'HCC000032',
  primeContrat: '1138€',
  datePayementContrat: '29/06/2024',
  statueContrat: 'Planifiée',
  telechargerContrat: 'Lien de téléchargement',
);

final contrat2 = Contrat(
  numeroContrat: 'HCC000033',
  primeContrat: '1200€',
  datePayementContrat: '15/07/2024',
  statueContrat: 'En cours',
  telechargerContrat: 'Lien de téléchargement',
);

final listeContrats = [contrat2, contrat1];
final listeContratsMobile = [contrat0, contrat2, contrat1, contrat2];

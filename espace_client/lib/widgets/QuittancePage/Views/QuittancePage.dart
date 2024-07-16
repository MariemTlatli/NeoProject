import 'package:espace_client/utils/MyDropDownButton.dart';
import 'package:espace_client/widgets/QuittancePage/Models/Contrat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:espace_client/Constants.dart' as constants;
import 'package:flutter/widgets.dart';

class QuittancePage extends StatefulWidget {
  
  final bool isMobile;
  int nbQuittance = constants.listeContratsMobile.length;
  QuittancePage({super.key, required this.isMobile});

  @override
  State<QuittancePage> createState() => _QuittancePageState();
}

class _QuittancePageState extends State<QuittancePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: (widget.nbQuittance > 0)
          ? Column(
              children: [
                Expanded(
                    flex: (!widget.isMobile) ? 4 : 2,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: MyDropDownButton(
                                myItems: constants.maListeStatus,
                                myHint: constants.myHintStatus,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: MyDropDownButton(
                                myItems: constants.maListeAnneesQuittances,
                                myHint: (!widget.isMobile)
                                    ? constants.myHintAnnesQuittances
                                    : constants.myHintAnnesQuittances2,
                              ),
                            ),
                            DecoratedBox(
                                decoration: BoxDecoration(
                                  color: constants
                                      .defaultBackgroundColor, // Couleur de fond du bouton déroulant
                                  border: Border.all(
                                      color: constants.MyGreyColor,
                                      width: 1), // Bordure du bouton déroulant
                                  borderRadius: BorderRadius.circular(70),
                                  boxShadow: <BoxShadow>[
                                    // Ombre portée sur le bouton déroulant
                                    BoxShadow(
                                      color: constants
                                          .MyGreyColor, // Couleur de l'ombre
                                      blurRadius: 5, // Rayon de flou de l'ombre
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.refresh_rounded)))
                          ],
                        ))),
                Expanded(
                  flex: 15,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      decoration: BoxDecoration(
                        color: constants.defaultBackgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      columnSpacing: 10.0,
                      columns: (!widget.isMobile)
                          ? const [
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    "Numéro de contrat",
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                    child: Text(
                                  "Prime mensuelle TTC",
                                  overflow: TextOverflow.fade,
                                )),
                              ),
                              DataColumn(
                                  label: Expanded(
                                child: Text(
                                  "Date paiement",
                                  overflow: TextOverflow.fade,
                                ),
                              )),
                              DataColumn(
                                  label: Expanded(
                                child: Text(
                                  "statut",
                                  overflow: TextOverflow.fade,
                                ),
                              )),
                              DataColumn(
                                  label: Expanded(
                                child: Text(
                                  "Télécharger quittance",
                                  overflow: TextOverflow.fade,
                                ),
                              )),
                            ]
                          : _buildInvertedDataColumns(),
                      rows: (!widget.isMobile)
                          ? List.generate(
                              constants.listeContrats.length,
                              (index) => ContratDataRow(
                                  constants.listeContrats[index]),
                            )
                          : _buildInvertedDataRows(),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Image.network(
                        'https://www.rainbow-integration.fr/wp-content/uploads/2022/01/ecm-768x512.jpg')),
                Expanded(
                    child: Text(
                  "Aucune quittance",
                  style: TextStyle(
                    color: constants.defaultSecondryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ))
              ],
            ),
    );
  }

// ------------- tab view
  DataRow ContratDataRow(Contrat contrat) {
    return DataRow(cells: [
      DataCell(Expanded(child: Text(contrat.numeroContrat!))),
      DataCell(Expanded(child: Text(contrat.primeContrat!))),
      DataCell(Expanded(child: Text(contrat.datePayementContrat!))),
      DataCell(Expanded(
          child: DecoratedBox(
              decoration: BoxDecoration(
                color: constants.someMap[contrat
                    .statueContrat], // Couleur de fond du bouton déroulant
                border: Border.all(
                    color: constants.MyGreyColor,
                    width: 1), // Bordure du bouton déroulant
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(contrat.statueContrat!),
              )))),
      DataCell(Expanded(
        child: Center(
          child: IconButton(
            icon: Icon(Icons.download),
            onPressed: () {},
          ),
        ),
      )),
    ]);
  }

// ------------ Mobile view
  List<DataColumn> _buildInvertedDataColumns() {
    return List.generate(
      constants.listeContratsMobile.length,
      (index) => DataColumn(
          label: (constants.listeContratsMobile[index].numeroContrat ==
                  'numero Contrat')
              ? Text('')
              : Text("Contrat ${index}")),
    );
  }

  List<DataRow> _buildInvertedDataRows() {
    List<String> headers = [
      "Numéro de contrat",
      "Prime mensuelle TTC",
      "Date paiement",
      "Statut",
      "Télécharger quittance"
    ];

    return List.generate(headers.length, (rowIndex) {
      return DataRow(
        cells: List.generate(constants.listeContratsMobile.length, (colIndex) {
          Contrat contrat = constants.listeContratsMobile[colIndex];
          String cellValue = "";

          switch (rowIndex) {
            case 0:
              cellValue = contrat.numeroContrat!;
              break;
            case 1:
              cellValue = contrat.primeContrat!;
              break;
            case 2:
              cellValue = contrat.datePayementContrat!;
              break;
            case 3:
              return (contrat.numeroContrat == 'numero Contrat')
                  ? DataCell(Text(constants.listeContratsMobile[0].statueContrat
                      .toString()))
                  : DataCell(DecoratedBox(
                      decoration: BoxDecoration(
                        color: constants.someMap[contrat
                            .statueContrat], // Couleur de fond du bouton déroulant
                        border: Border.all(
                            color: constants.MyGreyColor,
                            width: 1), // Bordure du bouton déroulant
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(contrat.statueContrat!),
                      )));

            case 4:
              return (contrat.numeroContrat == 'numero Contrat')
                  ? DataCell(Text(constants
                      .listeContratsMobile[0].telechargerContrat
                      .toString()))
                  : DataCell(
                      Center(
                        child: IconButton(
                          icon: Icon(Icons.download),
                          onPressed: () {},
                        ),
                      ),
                    );
          }

          return DataCell(Text(cellValue));
        }),
      );
    });
  }
}

import 'package:flutter/foundation.dart';
import 'package:gestpersonnel/Providers/Models/Motif.dart';

class Motifs with ChangeNotifier {
  List<Motif> _items = [
    Motif(id: 1, libelle: 'Absence non justifiée'),
    Motif(id: 2, libelle: 'Affection'),
    Motif(
        id: 3,
        libelle:
            'Arrêt de travail pour accident de travaux personnel à but lucratif'),
    Motif(id: 4, libelle: 'Arrêt de travail pour accident domestique'),
    Motif(
        id: 5,
        libelle: 'Arrêt de travail pour accident du trajet hors service'),
    Motif(id: 6, libelle: 'Arrêt de travail pour accident du travail'),
    Motif(
        id: 7, libelle: 'Arrêt de travail pour accident sportif hors service'),
    Motif(id: 8, libelle: 'Arrêt de travail pour maternité'),
    Motif(id: 9, libelle: 'Arrêt de travail pour repos maladie'),
    Motif(id: 10, libelle: 'Changement de catégorie'),
    Motif(id: 11, libelle: 'Congé annuele'),
    Motif(id: 12, libelle: 'Demande d\'explication'),
    Motif(id: 13, libelle: 'Maladie non professionnelle'),
    Motif(id: 14, libelle: 'Mise à disponibilité'),
    Motif(id: 15, libelle: 'Mise à pieds'),
    Motif(id: 16, libelle: 'Mutation'),
    Motif(id: 17, libelle: 'Permission'),
    Motif(id: 18, libelle: 'Promotion'),
    Motif(id: 19, libelle: 'Renvoie'),
    Motif(id: 20, libelle: 'Reprise de travail'),
    Motif(id: 21, libelle: 'Sanctions'),
    Motif(
        id: 22, libelle: 'Arrêt de travail pour accident du trajet de service'),
  ];

  List<Motif> get items {
    // if (_showFavotitesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }
}

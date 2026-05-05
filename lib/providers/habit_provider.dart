import 'package:flutter/material.dart';

class HabitProvider extends ChangeNotifier {
  
  int telaSelecionada = 0;

 
  List<String> listaPendentes = [
    "Separar lixo reciclável",
    "Economizar água",
    "Usar bicicleta",
  ];

  List<String> listaConcluidos = [];

 
  bool modoEscuro = false;

  
  void mudarAba(int indice) {
    telaSelecionada = indice;
    notifyListeners();
  }

  
  void finalizarHabito(String nomeDoHabito) {
    listaPendentes.remove(nomeDoHabito);
    listaConcluidos.add(nomeDoHabito);
    notifyListeners();
  }

  
  void adicionarHabito(String novoHabito) {
    if (novoHabito.trim().isEmpty) return;

    listaPendentes.add(novoHabito);
    notifyListeners();
  }

 
  void resetarTudo() {
    listaPendentes = [
      "Separar lixo reciclável",
      "Economizar água",
      "Usar bicicleta"
    ];
    listaConcluidos = [];
    notifyListeners();
  }

 
  void alternarTema() {
    modoEscuro = !modoEscuro;
    notifyListeners();
  }
}
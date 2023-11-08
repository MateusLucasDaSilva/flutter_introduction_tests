import 'package:flutter_testes_introduction/item.dart';

class Carrinho {
  final List<Item> items;
  Carrinho({
    required this.items,
  });

  double get total {
    if (items.isEmpty) {
      throw CarrinhoException();
    }

    return items.fold<double>(0.0,
        (double previousValue, Item element) => previousValue + element.value);
  }

  double get totalComImpost10PorCento {
    double imposto = 0.0;

    if (total < 10) {
      imposto = 0.0;
    } else {
      imposto = imposto10PorCento;
    }
    if (total > 30) {
      imposto = imposto20PorCento;
    }
    final double valorTotalComImporto = total + imposto;
    return valorTotalComImporto;
  }

  double get imposto10PorCento => total * 0.10;
  double get imposto20PorCento => total * 0.20;
}

class CarrinhoException implements Exception {}

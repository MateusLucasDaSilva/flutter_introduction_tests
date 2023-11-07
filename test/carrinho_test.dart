import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testes_introduction/carrinho.dart';
import 'package:flutter_testes_introduction/item.dart';

void main() {
  group(
    'Testes de calculo do valor total do carrinho',
    () {
      test('Deve calcular o valor total do carrinho', () {
        const double valueTotalExpect = 15.0;
        const double valueItemOne = 5.5;
        const double valueItemTwo = 6.5;
        const double valueItemThree = 3.0;

        ///PREPARAÇÃO
        final List<Item> items = <Item>[
          Item(name: 'Arroz', value: valueItemOne),
          Item(name: 'Feião', value: valueItemTwo),
          Item(name: 'Macarrão', value: valueItemThree),
        ];
        final Carrinho carrinho = Carrinho(items: items);

        ///AÇÃO OU EXECUÇÃO
        final double total = carrinho.total;

        ///VERIFICAÇÃO
        expect(total, valueTotalExpect);
        expect(items[0].value, valueItemOne);
        expect(items[1].value, valueItemTwo);
        expect(items[2].value, valueItemThree);
      });
      test('Deve calcular o valor quando o carrinho estiver vazio', () {
        ///PREPARAÇÃO
        final List<Item> items = <Item>[];
        final Carrinho carrinho = Carrinho(items: items);

        ///AÇÃO OU EXECUÇÃO
        final double total = carrinho.total;

        ///VERIFICAÇÃO
        expect(total, 0.0);
      });
    },
  );

  group('Teste de calculo do valor do carrinho com e imposto', () {
    test('Deve retornar o total com imposto', () {
      const double valueTotalExpect = 11.0;
      const double valueItemOne = 5.5;
      const double valueItemTwo = 4.5;

      final List<Item> items = <Item>[
        Item(name: 'Arroz', value: valueItemOne),
        Item(name: 'Feião', value: valueItemTwo)
      ];
      final Carrinho carrinho = Carrinho(items: items);
      final double total = carrinho.totalComImpost10PorCento;

      expect(total, valueTotalExpect);
    });

    test(
        'Deve retornar o valor total sem imposto caso o o valor total seja menor a 10 reais',
        () {
      const double valueTotalExpect = 9.9;
      const double valueItemOne = 5.4;
      const double valueItemTwo = 4.5;

      final List<Item> items = <Item>[
        Item(name: 'Arroz', value: valueItemOne),
        Item(name: 'Feião', value: valueItemTwo)
      ];
      final Carrinho carrinho = Carrinho(items: items);
      final double total = carrinho.totalComImpost10PorCento;

      expect(total, valueTotalExpect);
    });
    test(
        'Deve retornar o valor total com imposto caso o o valor total seja menor que 20 ',
        () {
      const double valueTotalExpect = 11;
      const double valueItemOne = 4.5;
      const double valueItemTwo = 5.5;

      final List<Item> items = <Item>[
        Item(name: 'Arroz', value: valueItemOne),
        Item(name: 'Feião', value: valueItemTwo)
      ];
      final Carrinho carrinho = Carrinho(items: items);
      final double total = carrinho.totalComImpost10PorCento;

      expect(total, valueTotalExpect);
    });
    test(
        'Deve retornar o valor total com 20% de imposto caso o total seja maior que 30',
        () {
      const double valueTotalExpect = 11;
      const double valueItemOne = 4.5;
      const double valueItemTwo = 5.5;

      final List<Item> items = <Item>[
        Item(name: 'Arroz', value: valueItemOne),
        Item(name: 'Feião', value: valueItemTwo)
      ];
      final Carrinho carrinho = Carrinho(items: items);
      final double total = carrinho.totalComImpost10PorCento;

      expect(total, valueTotalExpect);
    });
  });
}

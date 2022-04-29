// OCP nos informa que devemos ser capazes de extender um comportamento de classe, sem modifica-lo;

class Pagamento {
  void pagarBoleto() => print("pagar boleto");
  void pagarImposto() => print("pagando imposto");
}

//E se precisarmos adicionar um novo tipo de pagamento? desta forma estamos sujeitos a modificar nosso código já em produção
//Esta alteração ira gerar um novo binário para lugares onde não necessita deste novo meio de pagamento.

//Solução:
//Como solução devemos ser capazes de extender o funcionamento da nossa classe de pagamento ou seja "pagar"
//porem sem modifcar a classe existente

abstract class Pagamento2 {
  int valor = 20;
  void pagar();
}

//na extensão reutilizzamos o valor
class PagamentoBoleto extends Pagamento2 {
  @override
  void pagar() => print("Pagando boleto $valor");
}

//na herança re-implementamos o valor
class PagamentoImposto implements Pagamento2 {
  @override
  int valor = 10;

  @override
  void pagar() => print("Pagando imposto $valor");
}

// nova forma de pagamento;
class PagamentoCartao extends Pagamento2 {
  @override
  void pagar() => print("Pagando cartao");
}

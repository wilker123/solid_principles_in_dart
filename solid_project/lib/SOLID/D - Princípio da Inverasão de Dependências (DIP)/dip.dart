// DIP - Depender de abstrações e não de classes concretas

class PagamentoRepository {
  void save() => print("salvando pagamento");
}

class ContaCorrente {
  late PagamentoRepository _repository;
  ContaCorrente() {
    _repository = PagamentoRepository();
  }

  void executarAlgumaLogica() {
    _repository.save();
  }
}

/*

main(List<String> args){
  ContaCorrente c = ContaCorrente();
  c.executarAlgumaLogica
}

  A violação acontece na linha 10, estamos dependendo de uma class concreta
  Se quisermos fazer o mock por exemple do repository não é possível

  Solução:
  Vamos inverter a responsabilidade, deixar que quem chamar a ContaCorrente resolva a dependecia do repository


*/

abstract class IPagamentoRepository {
  void save();
}

class PagamentoRepositoryImp implements IPagamentoRepository {
  @override
  void save() => print('implementação');
}

class PagamentoRepositoryMock implements IPagamentoRepository {
  @override
  void save() => print('Mock');
}

class ContaCorrente2 {
  late IPagamentoRepository _repository;
  ContaCorrente2(IPagamentoRepository repository) {
    _repository = repository;
  }

  void executarAlgumaLogica() {
    _repository.save();
  }
}

main(List<String> args) {
  ContaCorrente2 c = ContaCorrente2(PagamentoRepositoryImp());
  c.executarAlgumaLogica();
  c = ContaCorrente2(PagamentoRepositoryMock());
  c.executarAlgumaLogica();
}

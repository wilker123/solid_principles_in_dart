//" Uma classe deve ter apenas um motivo para mudar";
//"Sua responsabilidade é sempre em cima de um e apenas um ator";

class ContaCorrente {
  validarContaExiste() {
    // lógica crucial do negocio;
  }

  salvarModificacoes() {
    print("Salvand no db...");
  }
}

/*

 Solução: Devemos separar cada responsabilidade para sua regra de negocio crucia,
 um objeto não pode e deve fazer mais do que é o dominio dele.

*/

class ContaCorrenteRepository {
  void save() => print('Salvando no db..');
}

class ContaCorrente2 {
  ContaCorrenteRepository _repository = new ContaCorrenteRepository();

  validarContaExiste() {
    //lógica crucial de negocio;
  }

  void salvarModificacoes() {
    _repository.save();
  }
}

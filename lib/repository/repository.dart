abstract class RepositoryImplementing {
  Future<Map<String, dynamic>> getUserByCPF(String cpf);

  Future<List<dynamic>> getUserByName(String name);
}

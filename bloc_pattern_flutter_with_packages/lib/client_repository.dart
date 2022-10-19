import 'package:bloc_pattern_flutter_with_packages/client.dart';

class ClientRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(name: "Hícaro", age: 10),
      Client(name: "Hilbert", age: 30),
      Client(name: "Maria", age: 10)
    ]);

    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);
    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients;
  }
}

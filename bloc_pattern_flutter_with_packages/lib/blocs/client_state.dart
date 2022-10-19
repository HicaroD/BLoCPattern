import '../client.dart';

abstract class ClientState {
  final List<Client> clients;

  ClientState(
      {required this.clients}); // Basicamente isso que eu quero mostrar na tela
}

class ClientInitialState extends ClientState {
  ClientInitialState() : super(clients: []);
}

class ClientSuccessState extends ClientState {
  ClientSuccessState({required List<Client> clients}) : super(clients: clients);
}

// Possíveis outros estados: ClientErrorState para representar um estado onde as
// não deram certo
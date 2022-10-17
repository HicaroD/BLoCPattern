import 'dart:async';

import 'package:learning_bloc_pattern_flutter/ClientRepository.dart';
import 'package:learning_bloc_pattern_flutter/blocs/client_events.dart';

import '../client.dart';
import 'client_state.dart';

class ClientBloc {
  final ClientRepository _clientRepository = ClientRepository();

  // Agora irei criar as Streams
  final StreamController<ClientEvent> _inputClientController =
      StreamController<ClientEvent>(); // Input

  final StreamController<ClientState> _outputClientController =
      StreamController<ClientState>(); // Output

  Sink<ClientEvent> get inputClient => _inputClientController.sink; // Entrada
  Stream<ClientState> get stream => _outputClientController.stream; // Saída

  ClientBloc() {
    _inputClientController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ClientEvent clientEvent) {
    List<Client> clients = [];

    if (clientEvent is LoadClientEvent) {
      clients = _clientRepository.loadClients();
    } else if (clientEvent is AddClientEvent) {
      clients = _clientRepository.addClient(clientEvent.client);
    } else if (clientEvent is RemoveClientEvent) {
      clients = _clientRepository.removeClient(clientEvent.client);
    }
    _outputClientController.add(ClientSuccessState(clients: clients));
  }
}

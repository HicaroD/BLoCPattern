import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_flutter_with_packages/client_repository.dart';

import '../client.dart';
import 'client_event.dart';
import 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientRepository _clientRepository = ClientRepository();

  ClientBloc() : super(ClientInitialState()) {
    on<LoadClientEvent>((event, emit) {
      final List<Client> clients = _clientRepository.loadClients();
      emit(ClientSuccessState(clients: clients));
    });

    on<AddClientEvent>((event, emit) {
      final List<Client> clients = _clientRepository.addClient(event.client);
      emit(ClientSuccessState(clients: clients));
    });
    on<RemoveClientEvent>((event, emit) {
      final List<Client> clients = _clientRepository.removeClient(event.client);
      emit(ClientSuccessState(clients: clients));
    });
  }
}

import 'package:flutter/material.dart';
import 'package:learning_bloc_pattern_flutter/blocs/client_events.dart';
import 'package:learning_bloc_pattern_flutter/client.dart';

import 'blocs/client_bloc.dart';
import 'blocs/client_state.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  late final ClientBloc clientBloc;

  @override
  void initState() {
    super.initState();
    clientBloc = ClientBloc();
    clientBloc.inputClient
        .add(LoadClientEvent()); // Dizendo ao Bloc para carregar os clients
  }

  @override
  void dispose() {
    clientBloc.inputClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clients",
        ),
        actions: [
          IconButton(
            onPressed: () {
              clientBloc.inputClient.add(
                AddClientEvent(
                  client: Client(name: "Maria José dos Santos"),
                ),
              );
            },
            icon: const Icon(Icons.person_add),
          )
        ],
      ),
      body: StreamBuilder<ClientState>(
        stream: clientBloc.stream,
        builder: (context, snapshot) {
          final clients =
              snapshot.data?.clients ?? []; // Se snapshot.data é nulo, pegue []
          return ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(clients[index].name),
              trailing: IconButton(
                icon: const Icon(Icons.person_remove),
                onPressed: (() => clientBloc.inputClient.add(
                      RemoveClientEvent(client: clients[index]),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}

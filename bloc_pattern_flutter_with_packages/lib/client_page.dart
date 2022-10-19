import 'package:bloc_pattern_flutter_with_packages/bloc/client_bloc.dart';
import 'package:bloc_pattern_flutter_with_packages/bloc/client_event.dart';
import 'package:bloc_pattern_flutter_with_packages/bloc/client_state.dart';
import 'package:bloc_pattern_flutter_with_packages/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  late final ClientBloc bloc;

  // initState é chamado apenas uma vez para gerar o estado inicial do widget
  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();
    bloc.add(LoadClientEvent()); // Adicionando evento
  }

  // dispose é chamado todas as vezes que um widget está prestes a ser removido
  // permanente da tree de widgets do Flutter
  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    // BlocBuilder vem do "flutter_bloc" e serve justamente para montar uma
    // Stream de dados
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clientes"),
        actions: [
          IconButton(
            onPressed: () {
              bloc.add(
                AddClientEvent(
                  client: Client(name: "Random person", age: 3000),
                ),
              );
            },
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: ((context, state) {
          if (state is ClientSuccessState) {
            final clients = state.clients;
            return ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(clients[index].name),
                  subtitle: Text(clients[index].age.toString()),
                  trailing: IconButton(
                    onPressed: () =>
                        bloc.add(RemoveClientEvent(client: clients[index])),
                    icon: const Icon(Icons.person_remove),
                  ),
                );
              },
            );
          } else if (state is ClientErrorState) {
            return const Text("Something went wrong!");
          } else if (state is ClientInitialState) {
            return const CircularProgressIndicator();
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mge_maulana_ade_fathurrozaqi/home/list_bloc/list_bloc.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          if (state is ListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ListError) {
            return SnackBar(content: Text('Error: ${state.error}'));
          } else  if (state is ListLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      final item = state.list[index];
                      return ListTile(
                        leading: Image.network(item['thumbnailUrl']),
                        title: Text(item['title']),
                        subtitle: Text(item['url']),
                        onTap: () {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Text(item['title']),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(item['url']),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                )
                              ],
                            );
                          });
                        },
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Delete item'),
                                  content: const Text('Are you sure want to delete this item?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.read<ListBloc>().add(DeleteList(item));
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Yes'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('No'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListBloc>().add(const FetchList());
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.download, color: Colors.white),
      ),
    );
  }
}
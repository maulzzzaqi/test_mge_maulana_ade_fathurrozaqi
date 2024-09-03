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
                        trailing: IconButton(
                          onPressed: () {},
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
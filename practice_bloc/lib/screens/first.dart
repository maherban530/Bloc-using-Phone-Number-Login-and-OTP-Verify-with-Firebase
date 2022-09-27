import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:practice/bloc/first_screen/firstbloc_bloc.dart';
import 'package:practice/repository/userrepo.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<String> itme = ['en', 'es,ar,ur'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FirstblocBloc, FirstblocState>(
        builder: (context, state) {
          if (state is FirstBlocLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FirstBlocLoadedState) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 12,
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/third',
                            arguments: state.users![index].login!);
                      },
                      leading: CircleAvatar(
                        minRadius: 30,
                        maxRadius: 30,
                        backgroundImage:
                            NetworkImage(state.users![index].avatarUrl!),
                      ),
                      title: Text(
                        state.users![index].login!,
                        style: TextStyle(fontSize: 24),
                      ),
                      subtitle: state.users![index].type! == "User"
                          ? Text(
                              state.users![index].type!,
                            )
                          : Text(
                              state.users![index].type!,
                            ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: state.users!.length);
          }
          return Container();
        },
      ),
    );
  }

  @override
  void initState() {
    context.read<FirstblocBloc>().add(GetDataFromNetworkEvent());
    // context.read<UserRepository>().getUserList();
  }
}

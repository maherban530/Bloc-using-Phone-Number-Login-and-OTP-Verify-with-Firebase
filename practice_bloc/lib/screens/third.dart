import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/lang-bloc/lang_cubit.dart';
import 'package:practice/bloc/second_screen/secondscreen_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SecondScreen extends StatefulWidget {
  String? login;
  SecondScreen({Key? key, required this.login}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SecondscreenBloc, SecondscreenState>(
        builder: (context, state) {
          if (state is SecondScreenLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is SecondScreenLoaded) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    color: Colors.green[50],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(0),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 28,
                              ),
                              onPressed: () {},
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          state.userdetail!.name!,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      MediaQuery.of(context).size.width / 6),
                                  bottomRight: Radius.circular(
                                      MediaQuery.of(context).size.width / 6))),
                          height: 210,
                        ),
                        Positioned(
                            child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CircleAvatar(
                            maxRadius: 80,
                            minRadius: 80,
                            backgroundImage:
                                NetworkImage(state.userdetail!.avatarUrl!),
                          ),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () =>
                                  launchUrl(state.userdetail!.reposUrl!),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      state.userdetail!.publicRepos!.toString(),
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('repository',
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: VerticalDivider(
                            width: 2,
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(state.userdetail!.followers!.toString(),
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('followers',
                                    style: TextStyle(fontSize: 16))
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: VerticalDivider(
                            width: 2,
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(state.userdetail!.following!.toString(),
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('following',
                                    style: TextStyle(fontSize: 16))
                              ],
                            )),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      context.read<LanguageCubit>().changeLanguage("es");
                    },
                    child: Text("Spainish"),
                    color: Colors.red,
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  void initState() {
    context
        .read<SecondscreenBloc>()
        .add(GetDataAfterDependancies(widget.login));
  }

  launchUrl(String url) async {
    // if (!await launch(_url)) throw 'Could not launch $_url';
    if (!await launch(url)) throw 'Could not Launch $url';
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/first_screen/firstbloc_bloc.dart';
import 'package:practice/bloc/lang-bloc/lang_cubit.dart';
import 'package:practice/bloc/second_screen/secondscreen_bloc.dart';
import 'package:practice/repository/userrepo.dart';
import 'package:practice/routes/routes.dart';
import 'package:practice/screens/home.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [RepositoryProvider(create: (context) => UserRepository())],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<FirstblocBloc>(
                create: (context) => FirstblocBloc(
                    RepositoryProvider.of<UserRepository>(context))),
            BlocProvider<SecondscreenBloc>(
                create: (context) => SecondscreenBloc(
                    RepositoryProvider.of<UserRepository>(context)))
          ],
          child: BlocProvider<LanguageCubit>(
            create: (_) => LanguageCubit(const Locale('en')),
            child: BlocBuilder<LanguageCubit, Locale>(
              builder: (context, state) {
                return MaterialApp(
                  locale: state,
                  title: 'Block Example',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  onGenerateRoute: AppRoutes().onGenerateRoute,
                  initialRoute: "/",
                  // localizationsDelegates: AppLocalizations
                  //     .localizationsDelegates,
                  // supportedLocales: AppLocalizations.supportedLocales,
                );
              },
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:practice/bloc/lang-bloc/lang_cubit.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String item = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
              onChanged: (String? newValue) {
                setState(() {
                  item = newValue!;
                  context.read<LanguageCubit>().changeLanguage(item);
                });
              },
              value: item,
              items: <String>['en', 'es', 'ar', 'ur']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList())
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('welcome'),
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: () => Navigator.pushNamed(context, '/first'),
              child: Text('next'),
            ),
          ],
        ),
      ),
    );
  }
}

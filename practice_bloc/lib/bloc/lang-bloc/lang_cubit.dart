import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale>{
  LanguageCubit(Locale initialState) : super(initialState);

  void changeLanguage (String data)
  {
    emit(Locale('$data'));
  }

}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice/data/user_details.dart';
import 'package:practice/repository/userrepo.dart';

part 'secondscreen_event.dart';
part 'secondscreen_state.dart';

class SecondscreenBloc extends Bloc<SecondscreenEvent, SecondscreenState> {
  final UserRepository networkRepo;
  UserDetails? userdetails;
  SecondscreenBloc(this.networkRepo) : super(SecondscreenInitial()) {
    on<GetDataAfterDependancies>((event, emit) async{
      emit(SecondScreenLoading());
      userdetails = await networkRepo.getUsetDetails(event.login);
      emit(SecondScreenLoaded(userdetails));
    });
  }
}

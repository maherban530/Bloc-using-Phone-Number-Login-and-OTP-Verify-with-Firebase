import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice/data/user_list.dart';
import 'package:practice/repository/userrepo.dart';

part 'firstbloc_event.dart';
part 'firstbloc_state.dart';

class FirstblocBloc extends Bloc<FirstblocEvent, FirstblocState> {
  final UserRepository networkRepo;
  List<UserList>? users;
  FirstblocBloc(this.networkRepo) : super(FirstblocInitial()) {
    on<GetDataFromNetworkEvent>((event, emit) async {
      emit(FirstBlocLoadingState());
      users = await networkRepo.getUserList();
      emit(FirstBlocLoadedState(users));
    });
  }
}

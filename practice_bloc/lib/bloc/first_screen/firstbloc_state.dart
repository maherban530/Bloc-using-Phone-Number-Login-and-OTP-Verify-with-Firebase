part of 'firstbloc_bloc.dart';

@immutable
abstract class FirstblocState {}

class FirstblocInitial extends FirstblocState {}

class FirstBlocLoadingState extends FirstblocState {}

class FirstBlocLoadedState extends FirstblocState {
  List<UserList>? users;

  FirstBlocLoadedState(this.users);
}

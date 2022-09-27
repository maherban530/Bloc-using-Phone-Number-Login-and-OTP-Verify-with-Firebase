part of 'secondscreen_bloc.dart';

@immutable
abstract class SecondscreenEvent {}

class GetDataAfterDependancies extends SecondscreenEvent{
  String? login;
  GetDataAfterDependancies(this.login);
}
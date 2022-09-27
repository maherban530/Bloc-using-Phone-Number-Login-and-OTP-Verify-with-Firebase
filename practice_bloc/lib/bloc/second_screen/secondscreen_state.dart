part of 'secondscreen_bloc.dart';

@immutable
abstract class SecondscreenState {}

class SecondscreenInitial extends SecondscreenState {}

class SecondScreenLoading extends SecondscreenState{}

class SecondScreenLoaded extends SecondscreenState{
  UserDetails? userdetail;

  SecondScreenLoaded(this.userdetail);
}

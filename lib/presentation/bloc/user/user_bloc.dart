import 'dart:async';

import 'package:e_commerce_app/data/models/user_model/user_model.dart';
import 'package:e_commerce_app/repository/user_repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial() ) {
    on<FetchAllUserEvent>(fetchAllUsersEvent);
  }

  FutureOr<void> fetchAllUsersEvent(
      FetchAllUserEvent event, Emitter<UserState> emit) async {
    emit(UserDetailFetchingLoadingState());
    List<UserModel> users = await UserRepo.fetchUserDetails();
    if (users.isNotEmpty) {
      emit(UserDetailFetchingSuccessState(users: users));
    } else {
      emit(UserDetailFetchingErrorState());
    }
  }

}

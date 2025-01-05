import 'dart:async';

import 'package:e_commerce_app/data/models/user_model/user_model.dart';
import 'package:e_commerce_app/repository/profile_repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileInitialFetchEvent>(userDetailInitialFetchEvent);
  }

  FutureOr<void> userDetailInitialFetchEvent(
      ProfileInitialFetchEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileFetchingLoadingState());
    ProfileDetailsModel? userDetails = await ProfileRepo.fetchUserDetails();
    if (userDetails != null) {
      emit(ProfileFetchingSucessState(
        userDetails: userDetails.user,
        // posts: userDetails.posts,
      ));
    } else {
      emit(ProfileFetchingErrorState());
    }
  }
}

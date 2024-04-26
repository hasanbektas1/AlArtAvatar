abstract class AvatarState {}

class AvatarInitial extends AvatarState {}

class AvatarLoading extends AvatarState {}

class AvatarLoaded extends AvatarState {
  final dynamic image;

  AvatarLoaded({required this.image});
}

class PromptLoaded extends AvatarState {
  String promptGetLoaded;
  String userID;

  PromptLoaded({
    required this.promptGetLoaded,
    required this.userID,
  });
}

class AvatarError extends AvatarState {}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_event.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_state.dart';
import 'package:alartavatar/repository/request_avatar_repo.dart';

class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  final RequestAvatarRepository articleRepository;
  String premiumUser = "1";

  String promptbloc = '';
  String userIDname = '';
  String imageWidth = '512';
  String imageHeight = '512';

  AvatarBloc({required this.articleRepository}) : super(AvatarInitial()) {
    on<CreateAvatarEvent>(_onAvatarCreate);
    on<SendPromptInfo>(_onAvatarPrompt);
    on<SendRatioInfo>(_onAvatarRatio);
    on<SendPremiumUserInfo>(_onPremiumUser);
  }

  void _onAvatarCreate(
      CreateAvatarEvent event, Emitter<AvatarState> emit) async {
    emit(AvatarLoading());

    try {
      final imageUint8List = await articleRepository.fetchImage(
          promptbloc, imageWidth, imageHeight, event.context);
      emit(AvatarLoaded(image: imageUint8List));
    } catch (e) {
      emit(AvatarError());
    }
  }

  void _onAvatarPrompt(SendPromptInfo event, Emitter<AvatarState> emit) async {
    promptbloc = event.prompt;
    userIDname = event.userId!;
    try {} catch (e) {
      emit(AvatarError());
    }
  }

  void _onAvatarRatio(SendRatioInfo event, Emitter<AvatarState> emit) async {
    imageWidth = event.imageWidth;
    imageHeight = event.imageHeight;
    try {} catch (e) {
      emit(AvatarError());
    }
  }

  void _onPremiumUser(
      SendPremiumUserInfo event, Emitter<AvatarState> emit) async {
    premiumUser = event.premiumUSer;
    try {} catch (e) {
      emit(AvatarError());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/presentation/widgets/custom_appbar.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/size/size_extension.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AudioViewerScreen extends StatefulWidget {
  final BookModel bookModel;

  const AudioViewerScreen({super.key, required this.bookModel});

  @override
  State<AudioViewerScreen> createState() => _AudioViewerScreenState();
}

class _AudioViewerScreenState extends State<AudioViewerScreen> {
  late YoutubePlayerController _controller;
  bool isPlay = true;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.bookModel.audio);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    isPlay = true;
    _controller.dispose();
    super.dispose();
  }

  void seekForward() {
    final current = _controller.value.position;
    _controller.seekTo(current + const Duration(seconds: 15));
    setState(() {
      isPlay = true;
    });
  }

  void seekBackward() {
    final current = _controller.value.position;
    _controller.seekTo(current - const Duration(seconds: 15));
    setState(() {
      isPlay = true;
    });
  }

  void pauseVideo() {
    _controller.pause();
    setState(() {
      isPlay = false;
    });
  }

  void playVideo() {
    _controller.play();
    setState(() {
      isPlay = true;
    });
  }

  getPlayerState(PlayerState state) {
    switch (state) {
      case PlayerState.playing:
        {
          isPlay = true;
        }
      case PlayerState.paused:
        {
          isPlay = false;
        }
      case PlayerState.ended:
        {
          isPlay = false;
        }
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Audio',
            isLeading: true,
          ),
          body: Column(
            children: [
              player,
              16.ph,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.bookModel.name,
                                style: CustomTextStyle.displayMedium(context,
                                    fontSize: 28),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      widget.bookModel.author,
                                      style: CustomTextStyle.displaySmall(
                                        context,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  16.pw,
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 1, color: AppColors.neutral60),
                                    ),
                                    child: Text(
                                      widget.bookModel.type,
                                      style:
                                          CustomTextStyle.bodyMedium(context),
                                    ),
                                  )
                                ],
                              ),
                              16.ph,
                              Text(
                                widget.bookModel.description,
                                style: CustomTextStyle.headlineSmall(
                                  context,
                                  color: AppColors.neutral80,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      16.ph,
                      ValueListenableBuilder<YoutubePlayerValue>(
                        valueListenable: _controller,
                        builder: (context, value, _) {
                          getPlayerState(value.playerState);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.replay_10,
                                  color: AppColors.primary,
                                ),
                                onPressed: seekBackward,
                                iconSize: 36,
                              ),
                              InkWell(
                                onTap: () {
                                  isPlay ? pauseVideo() : playVideo();
                                },
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary50,
                                    shape: BoxShape.circle,
                                  ),
                                  child: isPlay
                                      ? const Icon(
                                          Icons.pause,
                                          size: 48,
                                          color: AppColors.white,
                                        )
                                      : const Icon(
                                          Icons.play_arrow,
                                          size: 48,
                                          color: AppColors.white,
                                        ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.forward_10,
                                  color: AppColors.primary,
                                ),
                                onPressed: seekForward,
                                iconSize: 36,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              48.ph,
            ],
          ),
        );
      },
    );
  }
}

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeAppDemo extends StatefulWidget {
  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '5JyTa1mPcVo',
      params: const YoutubePlayerParams(
        playlist: [
          '5JyTa1mPcVo',
          'Yy3o6EzhRk8',
          '99DfoGjfU6Y',
          'BmnX1lJL72M',
          'vn5Rx95W6tE',
        ],
        startAt: const Duration(minutes: 0, seconds: 0),
        showControls: true,
        showFullscreenButton: false,
        desktopMode: true,
        privacyEnhanced: true,
        useHybridComposition: true,
        autoPlay: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      log('Exited Fullscreen');
    };
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (kIsWeb && constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: player),
                  const SizedBox(
                    width: 500,
                    child: SingleChildScrollView(
                      child: Controls(),
                    ),
                  ),
                ],
              );
            }
            return ListView(
              children: [
                _buildVideoStack(player),
                const Controls(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildVideoStack(YoutubePlayerIFrame player) {
    return Stack(
      children: [
        player,
        Positioned.fill(
          child: YoutubeValueBuilder(
            controller: _controller,
            builder: (context, value) {
              return AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Material(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          YoutubePlayerController.getThumbnail(
                            videoId: _controller.params.playlist.first,
                            quality: ThumbnailQuality.medium,
                          ),
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                crossFadeState: value.isReady
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

///
class Controls extends StatelessWidget {
  ///
  const Controls();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _space,
          //MetaDataSection(),
          _buildTile("Perspektiva"),
          _space,
          _buildTile("Startbahn. Arbeitsschule Antoniousheim."),
          _space,
          _buildTile("Ausbildung mit Behinderung."),
          _space,
          _buildTile("Qualifizierungsbausteine"),
          _space,
          _buildTile("Barrieren brechen - Inklusion stärken"),
          _space,
        ],
      ),
    );
  }

  Container _buildTile(String text) {
    return Container(
          height: 50,
          width: double.infinity,
          child: Center(child: Text(text)),
          color: Colors.deepOrange,
        );
  }

  Widget get _space => const SizedBox(height: 10);
}

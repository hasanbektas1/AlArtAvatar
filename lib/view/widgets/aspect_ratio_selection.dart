import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_bloc.dart';
import 'package:alartavatar/bloc/avatar_bloc.dart/create_avatar_event.dart';

class AspectRatioSelection extends StatefulWidget {
  @override
  State<AspectRatioSelection> createState() => _AspectRatioSelectionState();
}

class _AspectRatioSelectionState extends State<AspectRatioSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Aspect Ratio'),
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AspectRatioOption(
            ratio: '1:1',
            width: 30,
            height: 30,
          ),
          AspectRatioOption(
            ratio: '3:2',
            width: 30,
            height: 10,
          ),
          AspectRatioOption(
            ratio: '2:3',
            width: 30,
            height: 20,
          ),
        ],
      ),
    );
  }
}

class AspectRatioOption extends StatefulWidget {
  final String ratio;
  final double width;
  final double height;

  const AspectRatioOption({
    Key? key,
    required this.ratio,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<AspectRatioOption> createState() => _AspectRatioOptionState();
}

class _AspectRatioOptionState extends State<AspectRatioOption> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          print(isSelected);
        });
        if (widget.ratio == "1:1") {
          print("İstek 1:1");
          context
              .read<AvatarBloc>()
              .add(SendRatioInfo(imageWidth: "320", imageHeight: "320"));
        } else if (widget.ratio == "3:2") {
          print("İstek 3:2");
          context
              .read<AvatarBloc>()
              .add(SendRatioInfo(imageWidth: "500", imageHeight: "320"));
        } else if (widget.ratio == "2:3") {
          print("İstek 2:3");
          context
              .read<AvatarBloc>()
              .add(SendRatioInfo(imageWidth: "320", imageHeight: "500"));
        }

        print("Tıklandı: ${widget.ratio}");
      },
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF33DB23) : const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 8),
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.ratio,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

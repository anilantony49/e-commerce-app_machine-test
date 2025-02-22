import 'package:dotted_border/dotted_border.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginAssets extends StatefulWidget {
  const LoginAssets({super.key});

  @override
  State<LoginAssets> createState() => _LoginAssetsState();
}

class _LoginAssetsState extends State<LoginAssets>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _animation = Tween<double>(begin: 0.2, end: 0).animate(_controller);

    _controller.addListener(() {
      if (mounted && context.mounted) {
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedRotation(
            turns: _animation.value,
            duration: const Duration(seconds: 30),
            child: DottedBorder(
              borderType: BorderType.Circle,
              radius: const Radius.circular(30),
              color: theme.colorScheme.secondary,
              strokeWidth: 1,
              dashPattern: const [10, 10],
              child: Container(
                height: 400,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 60,
                      left: 20,
                      child: RotationTransition(
                        turns: _animation,
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(profileTwo),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 90,
                      right: 0,
                      child: RotationTransition(
                        turns: _animation,
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(profileThree),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      right: 30,
                      child: RotationTransition(
                        turns: _animation,
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(profileFour),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 90,
                      left: 0,
                      child: RotationTransition(
                        turns: _animation,
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(profileFive),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 90,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(profileOne),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

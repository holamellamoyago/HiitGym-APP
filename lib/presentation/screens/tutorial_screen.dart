import 'package:flutter/material.dart';
import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageURL;
  final int id;

  SlideInfo(this.title, this.caption, this.imageURL, this.id);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca tu entreno personalizado',
      'Officia nulla non laborum reprehenderit ea in est laborum. Est labore cupidatat do dolor id irure sint veniam non anim excepteur. Duis ullamco do aliqua velit consequat cupidatat fugiat do irure laborum adipisicing pariatur proident adipisicing. Ex nisi ad cillum reprehenderit mollit sunt est quis commodo dolor mollit pariatur. Proident commodo occaecat amet fugiat proident qui.',
      'assets/presentacion1.png',
      1),
  SlideInfo(
      'Sigue tu propio ritmo',
      'Officia nulla non laborum reprehenderit ea in est laborum. Est labore cupidatat do dolor id irure sint veniam non anim excepteur. Duis ullamco do aliqua velit consequat cupidatat fugiat do irure laborum adipisicing pariatur proident adipisicing. Ex nisi ad cillum reprehenderit mollit sunt est quis commodo dolor mollit pariatur. Proident commodo occaecat amet fugiat proident qui.',
      'assets/presentacion2.png',
      2),
  SlideInfo(
      'Sube tus propios TikGyms',
      'Officia nulla non laborum reprehenderit ea in est laborum. Est labore cupidatat do dolor id irure sint veniam non anim excepteur. Duis ullamco do aliqua velit consequat cupidatat fugiat do irure laborum adipisicing pariatur proident adipisicing. Ex nisi ad cillum reprehenderit mollit sunt est quis commodo dolor mollit pariatur. Proident commodo occaecat amet fugiat proident qui.',
      'assets/presentacion3.png',
      3),
];

class TutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController pageviewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
              children: [
        PageView(
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: slides
          .map(
            (slideData) => _Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageURL: slideData.imageURL,
                id: slideData.id),
          )
          .toList(),
            ),
        endReached ? const _ButtonLogin() : const SizedBox()
              ],
            ));
  }
}

class _ButtonLogin extends StatelessWidget {
  const _ButtonLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        right: 20,
        child: FadeInRight(
          child: FilledButton(
            child: const Text('Login'),
            onPressed: () {
              context.push('/login_screen');
            },
          ),
        ));
  }
}

// class _Slides extends StatelessWidget {
//   const _Slides({
//     super.key,
//     required this.pageviewController,
//   });

//   final PageController pageviewController;

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageURL;
  final int id;

  const _Slide({
    super.key,
    required this.title,
    required this.caption,
    required this.imageURL,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              imageURL,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CirclePageIndicator(
                    selectedDotColor: colors.primary,
                    currentPageNotifier: ValueNotifier(id - 1),
                    itemCount: slides.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

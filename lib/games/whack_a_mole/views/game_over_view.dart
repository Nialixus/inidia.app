part of '../main.dart';

class GameoverView extends StatelessWidget {
  const GameoverView({super.key, required this.controller});
  final LevelController controller;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Center(
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Game Over',
                  style: TextStyle(
                    color: Colors.brown,
                    fontFamily: 'WhackAMole',
                    fontSize: 40.0,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Your Record\n',
                    children: [
                      TextSpan(
                        text: controller.result
                            ?.toString()
                            .replaceAll(RegExp(r'^\d+:|(?=\.).*'), ''),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: kToolbarHeight),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    controller.start();
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                  ),
                  child: const Text(
                    'Try Again',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

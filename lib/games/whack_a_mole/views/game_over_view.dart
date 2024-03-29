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
                Container(
                  alignment: Alignment.center,
                  height: kToolbarHeight * 1.5,
                  width: 200.0,
                  child: Text.rich(
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
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        controller.start();
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                      ),
                      child: const Text(
                        'Try Again',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: IconButton(
                        onPressed: () async {
                          await launchUrl(
                            Uri.parse(
                              'https://github.com/Nialixus/inidia.app/tree/main/lib/games/whack_a_mole',
                            ),
                          );
                        },
                        icon: Image.asset(
                          'assets/shared/github.png',
                          width: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

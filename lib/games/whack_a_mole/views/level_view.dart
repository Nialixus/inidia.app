part of '../main.dart';

class LevelView extends StatefulWidget {
  const LevelView({super.key});

  @override
  State<LevelView> createState() => _LevelViewState();
}

class _LevelViewState extends State<LevelView> {
  final LevelController controller = LevelController();

  @override
  void initState() {
    super.initState();
    controller
      ..start()
      ..addListener(() {
        if (controller.isGameOver) {
          showDialog(
            context: context,
            builder: (_) => GameoverView(controller: controller),
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/games/whack_a_mole/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: ListenableBuilder(
              listenable: controller,
              builder: (context, _) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          countdown(controller.countdown),
                          style: const TextStyle(
                            fontFamily: 'WhackAMole',
                            fontSize: 40.0,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final size = constraints.biggest / 3;
                          return Wrap(
                            children: [
                              for (int mole = 0; mole < 9; mole++)
                                MoleView(
                                  size: size,
                                  onTap: controller.stop,
                                )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

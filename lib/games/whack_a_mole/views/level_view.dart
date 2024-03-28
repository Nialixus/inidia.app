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
    bool isDialogOpened = false;
    controller
      ..start()
      ..addListener(() async {
        if (controller.isGameOver && !isDialogOpened) {
          isDialogOpened = true;
          await showDialog(
            context: context,
            builder: (_) => GameoverView(controller: controller),
          );
          isDialogOpened = false;
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
              'assets/games/whack_a_mole/bg.png',
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
                          '${controller.countdown}'
                              .replaceAll(RegExp(r'^\d+:|(?=\.).*'), ''),
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
                          final rows = sqrt(controller.moles.length).ceil();
                          final size = constraints.biggest / rows.toDouble();
                          return Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              for (var mole in controller.moles)
                                MoleView(
                                  mole,
                                  size: size,
                                  onTap: () => controller.onTap(mole),
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

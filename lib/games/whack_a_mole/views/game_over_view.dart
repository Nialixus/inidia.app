part of '../main.dart';

class GameoverView extends StatefulWidget {
  const GameoverView({super.key, required this.controller});
  final LevelController controller;

  @override
  State<GameoverView> createState() => _GameoverViewState();
}

class _GameoverViewState extends State<GameoverView> {
  late final countdown = TextEditingController(
    text: widget.controller._duration.inSeconds.toString(),
  );

  late final moles = TextEditingController(
    text: widget.controller._length.toString(),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          width: 300.0,
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
                        text: widget.controller.result
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
                    onPressed: onTap,
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
              const Divider(height: kToolbarHeight),
              for (int i = 0; i < 2; i++)
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  color: Colors.black12,
                  width: 200.0,
                  height: 50.0,
                  child: TextField(
                    maxLength: 4,
                    controller: [countdown, moles][i],
                    onSubmitted: (_) => onTap(),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5.0),
                      labelText: ['Set Countdown (in Seconds)', 'Set Moles'][i],
                      counterText: '',
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  void onTap() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => LevelView(
          moles: int.parse(moles.text),
          duration: Duration(
            seconds: int.parse(countdown.text),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    countdown.dispose();
    moles.dispose();
    super.dispose();
  }
}

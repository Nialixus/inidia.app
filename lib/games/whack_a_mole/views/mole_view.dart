part of '../main.dart';

class MoleView extends StatelessWidget {
  const MoleView(
    this.data, {
    super.key,
    required this.size,
    required this.onTap,
  });

  final Size size;
  final VoidCallback onTap;
  final MoleModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/games/whack_a_mole/bg_hole.png',
              ),
            ),
            Positioned.fill(
              child: Builder(
                builder: (_) {
                  if (data.type == MoleType.none) return const SizedBox();
                  return Image.asset(
                    'assets/games/whack_a_mole/'
                    'char_${data.type.name}_mole.png',
                  );
                },
              ),
            ),
            if (data.isTapped)
              Positioned.fill(
                child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 100),
                  builder: (_, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: Builder(builder: (context) {
                    switch (data.type) {
                      case MoleType.bomber:
                        return Image.asset(
                          'assets/games/whack_a_mole/fx_bad.png',
                        );
                      case MoleType.normal:
                        return Image.asset(
                          'assets/games/whack_a_mole/fx_good.png',
                        );
                      default:
                        return Image.asset(
                          'assets/games/whack_a_mole/fx_miss.png',
                        );
                    }
                  }),
                ),
              )
          ],
        ),
      ),
    );
  }
}

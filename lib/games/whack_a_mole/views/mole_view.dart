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
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/games/whack_a_mole/bg_hole.png',
              ),
            ),
            if (data.type != MoleType.none)
              Positioned.fill(
                child: ClipRect(
                  clipper: MoleArea(),
                  child: TweenAnimationBuilder(
                    key: Key(data.type.name),
                    curve: Curves.easeInOut,
                    tween: Tween(begin: size.height, end: 0.0),
                    duration: const Duration(milliseconds: 300),
                    builder: (_, value, child) {
                      if (data.isTapped) return child!;
                      return Transform.translate(
                        offset: Offset(0.0, value),
                        child: child!,
                      );
                    },
                    child: Image.asset(
                      'assets/games/whack_a_mole/'
                      'char_${data.type.name}_mole.png',
                    ),
                  ),
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
                  child: Image.asset(
                    'assets/games/whack_a_mole/fx_${data.type.name}.png',
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class MoleArea extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      0,
      0,
      size.width,
      size.height * 0.65,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) =>
      oldClipper != this;
}

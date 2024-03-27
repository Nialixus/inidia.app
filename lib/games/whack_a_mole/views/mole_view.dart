part of '../main.dart';

class MoleView extends StatelessWidget {
  const MoleView({
    super.key,
    required this.size,
    required this.onTap,
  });
  final Size size;
  final VoidCallback onTap;

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
              child: Image.asset('assets/games/whack_a_mole/hole.png'),
            ),
            Positioned.fill(
              child: Image.asset('assets/games/whack_a_mole/mole.png'),
            ),
          ],
        ),
      ),
    );
  }
}

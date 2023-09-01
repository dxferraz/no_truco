// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:no_truco/Components/changeThemeButton/change_theme_button.dart';
import 'package:no_truco/Components/intro/login_page.dart';
import 'package:no_truco/my_home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final controller = PageController();
  var lastPage = false;

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 300,
              child: Center(
                child: Image.asset(
                  urlImage,
                  fit: BoxFit.contain,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 64),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: "Conthrax",
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).colorScheme.background;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: const [
          ChangeThemeButton(),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              lastPage = index == 3;
            });
          },
          children: [
            buildPage(
              color: backgroundColor,
              urlImage: "assets/images/cards_intro.png",
              title: "Contador de pontos",
              subtitle:
                  "Bem-vindo ao NoTruco: seu contador de pontos de Truco! Simplificando a contagem e acompanhamento das partidas, o NoTruco é a ferramenta ideal para jogadores apaixonados por esse clássico jogo brasileiro.",
            ),
            buildPage(
              color: backgroundColor,
              urlImage: "assets/images/timer_intro.png",
              title: "Timer",
              subtitle:
                  "Além de acompanhar as pontuações, oferecemos um timer integrado para acompanhar o tempo de cada rodada. Conte com o NoTruco para que suas partidas sejam mais emocionantes e desafiadoras.",
            ),
            buildPage(
              color: backgroundColor,
              urlImage: "assets/images/fun_intro.png",
              title: "Se divirta!",
              subtitle:
                  "Nosso aplicativo combina a emoção do jogo com a praticidade da contagem automática de pontos. Enfrente seus amigos ou desafie a si mesmo enquanto o NoTruco mantém o placar.",
            ),
            const LoginPage(),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            lastPage
                ? Container(width: 150)
                : Animate(
                    effects: const [
                      FadeEffect(
                        duration: Duration(milliseconds: 500),
                      ),
                    ],
                    child: Container(
                      width: 150,
                      child: TextButton(
                        onPressed: () {
                          controller.jumpToPage(3);
                        },
                        child: Text(
                          "Pular",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,
                effect: ExpandingDotsEffect(
                  dotColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white24
                      : Colors.black26,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  dotWidth: 12,
                  dotHeight: 12,
                  expansionFactor: 2,
                ),
              ),
            ),
            lastPage
                ? Animate(
                    effects: const [FadeEffect()],
                    child: Container(
                      width: 150,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          "Pular Login",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  )
                : Animate(
                    effects: const [
                      FadeEffect(duration: Duration(milliseconds: 500))
                    ],
                    child: Container(
                      width: 150,
                      child: TextButton(
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          "Próximo",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

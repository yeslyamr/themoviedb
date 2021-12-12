import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
          SizedBox(
            width: double.infinity,
            height: 16,
          ),
          _FormWidget(),
          SizedBox(
            width: double.infinity,
            height: 20,
          ),
          _FooterWidget(),
        ],
      ),
    );
  }
}

class _FooterWidget extends StatelessWidget {
  const _FooterWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: const Color.fromRGBO(3, 37, 65, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("ВСТУПИТЬ В СООБЩЕСТВО"),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(const TextStyle(
                    fontWeight: FontWeight.w800,
                  fontSize: 16
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(34, 94, 167, 1)),
              ),
            ),
          ),
          const SizedBox(
            height: 50
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("ГЛАВНОЕ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                  )
                ),
                style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                onPressed: () {},
                child: const Text("O TMDB",
                    style: TextStyle(
                        fontSize: 16
                    )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Связаться с нами",
                    style: TextStyle(
                        fontSize: 16
                    )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Форумы поддержки",
                    style: TextStyle(
                        fontSize: 16
                    )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                onPressed: () {},
                child: const Text("API",
                    style: TextStyle(
                        fontSize: 16
                    )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Статус системы",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text("УЧАСТВУЙТЕ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      )
                  ),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Писание об участии",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Сторонние приложения",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Добавить новый фильм",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Добавить новый сериал",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text("СООБЩЕСТВО",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      )
                  ),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Руководства",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Обсуждения",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Доска почёта",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Twitter",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text("О ПРАВЕ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      )
                  ),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Условия использовния",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("API Правила использовния",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Политика конфиденциальности",
                      style: TextStyle(
                          fontSize: 16
                      )),
                  style: AppButtonStyle.footerLinkButtonStyle
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool isAuthError = false;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == "admin" && password == "admin") {
      isAuthError = false;

      final navigator = Navigator.of(context);
      navigator.push(
        MaterialPageRoute<void>(builder: (context) => MainScreenWidget())
      );

    } else {
      isAuthError = true;
    }
    setState(() {});
  }

  void _resetPassword() {}

  @override
  Widget build(BuildContext context) {
    const textFieldDecoration = InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        isCollapsed: true,
    );
    return Column(
      children: [
        if (isAuthError) Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          color: const Color.fromRGBO(1, 180, 228, 1),
          child: Column(
            children: const [
              Text("Invalid Session",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              Text("We couldn't validate your login session. You can refresh this page and try again.",
                style: TextStyle(
                    fontSize: 20.8,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const SizedBox(
                width: double.infinity,
                height: 16,
              ),
              const Text("Имя пользователя ",
                style: TextStyle(
                    fontSize: 16,
                ),
              ),
              TextField(
                  controller: _loginTextController,
                  decoration: textFieldDecoration,
              ),
              const SizedBox(
                width: double.infinity,
                height: 16,
              ),
              const Text("Пароль",
                style: TextStyle(
                fontSize: 16,
              ),
          ),
              TextField(
                controller: _passwordTextController,
                decoration: textFieldDecoration,
                obscureText: true,
              ),
              const SizedBox(
                width: double.infinity,
                height: 30,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _auth,
                    child: const Text("Войти",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1)),
                      backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(1, 180, 228, 1))
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 5,
                  ),
                  Padding (
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextButton(
                      onPressed: _resetPassword,
                      child: const Text("Сбросить пароль"),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(1, 180, 228, 1)),
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          const Text(
            "Войти в свою учётную запись",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: double.infinity,
            height: 4,
          ),
          const Text(
              "Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. ",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text("Регистрация",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: AppButtonStyle.linkButton
          ),
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          const Text(
            "Если Вы зарегистрировались, но не получили письмо для подтверждения, ",
            style: TextStyle(
                fontSize: 16,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text("Получить письмо для подтверждения",
                style: TextStyle(
                    fontSize: 16
                ),),
              style: AppButtonStyle.linkButton
          ),
        ],
      ),
    );
  }
}



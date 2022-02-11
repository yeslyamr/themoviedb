import 'package:flutter/material.dart';
import 'package:themoviedb/Library/Widgets/Inherited/provider.dart';
import 'package:themoviedb/ui/Theme/app_button_style.dart';
import 'package:themoviedb/ui/widgets/auth/auth_model.dart';

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
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      isCollapsed: true,
    );

    final model = NotifierProvider.read<AuthModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ErrorMessageWidget(),
          const SizedBox(
            width: double.infinity,
            height: 16,
          ),
          const Text(
            "Username",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            controller: model?.loginTextController,
            decoration: textFieldDecoration,
          ),
          const SizedBox(
            width: double.infinity,
            height: 16,
          ),
          const Text(
            "Password",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextField(
            controller: model?.passwordTextController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              isDense: true,
            ),
            obscureText: true,
          ),
          const SizedBox(
            width: double.infinity,
            height: 30,
          ),
          Row(
            children: [
              const _AuthButtonWidget(),
              const SizedBox(
                width: 10,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Reset password"),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(1, 180, 228, 1)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthModel>(context);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : () {};
    final child = model?.isAuthProgress == true
        ? const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
              color: Color.fromRGBO(13, 37, 63, 1),
            ))
        : const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold),
          );

    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1)),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(1, 180, 228, 1))),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        NotifierProvider.watch<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: const Color.fromRGBO(0, 180, 228, 1),
      child: Column(
        children: [
          const Text(
            "Invalid Session",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            errorMessage,
            style: const TextStyle(
                fontSize: 20.8,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          )
        ],
      ),
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
        children: [
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          const Text(
            "Войти в свою учётную запись",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              child: const Text(
                "Регистрация",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: AppButtonStyle.linkButton),
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
              child: const Text(
                "Получить письмо для подтверждения",
                style: TextStyle(fontSize: 16),
              ),
              style: AppButtonStyle.linkButton),
        ],
      ),
    );
  }
}

// class _FooterWidget extends StatelessWidget {
//   const _FooterWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//       color: const Color.fromRGBO(3, 37, 65, 1),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             alignment: Alignment.centerLeft,
//             child: ElevatedButton(
//               onPressed: () {},
//               child: const Text("ВСТУПИТЬ В СООБЩЕСТВО"),
//               style: ButtonStyle(
//                 textStyle: MaterialStateProperty.all(
//                   const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
//                 ),
//                 backgroundColor: MaterialStateProperty.all(Colors.white),
//                 foregroundColor: MaterialStateProperty.all(
//                     const Color.fromRGBO(34, 94, 167, 1)),
//               ),
//             ),
//           ),
//           const SizedBox(height: 50),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("ГЛАВНОЕ",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("O TMDB", style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Связаться с нами",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Форумы поддержки",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("API", style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Статус системы",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//             ],
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("УЧАСТВУЙТЕ",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Писание об участии",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Сторонние приложения",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Добавить новый фильм",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Добавить новый сериал",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//             ],
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("СООБЩЕСТВО",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child:
//                       const Text("Руководства", style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child:
//                       const Text("Обсуждения", style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Доска почёта",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Twitter", style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//             ],
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("О ПРАВЕ",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Условия использовния",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("API Правила использовния",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//               TextButton(
//                   onPressed: () {},
//                   child: const Text("Политика конфиденциальности",
//                       style: TextStyle(fontSize: 16)),
//                   style: AppButtonStyle.footerLinkButtonStyle),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

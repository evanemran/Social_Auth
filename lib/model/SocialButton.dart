import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final String? image;
  final Color? color;
  final ElevatedButton? icon;
  final VoidCallback? onComplete;

  const SocialButton({
    Key? key,
    required this.title,
    this.image,
    this.color,
    this.icon, this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          onComplete?.call();
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(8),
          overlayColor: MaterialStateProperty.all(Colors.black12),
          shadowColor: MaterialStateProperty.all(Colors.pink.shade50),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          // fixedSize: MaterialStateProperty.all(const Size(412, 60)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              image.toString(),
              scale: 8,
            ),
            const Spacer(),
            Text(
              "Sign up With $title",
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

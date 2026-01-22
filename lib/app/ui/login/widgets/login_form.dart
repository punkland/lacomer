import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_constants.dart';
import '../../../config/app_theme.dart';
import '../../../localization/app_localizations.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = (85.w).clamp(300.0, 360.0);
    final logoMarkWidth = (60.w).clamp(120.0, 200.0);
    final logoWidth = (40.w).clamp(140.0, 220.0);
    final buttonHeight = (6.h).clamp(44.0, 52.0).toDouble();
    final buttonFontSize = (15.sp).clamp(18.0, 26.0).toDouble();
    final signupFontSize = (10.sp).clamp(10.0, 13.0).toDouble();
    final dividerFontSize = (9.sp).clamp(9.0, 11.0).toDouble();
    final socialSize = (14.w).clamp(52.0, 64.0).toDouble();
    final socialIconSize = (socialSize * 0.72).toDouble();

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.pagePadding,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 1.5.h),
              SvgPicture.asset(
                AppAssets.logoLogin,
                width: logoMarkWidth,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 6),
              SvgPicture.asset(
                AppAssets.logo,
                width: logoWidth,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 32),
              const _InputField(
                hintKey: 'email_hint',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 12),
              const _InputField(
                hintKey: 'password_hint',
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      AppLocalizations.tr('login_button'),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: buttonFontSize,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.tr('signup_prompt'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.primaryOrange,
                  fontSize: signupFontSize,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppTheme.primaryOrange,
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        AppLocalizations.tr('login_with'),
                        style: TextStyle(
                          color: AppTheme.primaryOrange,
                          fontSize: dividerFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Divider(
                      color: AppTheme.primaryOrange,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _SocialButtons(
                size: socialSize,
                iconSize: socialIconSize,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.hintKey,
    required this.icon,
    this.obscureText = false,
  });

  final String hintKey;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: AppLocalizations.tr(hintKey),
        fillColor: AppTheme.cream,
        hintStyle: const TextStyle(
          color: AppTheme.textHint,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(icon, color: AppTheme.primaryOrange),
        contentPadding: const EdgeInsets.only(top: 16, bottom: 8),
      ),
    );
  }
}

class _SocialButtons extends StatelessWidget {
  const _SocialButtons({
    required this.size,
    required this.iconSize,
  });

  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          image: AppAssets.iconFacebook,
          size: size,
          iconSize: iconSize,
        ),
         SizedBox(width: 2.sp),
        _SocialButton(
          image: AppAssets.iconApple,
          size: size,
          iconSize: iconSize,
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.image,
    required this.size,
    required this.iconSize,
  });

  final String image;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () {},
      child: Container(
        width: size,
        height: size,

        alignment: Alignment.center,
        child: SvgPicture.asset(
          image,
          width: iconSize,
          height: iconSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

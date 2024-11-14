import 'package:flutter/material.dart';
import 'package:seunghyun_todo/infra/components/core/custom_container.dart';
import 'package:seunghyun_todo/infra/router/base_navigator.dart';
import 'package:seunghyun_todo/infra/settings/app_theme.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final VoidCallback onTap;
  final Color? foregroundColor;
  final double? borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  const CustomOutlineButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.foregroundColor,
    this.borderRadius,
    this.borderColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Builder(builder: (context) {
        if (icon != null) {
          return OutlinedButton.icon(
            icon: icon!,
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              iconColor: foregroundColor ?? AppTheme.colors.green,
              padding: const EdgeInsets.all(17),
              side: BorderSide(
                color: borderColor ?? AppTheme.colors.green,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
            ),
            label: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: foregroundColor ?? AppTheme.colors.black,
                  fontWeight: AppTheme.fontWeights.semiBold,
                  fontSize: 18,
                ),
              ),
            ),
          );
        } else {
          return OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 17),
              side: BorderSide(
                color: borderColor ?? AppTheme.colors.green,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: foregroundColor ?? AppTheme.colors.black,
                  fontWeight: AppTheme.fontWeights.semiBold,
                  fontSize: 18,
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Icon? icon;
  final VoidCallback onTap;
  final VoidCallback? onDisabledTap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? elevation;
  final bool? isSelected;
  final bool? isDisabled;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.onDisabledTap,
    this.titleStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.icon,
    this.elevation,
    this.isSelected = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    BorderSide? borderSide;
    if (borderColor != null) {
      borderSide = BorderSide(
        width: 0.75,
        color: borderColor!,
      );
    }

    Color bgColor() {
      if (isDisabled == true) {
        return AppTheme.colors.lightGray;
      } else {
        return backgroundColor ?? AppTheme.colors.black;
      }
    }

    Color fgColor() {
      if (isDisabled == true) {
        return AppTheme.colors.gray;
      } else {
        return foregroundColor ?? AppTheme.colors.white;
      }
    }

    if (icon != null) {
      return ElevatedButton.icon(
        icon: icon!,
        onPressed: isDisabled == true ? onDisabledTap : onTap,
        style: ElevatedButton.styleFrom(
          iconColor: foregroundColor ?? AppTheme.colors.white,
          padding: const EdgeInsets.all(17),
          side: isSelected!
              ? BorderSide(
                  width: 3,
                  color: AppTheme.colors.black,
                )
              : borderSide,
          backgroundColor: bgColor(),
          foregroundColor: fgColor(),
          enableFeedback: false,
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        label: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyle ??
                TextStyle(
                  fontSize: 16,
                  fontWeight: AppTheme.fontWeights.semiBold,
                ),
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: isDisabled == true ? onDisabledTap : onTap,
        style: ElevatedButton.styleFrom(
          side: isSelected!
              ? const BorderSide(
                  width: 3,
                  color: Colors.black,
                )
              : borderSide,
          backgroundColor: bgColor(),
          foregroundColor: fgColor(),
          enableFeedback: false,
          elevation: elevation ?? 0,
          padding: const EdgeInsets.symmetric(vertical: 17),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyle ??
                TextStyle(
                  fontSize: 16,
                  fontWeight: AppTheme.fontWeights.semiBold,
                ),
          ),
        ),
      );
    }
  }
}

class CustomCircularButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? margin;
  const CustomCircularButton({
    super.key,
    required this.iconData,
    required this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainer(
        backgroundColor: Colors.white,
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        showShadow: true,
        padding: const EdgeInsets.all(6),
        margin: margin,
        child: Icon(
          iconData,
          color: AppTheme.colors.black,
          size: 16,
        ),
      ),
    );
  }
}

class CustomCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;

  const CustomCloseButton({
    super.key,
    this.onPressed,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: BorderRadius.circular(14),
      alignment: Alignment.center,
      onTap: onPressed ?? () => BaseNavigator.pop(),
      width: 28,
      height: 28,
      child: Icon(
        Icons.close,
        size: 28,
        color: color,
      ),
    );
  }
}

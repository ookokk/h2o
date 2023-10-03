import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class DrinkWaterButton extends ConsumerWidget {
  final VoidCallback? onTap;
  final String? text;
  final Color? color;
  final TextStyle? textStyle;
  final Color? borderColor;

  const DrinkWaterButton({
    Key? key,
    this.textStyle,
    this.borderColor,
    this.color,
    this.onTap,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(
            DeviceSize.kWidth(context) * 0.4,
            DeviceSize.kHeight(context) * 0.07,
          ),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(
            DeviceSize.kWidth(context) * 0.4,
            DeviceSize.kHeight(context) * 0.07,
          ),
        ),
        elevation: MaterialStateProperty.all<double>(3),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? currentTheme.disabledColor,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: SvgPicture.asset(
            'assets/images/ic_drink_water_black.svg',
            // ignore: deprecated_member_use
            color: Colors.white,
          )),
          Expanded(
            flex: 3,
            child: Text(
              text ?? "",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: textStyle ?? currentTheme.textTheme.titleLarge,
            ),
          )
        ],
      ),
    );
  }
}

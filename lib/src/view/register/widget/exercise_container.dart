import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/view_model/third_tab_view_model.dart';

class ExerciseContainer extends ConsumerWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;

  const ExerciseContainer({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedContainerIndex = ref.watch(thirdTabViewModelProvider);
    final currentTheme = ref.watch(themeProvider);
    final isSelected = selectedContainerIndex == index;
    return SizedBox(
      height: DeviceSize.kHeight(context) * 0.12,
      width: DeviceSize.kWidth(context) * 0.92,
      child: GestureDetector(
        onTap: () {
          ref
              .read(thirdTabViewModelProvider.notifier)
              .updateSelectedContainerIndex(index);
        },
        child: Container(
          margin: const EdgeInsets.all(2),
          height: 120.0,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.lightBlue : currentTheme.shadowColor,
            border: Border.all(
              width: 1.0,
              color: currentTheme.scaffoldBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Expanded(child: SvgPicture.asset(imagePath)),
              const SizedBox(width: 16.0),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        title,
                        style: currentTheme.textTheme.displayMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        subTitle,
                        style: currentTheme.textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

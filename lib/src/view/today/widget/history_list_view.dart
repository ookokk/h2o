import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/product/model/water_intake_record.dart';
import 'package:h2o_flutter/src/product/repository/water_intake_repository.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryListView extends ConsumerWidget {
  const HistoryListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WaterIntakeRepository waterIntakeRepository = WaterIntakeRepository();
    final currentTheme = ref.watch(themeProvider);
    return StreamBuilder<List<WaterIntakeRecord>>(
      stream: waterIntakeRepository.getWaterIntakeRecords('user1'),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Hata: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final waterIntakeRecords = snapshot.data ?? []; // Veriyi al

        return ListView.builder(
          itemCount: waterIntakeRecords.length,
          itemBuilder: (context, index) {
            final record = waterIntakeRecords[index];
            final formattedDate = DateFormat.MMMMd().format(record.dateTime);
            return Card(
              color: currentTheme.scaffoldBackgroundColor,
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        'assets/images/glass_water.svg',
                        height: 40,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        formattedDate,
                        style: currentTheme.textTheme.displayMedium,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${record.dateTime.hour.toString()} : ${record.dateTime.minute.toString()}',
                        style: currentTheme.textTheme.displayLarge,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

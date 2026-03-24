import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/screens/guardian_access/widget/progress_bar.dart';
import 'package:vybe_app/widgets/app_background.dart';
import 'package:vybe_app/widgets/core/app_bar/app_bar.dart';
import 'package:vybe_app/widgets/design/buttons/app_button/app_button.dart';
import 'package:vybe_app/screens/widgets/global_access_tile.dart';

part 'widget/_body.dart';
part '_state.dart';

class GuardianAccessScreen extends StatelessWidget {
  const GuardianAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
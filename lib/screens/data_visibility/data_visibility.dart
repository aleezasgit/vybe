import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/screens/widgets/switch.dart';
import 'package:vybe_app/widgets/app_background.dart';
import 'package:vybe_app/widgets/core/app_bar/app_bar.dart';
import 'package:vybe_app/widgets/design/radio_buttons/app_radiofield.dart';

part 'widget/_body.dart';
part '_state.dart';

class DataVisibilityScreen extends StatelessWidget {
  const DataVisibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
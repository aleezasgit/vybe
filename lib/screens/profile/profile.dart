import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/router/routes.dart';
import 'package:vybe_app/screens/widgets/confirm_bottomsheet.dart';
import 'package:vybe_app/statics/app_statics.dart';
import 'package:vybe_app/widgets/app_background.dart';
import 'package:vybe_app/widgets/core/app_bar/app_bar.dart';
import 'package:vybe_app/widgets/design/buttons/app_button/app_button.dart';
import 'package:provider/provider.dart';

part 'widget/_body.dart';
part '_state.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/screens/widgets/global_access_tile.dart';
import 'package:vybe_app/widgets/app_background.dart';
import 'package:vybe_app/widgets/core/app_bar/app_bar.dart';
import 'package:vybe_app/widgets/design/buttons/app_button/app_button.dart';

part '_state.dart';
part 'widget/_body.dart';

class AddNewGuardianScreen extends StatelessWidget {
  const AddNewGuardianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
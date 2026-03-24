import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/widgets/app_background.dart';
import 'package:vybe_app/widgets/core/app_bar/app_bar.dart';
import 'package:vybe_app/widgets/design/buttons/app_button/app_button.dart';
import 'package:vybe_app/widgets/design/textfields/app_textfield/app_textfield.dart';



part 'widgets/_body.dart';
part '_state.dart';
part 'static/_form_data.dart';
part 'static/_form_keys.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

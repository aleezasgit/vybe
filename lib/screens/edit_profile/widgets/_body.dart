part of '../edit_profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);
    App.init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Edit Profile',
      ),
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: true,
        child: SingleChildScrollView(
          child: FormBuilder(
            key: state.formKey,
            initialValue: _FormData.initialValues(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Space.yf(16),

                /// ================= PROFILE IMAGE =================
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage('assets/pngs/Ellipse 1990.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Space.yf(12),

                      Text(
                        "Change Image",
                        style: AppText.b1bm?.w(5).cl(AppTheme.c.white!),
                      ),

                      Space.yf(6),

                      Text(
                        "Allowed Formats : jpg, png, jpeg",
                        style: AppText.l1?.cl(AppTheme.c.text.main!),
                      ),
                    ],
                  ),
                ),

                Space.yf(16),

                /// ================= GENERAL INFO =================
                Text(
                  "General Information",
                  style: AppText.h5bm?.w(4),
                ),

                Space.yf(12),

                AppTextField(
                  name: _FormKeys.userName,
                  type: TextFieldType.withIcon,
                  hint: 'i.e. Noam Laish',
                  textInputAction: TextInputAction.next,
                  prefixIcon: _icon('assets/svgs/user-square.svg'),
                ),

                Space.yf(12),

                AppTextField(
                  name: _FormKeys.email,
                  textInputType: TextInputType.emailAddress,
                  type: TextFieldType.withIcon,
                  hint: 'i.e. user123@gmail.com',
                  textInputAction: TextInputAction.next,
                  prefixIcon: _icon('assets/svgs/sms.svg'),
                ),

                Space.yf(12),

                AppTextField(
                  name: _FormKeys.phone,
                  textInputType: TextInputType.phone,
                  type: TextFieldType.withIcon,
                  hint: '00-123-456-789',
                  textInputAction: TextInputAction.next,
                  prefixIcon: _icon('assets/svgs/call.svg'),
                ),

                Space.yf(16),

                /// ================= SECURITY INFO =================
                Text(
                  "Security Information",
                  style: AppText.h5bm?.w(4),
                ),

                Space.yf(12),

                AppTextField(
                  name: _FormKeys.oldPassword,
                  isPass: true,
                  type: TextFieldType.withIcon,
                  hint: 'Old Password',
                  textInputAction: TextInputAction.next,
                  prefixIcon: _icon('assets/svgs/lock.svg'),
                ),

                Space.yf(12),

                AppTextField(
                  name: _FormKeys.newPassword,
                  isPass: true,
                  type: TextFieldType.withIcon,
                  hint: 'New Password',
                  textInputAction: TextInputAction.next,
                  prefixIcon: _icon('assets/svgs/lock.svg'),
                ),

                Space.yf(12),

                AppTextField(
                  name: _FormKeys.confirmPassword,
                  isPass: true,
                  type: TextFieldType.withIcon,
                  hint: 'Confirm new password',
                  textInputAction: TextInputAction.done,
                  prefixIcon: _icon('assets/svgs/lock.svg'),
                  suffixIcon: _icon('assets/svgs/eye-slash.svg'),
                ),

                Space.yf(16),

                /// ================= SAVE BUTTON =================
                AppButton(
                  label: 'Save Changes',
                  onPressed: () {},
                  hasShadow: true,
                ),

                Space.yf(16),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _icon(String path) {
    return Padding(
      padding: Space.only(left: 16, right: 8),
      child: SvgPicture.asset(
        path,
        width: 16.w,
        height: 16.h,
      ),
    );
  }
}
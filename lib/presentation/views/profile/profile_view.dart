import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gettest/application/auth/auth_bloc.dart';
import 'package:gettest/l10n/localizations.dart';
import 'package:gettest/presentation/routes/route_name.dart';
import 'package:gettest/presentation/widgets/w_button.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/src/assets/icons.dart';
import 'package:gettest/src/assets/themes/context_extension.dart';
import 'package:gettest/utils/base_64_image.dart';
import 'package:gettest/utils/log_service.dart';
import 'package:gettest/utils/my_function.dart';
import 'package:go_router/go_router.dart';
import 'package:myid/enums.dart';
import 'package:myid/myid.dart';
import 'package:myid/myid_config.dart';
import 'package:uuid/uuid.dart';

part 'package:gettest/presentation/views/profile/controllers/profile_mixin.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with ProfileMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile),
        actions: [
          IconButton(
            onPressed: () {
              Log.e(_result!.base64);
            },
            icon: AppIcons.notification.svg(color: context.color.white),
          ),
        ],
      ),
      bottomNavigationBar: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                width: 600,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.doYouWantToGoOut,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: WButton(
                            onTap: () {
                              context.read<AuthBloc>().add(LogOutEvent());
                            },
                            text: AppLocalizations.of(context)!.yes,
                            color: red,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: WButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            text: AppLocalizations.of(context)!.no,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.logout.svg(color: red),
            const SizedBox(width: 4),
            Text(
              AppLocalizations.of(context)!.logOut,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: red,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: context.color.borderColor),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        child: state.userModel.data.user.avatar.isNotEmpty
                            ? MyFunction.imageFromBase64String(
                                state.userModel.data.user.avatar,
                              )
                            : _result != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(48),
                                    child: SizedBox(
                                      height: 48,
                                      width: 48,
                                      child: imageFromBase64String(
                                        _result!.base64 ?? "",
                                      ),
                                    ),
                                  )
                                : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${state.userModel.data.user.name} ${state.userModel.data.user.surname}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                state.userModel.data.user.isIdentified
                                    ? AppIcons.checkVerified.svg(color: green)
                                    : AppIcons.warning.svg(),
                                const SizedBox(width: 8),
                                Text(
                                  state.userModel.data.user.isIdentified
                                      ? AppLocalizations.of(context)!
                                          .identifiedUser
                                      : AppLocalizations.of(context)!
                                          .notIdentified,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        state.userModel.data.user.isIdentified
                                            ? green
                                            : red,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state.userModel.data.user.isIdentified) {
                  return const SizedBox();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: InkWell(
                    onTap: init,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: green.withOpacity(.2)),
                        color: green.withOpacity(.1),
                      ),
                      child: Row(
                        children: [
                          AppIcons.save.svg(),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.goToIdentification,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          AppIcons.arrowRight.svg(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: context.color.borderColor),
              ),
              child: Column(
                children: [
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return ListTile(
                        leading: AppIcons.edit.svg(
                          color: context.color.white,
                        ),
                        trailing: AppIcons.arrowRight.svg(
                          color: context.color.white,
                        ),
                        title: Text(AppLocalizations.of(context)!.editProfile),
                        onTap: () {
                          if (state.userModel.data.user.isIdentified) {
                            context.push(AppRouteName.profileInfo);
                          }
                        },
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: AppIcons.scan.svg(color: context.color.white),
                    trailing:
                        AppIcons.arrowRight.svg(color: context.color.white),
                    title: Text(AppLocalizations.of(context)!.scanToLogin),
                    onTap: () {
                      context.push(AppRouteName.scan);
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: AppIcons.lenguage.svg(color: context.color.white),
                    trailing:
                        AppIcons.arrowRight.svg(color: context.color.white),
                    title: Text(AppLocalizations.of(context)!.lenguage),
                    onTap: () {
                      context.push(AppRouteName.lenguage);
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: AppIcons.theme.svg(color: context.color.white),
                    trailing:
                        AppIcons.arrowRight.svg(color: context.color.white),
                    title: Text(AppLocalizations.of(context)!.theme),
                    onTap: () {
                      context.push(AppRouteName.theme);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

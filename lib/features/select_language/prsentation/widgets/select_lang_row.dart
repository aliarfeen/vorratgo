import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/cubits/cubit/change_lang_cubit.dart';
import 'package:vorratgo/core/helpers/extensions.dart';
import 'package:vorratgo/core/helpers/spacers.dart';
import 'package:vorratgo/core/routing/routes.dart';
import 'package:vorratgo/features/select_language/prsentation/widgets/select_lang_item.dart';

class SelectLangRow extends StatelessWidget {
  const SelectLangRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
            child: SelectLangItem(
              text: 'English',
              img: 'assets/svgs/united-kingdom.svg',
              onTap: () {
                context.read<ChangeLangCubit>().setLanguage(const Locale('en'));
                context.pushNamed(Routes.emailPasswordAuth);
              },
            ),
          ),
          horizontalSpacer(16),
          Expanded(
            child: SelectLangItem(
              text: 'العربية',
              img: 'assets/svgs/egypt.svg',
              onTap: () {
                context.read<ChangeLangCubit>().setLanguage(const Locale('ar'));
                context.pushNamed(Routes.addPhoneNumber);
              },
            ),
          ),
        ],
      ),
    );
  }
}

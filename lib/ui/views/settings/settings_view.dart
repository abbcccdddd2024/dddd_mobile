import 'package:dddd_mobile/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    verticalSpaceSmall,
                    const Text(
                      "Nastavení",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Přepínač",
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                        Switch(value: false, onChanged: (bool bo) {}),
                      ],
                    )
                  ],
                ),
                MaterialButton(
                  color: Colors.red.withOpacity(0.5),
                  onPressed: viewModel.goBack,
                  child: const Text(
                    "Zpět",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}

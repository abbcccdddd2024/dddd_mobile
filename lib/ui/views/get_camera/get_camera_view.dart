import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'get_camera_viewmodel.dart';

class GetCameraView extends StackedView<GetCameraViewModel> {
  const GetCameraView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GetCameraViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Column(
          children: [const Text("Get Camera View")],
        ),
      ),
    );
  }

  @override
  GetCameraViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GetCameraViewModel();
}

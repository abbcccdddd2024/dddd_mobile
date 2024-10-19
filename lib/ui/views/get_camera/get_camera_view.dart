import 'package:dddd_mobile/ui/common/ui_helpers.dart';
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
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    verticalSpaceSmall,
                    const Text(
                      "Čekám na slova z kamery",
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                    SingleChildScrollView(
                      child: GestureDetector(
                        onTap: viewModel.readText,
                        onDoubleTap: viewModel.setupTts,
                        child: Container(
                          child: Text(
                            viewModel.whatIsOnCamera,
                            style: const TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        ),
                      ),
                    ),
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
  GetCameraViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GetCameraViewModel();
}

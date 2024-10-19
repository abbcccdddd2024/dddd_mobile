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
                    SingleChildScrollView(
                      child: GestureDetector(
                        onTap: viewModel.readText,
                        onDoubleTap: viewModel.setupTts,
                        onLongPress: viewModel.startLoop,
                        child: Column(
                          children: [Text(
                            viewModel.whatIsOnCamera,
                            style: const TextStyle(color: Colors.white, fontSize: 50),
                          ),]
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: Colors.red.withOpacity(0.5),
                      onPressed: viewModel.goBack,
                      child: const Text(
                        "Go back",
                        style: TextStyle(color: Colors.white, fontSize: 45),
                      ),
                    ),
                  ],
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

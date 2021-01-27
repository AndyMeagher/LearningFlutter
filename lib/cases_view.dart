import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'case.dart';
import 'cases_viewmodel.dart';

class CasesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CaseViewModel>.reactive(
      viewModelBuilder: () => CaseViewModel(),
      onModelReady: (model) => model.getCases(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.grey[100]
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helios_q2/src/features/packaging/presentation/components/components.dart';

import '../../../../../injection_container.dart';
import '../bloc/packaging_bloc.dart';

class PackagingView extends StatelessWidget {
  const PackagingView({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xspeedlt'),
      ),
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }

  BlocProvider<PackagingBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<PackagingBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              BlocBuilder<PackagingBloc, PackagingState>(
                builder: (context, state) {
                  if (state is PackingInProgress) {
                    return const PackagingLoadingCircle();
                  } else if (state is PackingFinished) {
                    return PackagingResultDisplay(
                      packedItems: state.packedItems,
                    );
                  } else if (state is PackingError) {
                    return Container(
                      // Third of the size of the screen
                      height: MediaQuery.of(context).size.height / 3,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Text(
                            state.message,
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      // Third of the size of the screen
                      height: MediaQuery.of(context).size.height / 3,
                      child: const Center(
                        child: SingleChildScrollView(
                          child: Text(
                            "Start Packing",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              PackagingControls()
            ],
          ),
        ),
      ),
    );
  }
}

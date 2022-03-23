import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helios_q2/src/features/packaging/presentation/bloc/packaging_bloc.dart';

class PackagingControls extends StatelessWidget {
  PackagingControls({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();
  late String itemsToPack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a list of items to pack',
          ),
          onChanged: (value) {
            itemsToPack = value;
          },
          onSubmitted: (_) {
            packedUp(context);
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                child: const Text('PackedUp'),
                onPressed: () {
                  packedUp(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        )
      ],
    );
  }

  void packedUp(BuildContext context) {
    // Clearing the TextField to prepare it for the next inputted number
    controller.clear();
    BlocProvider.of<PackagingBloc>(context).add(PackingItemsEvent(itemsToPack));
  }
}

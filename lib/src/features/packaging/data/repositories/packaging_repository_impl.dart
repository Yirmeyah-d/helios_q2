import 'package:helios_q2/src/features/packaging/domain/repositories/packaging_repository.dart';
import 'package:helios_q2/src/core/utils/input_converter.dart';

const int MAXIMUM_BOX_CAPACITY = 10;

class PackagingRepositoryImpl implements PackagingRepository {
  PackagingRepositoryImpl();

  @override
  Future<String> packedUp(List<int> itemsToPack) async {
    InputConverter inputConverter = InputConverter();
    int maxBoxPossible = itemsToPack.length;
    int exactNumberOfBox = 0;

    List<int> remainingBox = List.generate(maxBoxPossible, (index) => 0);
    List<String> packedItems = List.generate(maxBoxPossible, (index) => "");

    for (int indexMaxBox = 0; indexMaxBox < maxBoxPossible; indexMaxBox++) {
      int indexRemainingBox;
      for (indexRemainingBox = 0;
          indexRemainingBox < exactNumberOfBox;
          indexRemainingBox++) {
        if (remainingBox[indexRemainingBox] >= itemsToPack[indexMaxBox]) {
          remainingBox[indexRemainingBox] =
              remainingBox[indexRemainingBox] - itemsToPack[indexMaxBox];
          packedItems = buildListOfPackedItems(
              itemsToPack, packedItems, indexMaxBox, indexRemainingBox);
          break;
        }
      }

      if (indexRemainingBox == exactNumberOfBox) {
        remainingBox[exactNumberOfBox] =
            MAXIMUM_BOX_CAPACITY - itemsToPack[indexMaxBox];
        packedItems = buildListOfPackedItems(
            itemsToPack, packedItems, indexMaxBox, exactNumberOfBox);
        exactNumberOfBox++;
      }
    }
    packedItems.removeWhere((element) => element == "");
    return Future.value(packedItems.join("/"));
  }
}

List<String> buildListOfPackedItems(List<int> itemsToPack,
    List<String> packedItems, int indexMaxBox, int index) {
  String temp = "";
  if (packedItems[index] != "") {
    temp += packedItems[index];
    temp += itemsToPack[indexMaxBox].toString();
    packedItems[index] = temp;
  } else {
    packedItems[index] = itemsToPack[indexMaxBox].toString();
  }
  return packedItems;
}

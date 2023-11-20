void countingSort(List<int> arr) {
  int max = arr.reduce((value, element) => value > element ? value : element);
  int min = arr.reduce((value, element) => value < element ? value : element);

  int range = max - min + 1;

  List<int> count = List.filled(range, 0);
  List<int> output = List.filled(arr.length, 0);

  for (int i = 0; i < arr.length; i++) {
    count[arr[i] - min]++;
  }

  for (int i = 1; i < range; i++) {
    count[i] += count[i - 1];
  }

  for (int i = arr.length - 1; i >= 0; i--) {
    output[count[arr[i] - min] - 1] = arr[i];
    count[arr[i] - min]--;
  }

  for (int i = 0; i < arr.length; i++) {
    arr[i] = output[i];
  }
}

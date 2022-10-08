// ! jsonconverter might be better here for totalPriceIncVAT
// ! https://stackoverflow.com/questions/67150713/freezed-and-json-serializable-how-to-use-a-custom-converter

double totalPriceFromJson(int total) {
  return total.toDouble() / 100.0;
}

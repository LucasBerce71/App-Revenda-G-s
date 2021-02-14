String formatedPrice(double price) {
  return price.toStringAsFixed(2).replaceAll('.', ',');
}
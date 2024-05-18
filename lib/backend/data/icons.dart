  String getCategoryIconUrl(String category) {
    switch (category) {
      case 'Food':
        return 'assets/ecommerce/food.png';
      case 'Medicine':
        return 'assets/ecommerce/medikit.png';
      case 'Electronic':
        return 'assets/ecommerce/electronics.png';
      case 'Toy':
      return 'assets/ecommerce/toys.png';
      default:
        return '';
    }
  }
 
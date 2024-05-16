  String getCategoryIconUrl(String category) {
    switch (category) {
      case 'Food':
        return 'https://via.placeholder.com/50?text=Food';
      case 'Medicine':
        return 'https://via.placeholder.com/50?text=Medicine';
      case 'Electronic':
        return 'https://via.placeholder.com/50?text=Electronic';
      default:
        return '';
    }
  }

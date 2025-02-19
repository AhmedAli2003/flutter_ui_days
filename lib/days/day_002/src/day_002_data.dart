class Day002Data {
  final String imagePath;
  final String title;
  final String description;
  final int rating;

  const Day002Data({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.rating,
  });
}

const day002Data = [
  Day002Data(
    imagePath: 'assets/images/day_002/one.jpg',
    title: 'Yosemite National Park',
    description:
        'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.',
    rating: 4,
  ),
  Day002Data(
    imagePath: 'assets/images/day_002/two.jpg',
    title: 'Golden Gate Bridge',
    description:
        'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
    rating: 4,
  ),
  Day002Data(
    imagePath: 'assets/images/day_002/three.jpg',
    title: 'Sedona',
    description:
        'Sedona is regularly described as one of America\'s most beautiful places. Nowhere else will you find a landscape as dramatically colorful.',
    rating: 3,
  ),
  Day002Data(
    imagePath: 'assets/images/day_002/four.jpg',
    title: 'Savannah',
    description:
        'Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.',
    rating: 5,
  ),
];

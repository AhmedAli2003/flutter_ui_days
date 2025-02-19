import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_days/days/day_002/src/day_002_data.dart';
import 'package:google_fonts/google_fonts.dart';

class Day002 extends StatefulWidget {
  const Day002({super.key});

  @override
  State<Day002> createState() => _Day002State();
}

class _Day002State extends State<Day002> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: day002Data.length,
        itemBuilder: (context, index) => TripPageWidget(
          index: index,
          data: day002Data[index],
        ),
      ),
    );
  }
}

class TripPageWidget extends StatelessWidget {
  const TripPageWidget({
    super.key,
    required this.data,
    required this.index,
  });

  final Day002Data data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(data.imagePath),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.topRight,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${index + 1}',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '/${day002Data.length}',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: TripPlaceInfoWidget(
                  title: data.title,
                  description: data.description,
                  rating: data.rating,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripPlaceInfoWidget extends StatefulWidget {
  const TripPlaceInfoWidget({
    super.key,
    required this.title,
    required this.description,
    required this.rating,
  });

  final String title;
  final String description;
  final int rating;

  @override
  State<TripPlaceInfoWidget> createState() => _TripPlaceInfoWidgetState();
}

class _TripPlaceInfoWidgetState extends State<TripPlaceInfoWidget> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  late final List<Animation<double>> opacities;
  late final List<Animation<double>> translates;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    opacities = List.generate(3, (index) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.3 * index,
            0.3 * (index + 1),
          ),
        ),
      );
    });

    translates = List.generate(3, (index) {
      return Tween<double>(begin: 20, end: 0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.3 * index,
            0.3 * (index + 1),
          ),
        ),
      );
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TripAnimatedWidget(
                opacity: opacities[0],
                translate: translates[0],
                child: Text(
                  widget.title,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TripAnimatedWidget(
                opacity: opacities[1],
                translate: translates[1],
                child: TripRatingWidget(rating: widget.rating),
              ),
              const SizedBox(height: 20),
              TripAnimatedWidget(
                opacity: opacities[2],
                translate: translates[2],
                child: Text(
                  widget.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.nunito(
                    color: Colors.white70,
                    height: 1.9,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TripAnimatedWidget(
                opacity: opacities[2],
                translate: translates[2],
                child: Text(
                  'READ MORE',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}

class TripRatingWidget extends StatelessWidget {
  const TripRatingWidget({super.key, required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    const gapW4 = SizedBox(width: 4);
    return Row(
      children: [
        for (int i = 0; i < 5; ++i) ...[
          Icon(
            Icons.star,
            color: rating <= i ? Colors.grey : Colors.amber,
            size: 16,
          ),
          gapW4,
        ],
        Text(
          '$rating.0',
          style: GoogleFonts.nunito(
            color: Colors.white70,
          ),
        ),
        gapW4,
        Text(
          '(${rating * 500})',
          style: GoogleFonts.nunito(
            color: Colors.white38,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class TripAnimatedWidget extends StatelessWidget {
  const TripAnimatedWidget({
    super.key,
    required this.opacity,
    required this.translate,
    required this.child,
  });

  final Animation<double> opacity;
  final Animation<double> translate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity.value,
      child: Transform.translate(
        offset: Offset(0, translate.value),
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moviezone/common/widgets/appbar/app_bar.dart';
import 'package:moviezone/core/assets/app_vectors.dart';
import 'package:moviezone/core/configs/themes/app_colors.dart';
import 'package:moviezone/presentation/home/widgets/trending.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackground,
        appBar: BasicAppbar(
          hideBack: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset(AppVectors.logo),
            ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrendingMovies()
          ],
        ),
      ),
    );
  }
}

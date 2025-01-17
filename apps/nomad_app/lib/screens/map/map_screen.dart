import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:nomad_app/core/theme/app_colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = NCameraPosition(
    target: NLatLng(37.5665, 126.9780),
    zoom: 10,
    bearing: 0,
    tilt: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NaverMap(
            options: const NaverMapViewOptions(
              initialCameraPosition: _initialCameraPosition,
            ),
            forceGesture: false,
            onMapReady: (controller) {},
            onMapTapped: (point, latLng) {},
            onSymbolTapped: (symbol) {},
            onCameraChange: (position, reason) {},
            onCameraIdle: () {},
            onSelectedIndoorChanged: (indoor) {},
          ),
          _buildSearchBar(),
          _buildProfileButton(),
          _buildAddReviewButton(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 16,
      right: 72,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              // 검색 화면으로 이동
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.gray500),
                  const SizedBox(width: 12),
                  Text(
                    '작업 공간 검색',
                    style: TextStyle(
                      color: AppColors.gray500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileButton() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      right: 16,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              // 프로필 화면으로 이동
            },
            child: Icon(Icons.person_outline, color: AppColors.gray700),
          ),
        ),
      ),
    );
  }

  Widget _buildAddReviewButton() {
    return Positioned(
      right: 16,
      bottom: MediaQuery.of(context).padding.bottom + 16,
      child: FloatingActionButton(
        onPressed: () {
          // 리뷰 작성 화면으로 이동
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

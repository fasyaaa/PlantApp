import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_app/screens/home/bloc/camera_bloc.dart';
import 'package:plant_app/screens/home/bloc/camera_page.dart';
import 'package:plant_app/screens/home/bloc/gmaps_bloc/maps_page.dart';
import 'package:plant_app/screens/home/components/featurred_plants.dart';
import 'package:plant_app/screens/home/components/header_with_searchbox.dart';
import 'package:plant_app/screens/home/components/recommend_plants.dart';
import 'package:plant_app/screens/home/components/title_with_more_bbtn.dart';
import 'package:plant_app/theme_constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedAddress = '';
  File? _profileImage;

  Future<void> _openCamera() async {
    final file = await Navigator.push<File>(
      context,
      MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create: (_) => CameraBloc()..add(InitializeCamera()),
              child: CameraPage(),
            ),
      ),
    );

    if (file != null && mounted) {
      setState(() {
        _profileImage = file;
      });
    }
  }

  Future<void> _openMap() async {
  final selected = await Navigator.push<String>(
    context,
    MaterialPageRoute(
      builder: (_) => MapPage(),
    ),
  );

  if (selected != null && mounted) {
    setState(() {
      selectedAddress = selected;
    });
  }
}


  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_profileImage != null)
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text('Delete Image'),
                  onTap: () {
                    setState(() {
                      _profileImage = null;
                    });
                    Navigator.pop(context);
                  },
                ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _openCamera(); // panggil fungsi kamera
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Import from Gallery'),
                onTap: () async {
                  final pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile != null) {
                    setState(() {
                      _profileImage = File(pickedFile.path);
                    });
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('Cancel'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // give total height and width of our screen
    Size size = MediaQuery.of(context).size;
    // enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(
            size: size,
            onCameraTap: _showImageOptions,
            profileImage: _profileImage,
            onMapTap: _openMap,
            selectedLoc: selectedAddress
          ),
          TitleWithMoreBbtn(title: "Recomended", press: () {}),
          RecommendPlants(),
          TitleWithMoreBbtn(title: "Featured Plants", press: () {}),
          FeaturePlants(),
          SizedBox(height: AppSpacing.defaultPadding),
        ],
      ),
    );
  }
}

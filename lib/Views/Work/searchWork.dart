import 'package:flutter/material.dart';
import 'package:mergeme/Views/Work/workTemplate_page.dart';

class SearchWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WorkTemplate('Search work','Clients', 0)),
    );
  }
}

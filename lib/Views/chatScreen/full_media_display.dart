import 'package:flutter/material.dart';

class FullMediaDisplay extends StatefulWidget {
  const FullMediaDisplay({Key? key, required this.imageUrl}) : super(key: key);
  final String? imageUrl;

  @override
  State<FullMediaDisplay> createState() => _FullMediaDisplayState();
}

class _FullMediaDisplayState extends State<FullMediaDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Hero(
            tag: '${widget.imageUrl}',
            child: InteractiveViewer(
              // minScale: 0.5,
              // maxScale: 2,
              child: FadeInImage(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                placeholder: AssetImage(
                  'assets/images/azer_logo.png',
                ),
                image: NetworkImage(
                  '${widget.imageUrl}',
                ),
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

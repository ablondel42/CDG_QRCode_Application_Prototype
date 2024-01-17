import 'package:flutter/widgets.dart';

//TODO: implement a function to resize the image and
// improve performance

class AvatarFrame extends StatefulWidget {
  const AvatarFrame({super.key});

  @override
  State<AvatarFrame> createState() => _AvatarFrameState();
}

class _AvatarFrameState extends State<AvatarFrame> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
        child: Transform.rotate(
          angle: 0.7854,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0x551F7D2A),
                borderRadius: BorderRadius.circular(24),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color(0xFF39D2C0),
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Transform.rotate(
                  angle: 5.4978,
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    //child: const Image(
                    //  image: AssetImage('assets/images/LauncherIcon.png'),
                    //),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

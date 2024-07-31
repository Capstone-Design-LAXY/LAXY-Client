import 'package:flutter/material.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool darkMode = false;

  final WidgetStateProperty<Icon?> thumbIcon =
  WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.mode_night_outlined, color: Color(0xFFFC9112),);
      }
      return const Icon(Icons.light_mode, color: Color(0xFFFC9112),);
    },
  );


  final WidgetStateProperty<Color?> trackColor =
  WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Color(0xFF141218);
      }
      return Color(0xFFFFFFFF);
    },
  );

  final WidgetStateProperty<Color?> thumbColor =
  WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Color(0xFFFFFFFF);
      }
      return Color(0xFF141218);
    },
  );

  final WidgetStateProperty<Color?> overlayColor =
  WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        // return Colors.amber.withOpacity(0.54);
        return null;
      }
      if (states.contains(WidgetState.disabled)) {
        // return Colors.grey.shade400;
        return null;
      }
      return null;
    },
  );

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.9,
      child: Switch(
        thumbIcon: thumbIcon,
        value: darkMode,
        trackColor: trackColor,
        thumbColor: thumbColor,
        onChanged: (bool value) {
          setState(() {
            darkMode = value;
          });
        },
      ),
    );
  }
}

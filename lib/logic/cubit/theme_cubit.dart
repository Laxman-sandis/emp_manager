import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false); // Default to light theme

  void toggleTheme() {
    emit(!state); // Toggle between light and dark themes
  }
}

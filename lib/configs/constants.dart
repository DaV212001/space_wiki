import 'package:flutter_dotenv/flutter_dotenv.dart';

class Assets {
  /// **To Acquire Supabase Anon Key**
  ///    - Go to the [Supabase Dashboard](https://app.supabase.io/) and sign in.
  ///    - Open your project and navigate to **Settings** > **API**.
  ///    - Under **Project API keys**, locate the **anon key**.
  ///    - Copy this key, which is used for client-side, anonymous access to your Supabase project.
  ///
  static String anon_key = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  /// Your own supabase project's supabase url.
  static String supabase_url = "https://yvemyhgpkiavybsnidkb.supabase.co";

  /// **To Acquire YouTube API Key**
  ///    - Go to the [Google Cloud Console](https://console.cloud.google.com/).
  ///    - Create or select an existing project.
  ///    - Navigate to **APIs & Services** > **Library**.
  ///    - Search for "YouTube Data API v3" and enable it for your project.
  ///    - Go to **APIs & Services** > **Credentials** and click on **Create Credentials**.
  ///    - Choose **API Key** and copy the generated key to use as your YouTube API key.
  ///
  static String youtube_key = dotenv.env['YOUTUBE_API_KEY'] ?? '';
}

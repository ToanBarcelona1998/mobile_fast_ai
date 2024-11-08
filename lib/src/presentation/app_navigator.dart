import 'package:mobile_fast_ai/src/cores/app_routes.dart';
import 'package:mobile_fast_ai/src/presentation/screens/discover_group/creator_detail/creator_detail_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/discover_group/post/discover_post_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/discover_group/report/discover_report_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/discover_group/search/discover_search_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/discover_group/search_result/discover_search_result_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/art_style/art_style_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/edit_art_work/edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/erase_object/erase_object_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/explore_prompt/explore_prompt_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/finalize/finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/home/home_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/create_new_password/create_new_password_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/otp_code_verification/otp_code_verification_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/reset_password/reset_password_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_in_with_password/sign_in_with_password_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_create_public_profile/sign_up_create_public_profile_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_form/sign_up_form_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/sign_up_personal_info_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/splash/splash_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/walk_through/walk_through_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/welcome/welcome_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/about/about_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/edit_profile/edit_profile_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/follow_list/follow_list_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/follow_us/follow_us_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/language/language_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/personal_info/personal_info_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/privacy_policy/privacy_policy_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/security/security_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/setting/setting_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/setting_notification/setting_notification_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/3D_to_image_edit_art_work/3D_to_image_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/3D_to_image_finalize/3D_to_image_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/3D_to_image_upload/3D_to_image_upload_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/anime_edit_art_work/anime_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/anime_finalize/anime_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/anime_generator/anime_geneator_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/avatar_generator/ai_avatar_generator_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/avatar_generator_download/avatar_generator_download.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/avatar_generator_finalize/avatar_generator_finalize.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/avatar_generator_upload/avatar_generator_upload_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/batch_art_generator/batch_art_generator_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/batch_art_generator_detail/batch_art_generator_detail_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/batch_art_generator_finalize/batch_art_generator_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/batch_art_generator_list/batch_art_generator_list_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/control_net_edit_art_work/control_net_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/control_net_finalize/control_net_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/control_net_upload/control_net_upload_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/extend_image_edit_art_work/extend_image_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/extend_image_finalize/extend_image_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/extend_image_upload/extend_image_upload_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_to_painting_finalize/image_to_painting_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_to_painting_upload/image_to_painting_upload_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/logo_generator/logo_generator_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/logo_generator_edit_art_work/logo_generator_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/logo_generator_finalize/logo_generator_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/photo_to_anime_edit_art_work/photo_to_anime_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/photo_to_anime_finalize/photo_to_anime_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/photo_to_anime_upload/photo_to_anime_upload_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/realistic_art_edit_art_work/realistic_art_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/realistic_art_finalize/realistic_art_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/realistic_art_generator/realistic_art_generator_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/recolor_edit_art_work/recolor_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/recolor_image_finalize/recolor_image_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/recolor_image_upload/recolor_image_upload_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/sketch_to_image_edit_art_work/sketch_to_image_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/sketch_to_image_finalize/sketch_to_image_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/sketch_to_image_upload/sketch_to_image_upload_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_effect/text_effect_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_effect_edit_art_work/text_effect_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_effect_finalize/text_effect_finalize_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_effect_own/text_effect_own_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_to_pattern/text_to_pattern_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_to_pattern_edit_art_work/text_to_pattern_edit_art_work_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_to_pattern_finalize/text_to_pattern_finalize_screen.dart';
import 'package:flutter/material.dart';

import 'screens/tool_box_group/image_to_painting_edit_art_work/image_to_painting_edit_art_work_screen.dart';

sealed class RoutePath {
  static const String splash = '/';
  static const String _onBoarding = '${splash}on_boarding';
  static const String walkThrough = '$_onBoarding/walk_through';
  static const String welcome = '$_onBoarding/welcome';
  static const String signInWithPassword = '$_onBoarding/sign_in_with_password';
  static const String resetPassword = '$_onBoarding/reset_password';
  static const String otpCodeVerification =
      '$_onBoarding/otp_code_verification';
  static const String createNewPassword = '$_onBoarding/create_new_password';
  static const String signupForm = '$_onBoarding/sign_up_form';
  static const String signupPersonalInfo = '$_onBoarding/sign_up_personal_info';
  static const String signupCreatePublicProfile =
      '$_onBoarding/sign_up_public_profile';

  static const String home = '${splash}home_screen';
  static const String artStyle = '$home/art_style';

  static const String explorePrompt = '$home/explore_prompt';
  static const String editArtWork = '$home/edit_art_work';
  static const String eraseObject = '$home/erase_object';
  static const String finalize = '$home/finalize';

  static const String _toolBox = '$home/tool_box/';
  static const String avatarGenerator = '${_toolBox}avatar_generator';
  static const String avatarGeneratorUpload =
      '${_toolBox}avatar_generator_upload';
  static const String avatarGeneratorDownload =
      '${_toolBox}avatar_generator_download';
  static const String avatarGeneratorFinalize =
      '${_toolBox}avatar_generator_finalize';

  static const String _discover = '$home/discover/';
  static const String post = '${_discover}post';
  static const String discoverSearch = '${_discover}discover_search';
  static const String discoverSearchResult =
      '${_discover}discover_search_result';
  static const String creatorDetail = '${_discover}creator_detail';
  static const String postReport = '${_discover}report';

  static const String animeGenerator = '${_toolBox}anime_generator';
  static const String animeEditArtWork = '${_toolBox}anime_edit_art_work';
  static const String animeFinalize = '${_toolBox}anime_finalize';

  static const String realisticGenerator = '${_toolBox}realistic_generator';
  static const String realisticEditArtWork =
      '${_toolBox}realistic_edit_art_work';
  static const String realisticFinalize = '${_toolBox}realistic_finalize';

  static const String photoToAnimeUpload = '${_toolBox}photo_to_anime_upload';
  static const String photoToAnimeEditArtWork =
      '${_toolBox}photo_to_anime_edit_art_work';
  static const String photoToAnimeFinalize =
      '${_toolBox}photo_to_anime_finalize';

  static const String textEffect = '${_toolBox}text_effect';
  static const String textEffectOwn = '${_toolBox}text_effect_own';
  static const String textEffectFinalize = '${_toolBox}text_effect_finalize';
  static const String textEffectEditArtWork =
      '${_toolBox}text_effect_edit_art_work';

  static const String imageToPaintingUpload =
      '${_toolBox}image_to_painting_upload';
  static const String imageToPaintingEditArtWork =
      '${_toolBox}image_to_painting_edit_art_work';
  static const String imageToPaintingFinalize =
      '${_toolBox}image_to_painting_finalize';

  static const String recolorImageUpload = '${_toolBox}recolor_image_upload';
  static const String recolorImageEditArtWork =
      '${_toolBox}recolor_image_edit_art_work';
  static const String recolorImageFinalize =
      '${_toolBox}recolor_image_finalize';

  static const String extendImageUpload = '${_toolBox}extend_image_upload';
  static const String extendImageEditArtWork =
      '${_toolBox}extend_image_edit_art_work';
  static const String extendImageFinalize = '${_toolBox}extend_image_finalize';

  static const String threeDToImageUpload =
      '${_toolBox}three_d_to_image_upload';
  static const String threeDToImageEditArtWork =
      '${_toolBox}three_d_to_image_edit_art_work';
  static const String threeDToImageFinalize = '${_toolBox}3D_to_image_finalize';

  static const String textToPattern = '${_toolBox}text_to_pattern';
  static const String textToPatternEditArtWork =
      '${_toolBox}text_to_pattern_edit_art_work';
  static const String textToPatternFinalize =
      '${_toolBox}text_to_pattern_finalize';

  static const String logoGenerator = '${_toolBox}logo_generator';
  static const String logoGeneratorEditArtWork = '${_toolBox}edit_art_work';
  static const String logoGeneratorFinalize = '${_toolBox}finalize';

  static const String sketchToImageUpload = '${_toolBox}sketch_to_image_upload';
  static const String sketchToImageEditArtWork =
      '${_toolBox}sketch_to_image_edit_art_work';
  static const String sketchToImageFinalize =
      '${_toolBox}sketch_to_image_finalize';

  static const String controlNetUpload = '${_toolBox}control_net_upload';
  static const String controlNetEditArtWork =
      '${_toolBox}control_net_edit_art_work';
  static const String controlNetFinalize = '${_toolBox}control_net_finalize';

  static const String batchArtGenerator = '${_toolBox}batch_art_generator';
  static const String batchArtGeneratorList =
      '${_toolBox}batch_art_generator_list';
  static const String batchArtGeneratorDetail =
      '${_toolBox}batch_art_generator_detail';
  static const String batchArtGeneratorFinalize =
      '${_toolBox}batch_art_generator_finalize';

  static const String _myProfile = '$home/my_profile/';
  static const String setting = '${_myProfile}setting';
  static const String editProfile = '${_myProfile}edit_profile';
  static const String settingNotification = '${_myProfile}setting_notification';
  static const String personalInfo = '${_myProfile}personal_info';
  static const String language = '${_myProfile}language';
  static const String security = '${_myProfile}security';
  static const String followUs = '${_myProfile}follow_us';
  static const String privacyPolicy = '${_myProfile}privacy_policy';
  static const String about = '${_myProfile}about';
  static const String followList = '${_myProfile}follow_list';
}

sealed class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.splash:
        return _defaultRoute(
          settings,
          const SplashScreen(),
        );
      case RoutePath.walkThrough:
        return _defaultRoute(
          settings,
          const WalkThroughScreen(),
        );
      case RoutePath.welcome:
        return _defaultRoute(
          settings,
          const WelcomeScreen(),
        );
      case RoutePath.signInWithPassword:
        return _defaultRoute(
          settings,
          const SignInWithPasswordScreen(),
        );
      case RoutePath.resetPassword:
        return _defaultRoute(
          settings,
          const ResetPasswordScreen(),
        );
      case RoutePath.otpCodeVerification:
        final String email = settings.arguments as String;
        return _defaultRoute(
          settings,
          OtpCodeVerificationScreen(
            email: email,
          ),
        );
      case RoutePath.createNewPassword:
        return _defaultRoute(
          settings,
          const CreateNewPasswordScreen(),
        );
      case RoutePath.signupForm:
        return _defaultRoute(
          settings,
          const SignupFormScreen(),
        );
      case RoutePath.signupPersonalInfo:
        return _defaultRoute(
          settings,
          const SignupPersonalInfoScreen(),
        );
      case RoutePath.signupCreatePublicProfile:
        return _defaultRoute(
          settings,
          const SignupCreatePublicProfileScreen(),
        );
      case RoutePath.home:
        return _defaultRoute(
          settings,
          const HomeScreen(),
        );

      case RoutePath.artStyle:
        return _defaultRoute(
          settings,
          const ArtStyleScreen(),
        );
      case RoutePath.explorePrompt:
        return _defaultRoute(
          settings,
          const ExplorePromptScreen(),
        );
      case RoutePath.editArtWork:
        return _defaultRoute(
          settings,
          const EditArtWorkScreen(),
        );
      case RoutePath.eraseObject:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return _defaultRoute(
          settings,
          EraseObjectScreen(
            description: arguments['description'],
            url: arguments['url'],
          ),
        );
      case RoutePath.finalize:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return _defaultRoute(
          settings,
          FinalizeScreen(
            url: arguments['url'],
          ),
        );

      case RoutePath.avatarGenerator:
        return _defaultRoute(
          settings,
          const AIAvatarGeneratorScreen(),
        );
      case RoutePath.avatarGeneratorUpload:
        return _defaultRoute(
          settings,
          const AvatarGeneratorUploadScreen(),
        );
      case RoutePath.avatarGeneratorDownload:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          AvatarGeneratorDownloadScreen(url: url),
        );
      case RoutePath.avatarGeneratorFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          AvatarGeneratorFinalizeScreen(url: url),
        );
      case RoutePath.post:
        return _defaultRoute(
          settings,
          const DiscoverPostScreen(),
        );
      case RoutePath.discoverSearch:
        return _defaultRoute(
          settings,
          const DiscoverSearchScreen(),
        );
      case RoutePath.discoverSearchResult:
        final String query = settings.arguments as String;
        return _defaultRoute(
          settings,
          DiscoverSearchResultScreen(
            query: query,
          ),
        );
      case RoutePath.creatorDetail:
        return _defaultRoute(
          settings,
          const CreatorDetailScreen(),
        );

      case RoutePath.postReport:
        final int postId = settings.arguments as int;
        return _defaultRoute(
          settings,
          DiscoverReportScreen(
            postId: postId,
          ),
        );

      case RoutePath.animeGenerator:
        return _defaultRoute(
          settings,
          const AnimeGeneratorScreen(),
        );
      case RoutePath.animeEditArtWork:
        return _defaultRoute(
          settings,
          const AnimeEditArtWorkScreen(),
        );
      case RoutePath.animeFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          AnimeFinalizeScreen(
            url: url,
          ),
        );

      case RoutePath.photoToAnimeUpload:
        return _defaultRoute(
          settings,
          const PhotoToAnimeUploadScreen(),
        );
      case RoutePath.photoToAnimeEditArtWork:
        return _defaultRoute(
          settings,
          const PhotoToAnimeEditArtWorkScreen(),
        );
      case RoutePath.photoToAnimeFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          PhotoToAnimeFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.textEffect:
        return _defaultRoute(
          settings,
          const TextEffectScreen(),
        );
      case RoutePath.textEffectOwn:
        return _defaultRoute(
          settings,
          const TextEffectOwnScreen(),
        );
      case RoutePath.textEffectEditArtWork:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return _defaultRoute(
          settings,
          TextEffectEditArtWorkScreen(
            text: arguments['text'],
            describe: arguments['describe'],
          ),
        );

      case RoutePath.textEffectFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          TextEffectFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.imageToPaintingUpload:
        return _defaultRoute(
          settings,
          const ImageToPaintingUploadScreen(),
        );
      case RoutePath.imageToPaintingEditArtWork:
        return _defaultRoute(
          settings,
          const ImageToPaintingEditArtWorkScreen(),
        );
      case RoutePath.imageToPaintingFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          ImageToPaintingFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.recolorImageUpload:
        return _defaultRoute(
          settings,
          const RecolorImageUploadScreen(),
        );
      case RoutePath.recolorImageEditArtWork:
        return _defaultRoute(
          settings,
          const RecolorEditArtWorkScreen(),
        );
      case RoutePath.recolorImageFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          RecolorImageFinalizeScreen(
            url: url,
          ),
        );

      case RoutePath.extendImageUpload:
        return _defaultRoute(
          settings,
          const ExtendImageUploadScreen(),
        );
      case RoutePath.extendImageEditArtWork:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return _defaultRoute(
          settings,
          ExtendImageEditArtWorkScreen(
            width: arguments['width'],
            height: arguments['height'],
          ),
        );
      case RoutePath.extendImageFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          ExtendImageFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.threeDToImageUpload:
        return _defaultRoute(
          settings,
          const ThreeDToImageUploadScreen(),
        );
      case RoutePath.threeDToImageEditArtWork:
        return _defaultRoute(
          settings,
          const ThreeDToImageEditArtWorkScreen(),
        );
      case RoutePath.threeDToImageFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          ThreeDToImageFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.textToPattern:
        return _defaultRoute(
          settings,
          const TextToPatternScreen(),
        );
      case RoutePath.textToPatternEditArtWork:
        return _defaultRoute(
          settings,
          const TextToPatternEditArtWorkScreen(),
        );
      case RoutePath.textToPatternFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          TextToPatternFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.logoGenerator:
        return _defaultRoute(
          settings,
          const LogoGeneratorScreen(),
        );
      case RoutePath.logoGeneratorEditArtWork:
        return _defaultRoute(
          settings,
          const LogoGeneratorEditArtWorkScreen(),
        );
      case RoutePath.logoGeneratorFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          LogoGeneratorFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.controlNetUpload:
        return _defaultRoute(
          settings,
          const ControlNetUploadScreen(),
        );
      case RoutePath.controlNetEditArtWork:
        return _defaultRoute(
          settings,
          const ControlNetEditArtWorkScreen(),
        );
      case RoutePath.controlNetFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          ControlNetFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.sketchToImageUpload:
        return _defaultRoute(
          settings,
          const SketchToImageUploadScreen(),
        );
      case RoutePath.sketchToImageEditArtWork:
        return _defaultRoute(
          settings,
          const SketchToImageEditArtWorkScreen(),
        );
      case RoutePath.sketchToImageFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          SketchToImageFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.realisticGenerator:
        return _defaultRoute(
          settings,
          const RealisticArtGeneratorUploadScreen(),
        );
      case RoutePath.realisticEditArtWork:
        return _defaultRoute(
          settings,
          const RealisticArtEditArtWorkScreen(),
        );
      case RoutePath.realisticFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          RealisticArtFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.batchArtGenerator:
        return _defaultRoute(
          settings,
          const BatchArtGeneratorScreen(),
        );
      case RoutePath.batchArtGeneratorList:
        return _defaultRoute(
          settings,
          const BatchArtGeneratorListScreen(),
        );
      case RoutePath.batchArtGeneratorDetail:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          BatchArtGeneratorDetailScreen(
            url: url,
          ),
        );
      case RoutePath.batchArtGeneratorFinalize:
        final String url = settings.arguments as String;
        return _defaultRoute(
          settings,
          BatchArtGeneratorFinalizeScreen(
            url: url,
          ),
        );
      case RoutePath.setting:
        return _defaultRoute(
          settings,
          const SettingScreen(),
        );
      case RoutePath.editProfile:
        return _defaultRoute(
          settings,
          const EditProfileScreen(),
        );
      case RoutePath.settingNotification:
        return _defaultRoute(
          settings,
          const SettingNotificationScreen(),
        );
      case RoutePath.personalInfo:
        return _defaultRoute(
          settings,
          const PersonalInfoScreen(),
        );
      case RoutePath.language:
        return _defaultRoute(
          settings,
          const LanguageScreen(),
        );
      case RoutePath.security:
        return _defaultRoute(
          settings,
          const SecurityScreen(),
        );
      case RoutePath.followUs:
        return _defaultRoute(
          settings,
          const FollowUsScreen(),
        );
      case RoutePath.privacyPolicy:
        return _defaultRoute(
          settings,
          const PrivacyPolicyScreen(),
        );
      case RoutePath.about:
        return _defaultRoute(
          settings,
          const AboutScreen(),
        );
      case RoutePath.followList:
        return _defaultRoute(
          settings,
          const FollowListScreen(),
        );
      default:
        return null;
    }
  }

  static Future? push<T>(String route, [T? arguments]) =>
      state?.pushNamed(route, arguments: arguments);

  static Future? replaceWith<T>(String route, [T? arguments]) =>
      state?.pushReplacementNamed(route, arguments: arguments);

  static void pop<T>([T? arguments]) => state?.pop(arguments);

  static void popUntil(String routeName) => state?.popUntil(
        (route) => route.settings.name == routeName,
      );

  static void popToFirst() => state?.popUntil((route) => route.isFirst);

  static void replaceAllWith(String route) =>
      state?.pushNamedAndRemoveUntil(route, (route) => route.isFirst);

  static NavigatorState? get state => navigatorKey.currentState;

  static Route _defaultRoute(
    RouteSettings settings,
    Widget page,
  ) {
    return SlideRoute(
      page: page,
      settings: settings,
    );
  }
}

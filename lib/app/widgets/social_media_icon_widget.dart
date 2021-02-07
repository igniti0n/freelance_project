import 'package:test_project_one/app/data/models/homeAds.dart';
import 'package:get/get.dart';

class SocialMediaCardModel {
  final String iconName;
  final String value;

  SocialMediaCardModel(this.iconName, this.value);
}

List<SocialMediaCardModel> createSocialMediaList(
    AdsDetailModel adsDetailModel) {
  var isFacebookNull = adsDetailModel.facebookTarget.isNullOrBlank;
  var isInstagramNull = adsDetailModel.instagramTarget.isNullOrBlank;
  var isTwitterNull = adsDetailModel.twitterTarget.isNullOrBlank;
  var isYoutubeNull = adsDetailModel.youtubeTarget.isNullOrBlank;

  List<SocialMediaCardModel> listWidgets = [];
  if (!isFacebookNull) {
    listWidgets.add(SocialMediaCardModel(
        "facebook.svg", adsDetailModel.facebookTarget.toString()));
  }
  if (!isInstagramNull) {
    listWidgets.add(SocialMediaCardModel(
        "instagram.svg", adsDetailModel.instagramTarget.toString()));
  }
  if (!isTwitterNull) {
    listWidgets.add(SocialMediaCardModel(
        "twitter.svg", adsDetailModel.twitterTarget.toString()));
  }
  if (!isYoutubeNull) {
    listWidgets.add(SocialMediaCardModel(
        "youtube.svg", adsDetailModel.youtubeTarget.toString()));
  }
  return listWidgets;
}

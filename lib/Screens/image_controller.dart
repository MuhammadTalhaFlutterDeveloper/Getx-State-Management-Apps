import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  //create string type variable to store the path of the image which is taken by camera or from gallery
  RxString imagePath = "".obs;

  Future getImage() async {

    //define class of ImagePicker with picker object
    final ImagePicker picker = ImagePicker();

// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
// Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    // if (photo != null) {
    //   imagePath.value = photo.path.toString();
    // }

// Pick a video.
    // final XFile? galleryVideo =
    //     await picker.pickVideo(source: ImageSource.gallery);
    //     if (galleryVideo != null) {
    //   imagePath.value = galleryVideo.path.toString();
    // }
// Capture a video.
    // final XFile? cameraVideo =
    //     await picker.pickVideo(source: ImageSource.camera);
    //     if (cameraVideo != null) {
    //   imagePath.value = cameraVideo.path.toString();
    // }
// Pick multiple images.
    final List<XFile> images = await picker.pickMultiImage();
// Pick singe image or video.
    final XFile? media = await picker.pickMedia();
// Pick multiple images and videos.
    final List<XFile> medias = await picker.pickMultipleMedia();
  }
}

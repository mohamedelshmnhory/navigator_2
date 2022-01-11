enum ImagePathName {
  logo,
  cert,
  center,
  about,
  contact,
  logout,
  clock,
  sand,
  book,
  splashImage,
  loginImage,
  share,
  facebook,
  whatsapp,
  insta,
  youtube,
  snapchat,
  email,
  google,
  auth,
}

const IMAGE_PATHS = {
  ImagePathName.logo: 'assets/images/logo.png',
  ImagePathName.cert: 'assets/images/Icon awesome-certificate.png',
  ImagePathName.center: 'assets/images/Icon material-perm-media.png',
  ImagePathName.about: 'assets/images/address-card-solid.png',
  ImagePathName.contact: 'assets/images/ic_markunread_24px.png',
  ImagePathName.logout: 'assets/images/logout.png',
  ImagePathName.clock: 'assets/images/clock-regular.png',
  ImagePathName.sand: 'assets/images/hourglass-half-solid.png',
  ImagePathName.book: 'assets/images/book-reader-solid.png',
  ImagePathName.splashImage: 'assets/images/Mask Group 2.png',
  ImagePathName.loginImage: 'assets/images/Mask Group -1.png',
  ImagePathName.share: 'assets/images/share.png',
  ImagePathName.facebook: 'assets/images/facebook.png',
  ImagePathName.snapchat: 'assets/images/snapchat.png',
  ImagePathName.insta: 'assets/images/insta.png',
  ImagePathName.youtube: 'assets/images/youtube.png',
  ImagePathName.email: 'assets/images/email.png',
  ImagePathName.google: 'assets/images/google.png',
  ImagePathName.whatsapp: 'assets/images/whatsapp.png',
  ImagePathName.auth: 'assets/images/auth.png',
};

String getAssetImage(ImagePathName? imagePath) {
  return IMAGE_PATHS[imagePath] ?? ' ';
}

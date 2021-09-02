import ../src/steganography, pixie

block:
  var image = readImage("tests/steganographyLogo.png")
  encodeMessage(image, "Hello world this is really cool")
  image.writeFile("tests/steganographyLogoEncoded.png")

block:
  var image = readImage("tests/steganographyLogoEncoded.png")
  doAssert decodeMessage(image) == "Hello world this is really cool"

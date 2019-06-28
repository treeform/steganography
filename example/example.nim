import ../src/steganography, flippy

block:
  var image = loadImage("example/steganographyLogo.png")
  encodeMessage(image, "Hello world this is really cool")
  image.save("example/steganographyLogoEncoded.png")

block:
  var image = loadImage("example/steganographyLogoEncoded.png")
  echo decodeMessage(image)



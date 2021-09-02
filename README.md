![Steganography Logo](tests/steganographyLogoEncoded.png)


# Steganography - hide data inside an image.

* Has uses in cryptography: https://en.wikipedia.org/wiki/Steganography
* Can be used in games to transfer user creations: https://nedbatchelder.com/blog/200806/spore_creature_creator_and_steganography.html
* Or just store extra meta infromation in PNG files: https://gamedev.stackexchange.com/questions/72760/how-can-i-store-game-metadata-in-a-png-file

### Installation

`nimble install pixie`

![Github Actions](https://github.com/treeform/steganography/workflows/Github%20Actions/badge.svg)

### Documentation

API reference: https://nimdocs.com/treeform/steganography

## Encode

This is how you would encode an image with a secret message:

```nim
var image = readImage("tests/steganographyLogo.png")
encodeMessage(image, "Hello world this is really cool")
image.writeFile("tests/steganographyLogoEncoded.png")
```

This is how you would decode an image that contains a secret message:

``` nim
var image = readImage("tests/steganographyLogoEncoded.png")
doAssert decodeMessage(image) == "Hello world this is really cool"
```

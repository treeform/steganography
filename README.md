![Steganography Logo](example/steganographyLogo.png)

# Steganography - hide data inside an image.

* Has uses in cryptography: https://en.wikipedia.org/wiki/Steganography
* Can be used in games to transfer user creations: https://nedbatchelder.com/blog/200806/spore_creature_creator_and_steganography.html
* Or just store extra meta infromation in PNG files: https://gamedev.stackexchange.com/questions/72760/how-can-i-store-game-metadata-in-a-png-file


## Encode

This is how you would encode an image with a secret message:

```nim
var image = loadImage("example/steganographyLogo.png")
encodeMessage(image, "Hello world this is really cool")
image.save("example/steganographyLogoEncoded.png")
```

This is how you would decode an image that contains a secret message:

``` nim
var image = loadImage("example/steganographyLogoEncoded.png")
echo decodeMessage(image)
```
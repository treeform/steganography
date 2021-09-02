import pixie

proc encodeMessage*(image: Image, data: string) =
  ## Hide data inside an image
  for i in 0..data.len:
    var dataByte: uint8
    if i < data.len:
      dataByte = uint8(data[i])
    image.data[i*2+0].r = (image.data[i*2+0].r and 0b11111000) + (dataByte and
        0b00000001) shr 0
    image.data[i*2+0].g = (image.data[i*2+0].g and 0b11111100) + (dataByte and
        0b0000110) shr 1
    image.data[i*2+0].b = (image.data[i*2+0].b and 0b11111000) + (dataByte and
        0b0001000) shr 3
    image.data[i*2+0].a = 255
    image.data[i*2+1].r = (image.data[i*2+1].r and 0b11111000) + (dataByte and
        0b00110000) shr 4
    image.data[i*2+1].g = (image.data[i*2+1].g and 0b11111100) + (dataByte and
        0b01000000) shr 6
    image.data[i*2+1].b = (image.data[i*2+1].b and 0b11111000) + (dataByte and
        0b10000000) shr 7
    image.data[i*2+1].a = 255

proc decodeMessage*(image: Image): string =
  ## Extract hidden data in the image
  result = ""
  for i in 0..<(image.data.len div 4):
    var dataByte: uint8
    dataByte += (image.data[i*2+0].r and 0b1) shl 0
    dataByte += (image.data[i*2+0].g and 0b11) shl 1
    dataByte += (image.data[i*2+0].b and 0b1) shl 3
    dataByte += (image.data[i*2+1].r and 0b11) shl 4
    dataByte += (image.data[i*2+1].g and 0b1) shl 6
    dataByte += (image.data[i*2+1].b and 0b1) shl 7

    if dataByte == 0:
      break
    result.add char(dataByte)

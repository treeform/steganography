import flippy


proc encodeMessage*(image: Image, data: string) =
  ## Hide data inside an image
  for i in 0..data.len:
    var dataByte: uint8
    if i < data.len:
      dataByte = uint8(data[i])
    image.data[i*4+0] = (image.data[i*4+0] and 0b11111100) + (dataByte and 0b00000011) shr 0
    image.data[i*4+1] = (image.data[i*4+1] and 0b11111100) + (dataByte and 0b00001100) shr 2
    image.data[i*4+2] = (image.data[i*4+2] and 0b11111100) + (dataByte and 0b00110000) shr 4
    image.data[i*4+3] = (image.data[i*4+3] and 0b11111100) + (dataByte and 0b11000000) shr 6


proc decodeMessage*(image: Image): string =
  ## Extract hidden data in the image
  result = ""
  for i in 0..<(image.data.len div 4):
    var dataByte: uint8
    dataByte += (image.data[i*4+0] and 0b11) shl 0
    dataByte += (image.data[i*4+1] and 0b11) shl 2
    dataByte += (image.data[i*4+2] and 0b11) shl 4
    dataByte += (image.data[i*4+3] and 0b11) shl 6
    if dataByte == 0:
      break
    result.add char(dataByte)

proc decodeMessage*(image: Image, marker_end: string): string =
  ## Extract hidden data with end marker in the image

  result = ""
  for i in 0..<(image.data.len div 4):
    var dataByte: uint8
    dataByte += (image.data[i*4+0] and 0b11) shl 0
    dataByte += (image.data[i*4+1] and 0b11) shl 2
    dataByte += (image.data[i*4+2] and 0b11) shl 4
    dataByte += (image.data[i*4+3] and 0b11) shl 6
    result.add char(dataByte)

  let i = result.find(marker_end)
  result =
    if i > 0:
      result[0..i-1]
    else:
      ""

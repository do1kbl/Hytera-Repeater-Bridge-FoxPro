lparameters RadioID
LOCAL r, g, b

byte3 = 0
byte2 = 0
byte1 = 0
BytesOut = ""

GetID(val(RadioID),@byte3,@byte2,@byte1)

FUNC GetID(Radio_ID,byte3,byte2,byte1)
PRIVATE p,i

p = (256 ^ 2)
i = INT(Radio_ID / p)
byte1 = i
Radio_ID = Radio_ID - (i * p)
p = (256 ^ 1)
i = INT(Radio_ID / p)
byte2 =    i
Radio_ID = Radio_ID - (i * p)
byte3 = INT(Radio_ID)

ID_Byte1 = byte1
ID_Byte2 = byte2
ID_Byte3 = byte3

BytesOut = CHR(byte1) + CHR(byte2) + CHR(byte3)
*messagebox(BytesOut,0)
Return(BytesOut) && This don't work for some reason. Works in Message box but can't be passed, Only returns .T.


lparameters SEND_TO, SEND_FROM, SEND_SMSNUM, SEND_TEXT

*SendSMS( Alltrim(STR(VAL(DESTIN_ID))), Alltrim(STR(VAL(SENDER_ID))), SMSNUM, Alltrim(SMSTEXT) )

*TestMessage = chr(50)+chr(66)+chr(0)+chr(0)+chr(0)+chr(1)+chr(9)+chr(0)+chr(161)+chr(0)+chr(44)+chr(48)+chr(0)+chr(0)+chr(1)+chr(10)+chr(8)+chr(161)+chr(152)+chr(10)+chr(0)+chr(0)+chr(255)+chr(84)+chr(0)+chr(101)+chr(0)+chr(115)+chr(0)+chr(116)+chr(0)+chr(32)+chr(0)+chr(49)+chr(0)+chr(32)+chr(0)+chr(84)+chr(0)+chr(101)+chr(0)+chr(115)+chr(0)+chr(116)+chr(0)+chr(105)+chr(0)+chr(110)+chr(0)+chr(103)+chr(0)+chr(49)+chr(0)+chr(46)+chr(0)+chr(0)+chr(3)+chr(0)
*Thisform.Winsock.RemoteHost = "192.168.1.204" && Send to RD985
*Thisform.Winsock.RemoteHost = "255.255.255.255" && Send to all three on LAN
*Thisform.Winsock.RemotePort = 30007
*Thisform.WinSock.SendData(TestMessage)
TestMessage = ""
TestMessage = TestMessage + chr(50)+chr(66)+chr(0)+chr(0)+chr(0)
*TestMessage = TestMessage + chr(1) && Byte 6 and 15 (Same byte) MessageNumber
TestMessage = TestMessage + chr(val(SEND_SMSNUM))
TestMessage = TestMessage + chr(9)+chr(0)+chr(161)+chr(0)
*TestMessage = TestMessage + chr(44) && Byte 11 = 12 Plus ( LEN(Message) Times 2 )
TestMessage = TestMessage + chr((LEN(SEND_TEXT) * 2) + 12)
TestMessage = TestMessage + chr(48)+chr(0)+chr(0)
*TestMessage = TestMessage + chr(1) && Byte 15 and 6 (Same byte) MessageNumber
TestMessage = TestMessage + chr(val(SEND_SMSNUM))
TestMessage = TestMessage + chr(10)
*TestMessage = TestMessage + chr(8)+chr(161)+chr(152) && Destination_ID
Encode_ID(SEND_TO)
TestMessage = TestMessage + chr(ID_Byte1)+chr(ID_Byte2)+chr(ID_Byte3)
TestMessage = TestMessage + chr(10)
*TestMessage = TestMessage + chr(0)+chr(0)+chr(255) && Sender_ID
Encode_ID(SEND_FROM)
TestMessage = TestMessage + chr(ID_Byte1)+chr(ID_Byte2)+chr(ID_Byte3)
*TestMessage = TestMessage + chr(84)+chr(0)+chr(101)+chr(0)+chr(115)+chr(0)+chr(116)+chr(0)+chr(32)+chr(0)+chr(49)+chr(0)+chr(32)+chr(0)+chr(84)+chr(0)+chr(101)+chr(0)+chr(115)+chr(0)+chr(116)+chr(0)+chr(105)+chr(0)+chr(110)+chr(0)+chr(103)+chr(0)+chr(49)+chr(0)+chr(46)+chr(0)+chr(0)
For SMSPOS = 0 to LEN(SEND_TEXT)
 TestMessage = TestMessage + Left(Right(SEND_TEXT,(LEN(SEND_TEXT)-SMSPOS)),1)
 TestMessage = TestMessage + chr(0)
Next SMSPOS
TestMessage = TestMessage + chr(3)+chr(0) && Add EndOfMessage bytes


*messagebox("SEND_TO, SEND_FROM, SEND_SMSNUM, SEND_TEXT" + CHR(13) + CHR(10) + SEND_TO + " " + SEND_FROM + " " + SEND_SMSNUM + " " + SEND_TEXT + chr(13) + chr(10) + TestMessage,0)

Return(TestMessage)

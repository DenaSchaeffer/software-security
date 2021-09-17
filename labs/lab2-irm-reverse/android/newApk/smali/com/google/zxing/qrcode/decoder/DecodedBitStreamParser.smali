.class final Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "DecodedBitStreamParser.java"


# static fields
.field private static final ALPHANUMERIC_CHARS:[C

.field private static final GB2312_SUBSET:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const-string v0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ $%*+-./:"

    .line 46
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->ALPHANUMERIC_CHARS:[C

    .line 45
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method static decode([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .locals 20
    .param p0, "bytes"    # [B
    .param p1, "version"    # Lcom/google/zxing/qrcode/decoder/Version;
    .param p2, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Lcom/google/zxing/qrcode/decoder/Version;",
            "Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/DecoderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 56
    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    new-instance v2, Lcom/google/zxing/common/BitSource;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/google/zxing/common/BitSource;-><init>([B)V

    .line 57
    .local v2, "bits":Lcom/google/zxing/common/BitSource;
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v7, 0x32

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 58
    .local v3, "result":Ljava/lang/StringBuilder;
    new-instance v6, Ljava/util/ArrayList;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 59
    .local v6, "byteSegments":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v12, -0x1

    .line 60
    .local v12, "symbolSequence":I
    const/4 v13, -0x1

    .line 63
    .local v13, "parityData":I
    const/4 v5, 0x0

    .line 64
    .local v5, "currentCharacterSetECI":Lcom/google/zxing/common/CharacterSetECI;
    const/4 v15, 0x0

    .line 68
    .local v15, "fc1InEffect":Z
    :cond_0
    :try_start_0
    invoke-virtual {v2}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v7

    const/4 v8, 0x4

    if-ge v7, v8, :cond_3

    .line 70
    sget-object v17, Lcom/google/zxing/qrcode/decoder/Mode;->TERMINATOR:Lcom/google/zxing/qrcode/decoder/Mode;

    .line 74
    .local v17, "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    :goto_0
    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->TERMINATOR:Lcom/google/zxing/qrcode/decoder/Mode;

    move-object/from16 v0, v17

    if-eq v0, v7, :cond_2

    .line 75
    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->FNC1_FIRST_POSITION:Lcom/google/zxing/qrcode/decoder/Mode;

    move-object/from16 v0, v17

    if-eq v0, v7, :cond_1

    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->FNC1_SECOND_POSITION:Lcom/google/zxing/qrcode/decoder/Mode;

    move-object/from16 v0, v17

    if-ne v0, v7, :cond_4

    .line 77
    :cond_1
    const/4 v15, 0x1

    .line 120
    :cond_2
    :goto_1
    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->TERMINATOR:Lcom/google/zxing/qrcode/decoder/Mode;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object/from16 v0, v17

    if-ne v0, v7, :cond_0

    .line 126
    new-instance v7, Lcom/google/zxing/common/DecoderResult;

    .line 127
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 128
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_d

    const/4 v10, 0x0

    :goto_2
    if-nez p2, :cond_e

    const/4 v11, 0x0

    :goto_3
    move-object/from16 v8, p0

    .line 129
    invoke-direct/range {v7 .. v13}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;II)V

    .line 126
    return-object v7

    .line 72
    .end local v17    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    :cond_3
    const/4 v7, 0x4

    :try_start_1
    invoke-virtual {v2, v7}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v7

    invoke-static {v7}, Lcom/google/zxing/qrcode/decoder/Mode;->forBits(I)Lcom/google/zxing/qrcode/decoder/Mode;

    move-result-object v17

    .restart local v17    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    goto :goto_0

    .line 78
    :cond_4
    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->STRUCTURED_APPEND:Lcom/google/zxing/qrcode/decoder/Mode;

    move-object/from16 v0, v17

    if-ne v0, v7, :cond_6

    .line 79
    invoke-virtual {v2}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v7

    const/16 v8, 0x10

    if-ge v7, v8, :cond_5

    .line 80
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v7

    throw v7
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 121
    .end local v17    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    :catch_0
    move-exception v16

    .line 123
    .local v16, "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v7

    throw v7

    .line 84
    .end local v16    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v17    # "mode":Lcom/google/zxing/qrcode/decoder/Mode;
    :cond_5
    const/16 v7, 0x8

    :try_start_2
    invoke-virtual {v2, v7}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v12

    .line 85
    const/16 v7, 0x8

    invoke-virtual {v2, v7}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v13

    goto :goto_1

    .line 86
    :cond_6
    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->ECI:Lcom/google/zxing/qrcode/decoder/Mode;

    move-object/from16 v0, v17

    if-ne v0, v7, :cond_7

    .line 88
    invoke-static {v2}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->parseECIValue(Lcom/google/zxing/common/BitSource;)I

    move-result v19

    .line 89
    .local v19, "value":I
    invoke-static/range {v19 .. v19}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByValue(I)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v5

    .line 90
    if-nez v5, :cond_2

    .line 91
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v7

    throw v7

    .line 95
    .end local v19    # "value":I
    :cond_7
    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->HANZI:Lcom/google/zxing/qrcode/decoder/Mode;

    move-object/from16 v0, v17

    if-ne v0, v7, :cond_8

    .line 97
    const/4 v7, 0x4

    invoke-virtual {v2, v7}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v18

    .line 98
    .local v18, "subset":I
    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v7

    invoke-virtual {v2, v7}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v14

    .line 99
    .local v14, "countHanzi":I
    const/4 v7, 0x1

    move/from16 v0, v18

    if-ne v0, v7, :cond_2

    .line 100
    invoke-static {v2, v3, v14}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decodeHanziSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V

    goto :goto_1

    .line 105
    .end local v14    # "countHanzi":I
    .end local v18    # "subset":I
    :cond_8
    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v7

    invoke-virtual {v2, v7}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v4

    .line 106
    .local v4, "count":I
    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->NUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    move-object/from16 v0, v17

    if-ne v0, v7, :cond_9

    .line 107
    invoke-static {v2, v3, v4}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decodeNumericSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V

    goto/16 :goto_1

    .line 108
    :cond_9
    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->ALPHANUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    move-object/from16 v0, v17

    if-ne v0, v7, :cond_a

    .line 109
    invoke-static {v2, v3, v4, v15}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decodeAlphanumericSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;IZ)V

    goto/16 :goto_1

    .line 110
    :cond_a
    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    move-object/from16 v0, v17

    if-ne v0, v7, :cond_b

    move-object/from16 v7, p3

    .line 111
    invoke-static/range {v2 .. v7}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decodeByteSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;ILcom/google/zxing/common/CharacterSetECI;Ljava/util/Collection;Ljava/util/Map;)V

    goto/16 :goto_1

    .line 112
    :cond_b
    sget-object v7, Lcom/google/zxing/qrcode/decoder/Mode;->KANJI:Lcom/google/zxing/qrcode/decoder/Mode;

    move-object/from16 v0, v17

    if-ne v0, v7, :cond_c

    .line 113
    invoke-static {v2, v3, v4}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decodeKanjiSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V

    goto/16 :goto_1

    .line 115
    :cond_c
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v7

    throw v7
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    .end local v4    # "count":I
    :cond_d
    move-object v10, v6

    .line 128
    goto/16 :goto_2

    .line 129
    :cond_e
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;->toString()Ljava/lang/String;

    move-result-object v11

    goto/16 :goto_3
.end method

.method private static decodeAlphanumericSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;IZ)V
    .locals 8
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "count"    # I
    .param p3, "fc1InEffect"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x25

    const/16 v6, 0xb

    const/4 v5, 0x6

    const/4 v4, 0x1

    .line 255
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 256
    .local v2, "start":I
    :goto_0
    if-le p2, v4, :cond_1

    .line 257
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v3

    if-ge v3, v6, :cond_0

    .line 258
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 260
    :cond_0
    invoke-virtual {p0, v6}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v1

    .line 261
    .local v1, "nextTwoCharsBits":I
    div-int/lit8 v3, v1, 0x2d

    invoke-static {v3}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 262
    rem-int/lit8 v3, v1, 0x2d

    invoke-static {v3}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 263
    add-int/lit8 p2, p2, -0x2

    .line 264
    goto :goto_0

    .line 265
    .end local v1    # "nextTwoCharsBits":I
    :cond_1
    if-ne p2, v4, :cond_3

    .line 267
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v3

    if-ge v3, v5, :cond_2

    .line 268
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 270
    :cond_2
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v3

    invoke-static {v3}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 273
    :cond_3
    if-eqz p3, :cond_6

    .line 275
    move v0, v2

    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-ge v0, v3, :cond_6

    .line 276
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_4

    .line 277
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_5

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_5

    .line 279
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 275
    :cond_4
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 282
    :cond_5
    const/16 v3, 0x1d

    invoke-virtual {p1, v0, v3}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_2

    .line 287
    .end local v0    # "i":I
    :cond_6
    return-void
.end method

.method private static decodeByteSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;ILcom/google/zxing/common/CharacterSetECI;Ljava/util/Collection;Ljava/util/Map;)V
    .locals 6
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "count"    # I
    .param p3, "currentCharacterSetECI"    # Lcom/google/zxing/common/CharacterSetECI;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitSource;",
            "Ljava/lang/StringBuilder;",
            "I",
            "Lcom/google/zxing/common/CharacterSetECI;",
            "Ljava/util/Collection",
            "<[B>;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 216
    .local p4, "byteSegments":Ljava/util/Collection;, "Ljava/util/Collection<[B>;"
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    mul-int/lit8 v4, p2, 0x8

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v5

    if-le v4, v5, :cond_0

    .line 217
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4

    .line 220
    :cond_0
    new-array v3, p2, [B

    .line 221
    .local v3, "readBytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_1

    .line 222
    const/16 v4, 0x8

    invoke-virtual {p0, v4}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v3, v1

    .line 221
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 225
    :cond_1
    if-nez p3, :cond_2

    .line 231
    invoke-static {v3, p5}, Lcom/google/zxing/common/StringUtils;->guessEncoding([BLjava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, "encoding":Ljava/lang/String;
    :goto_1
    :try_start_0
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v3, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    invoke-interface {p4, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 241
    return-void

    .line 233
    .end local v0    # "encoding":Ljava/lang/String;
    :cond_2
    invoke-virtual {p3}, Lcom/google/zxing/common/CharacterSetECI;->name()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "encoding":Ljava/lang/String;
    goto :goto_1

    .line 237
    :catch_0
    move-exception v2

    .line 238
    .local v2, "ignored":Ljava/io/UnsupportedEncodingException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4
.end method

.method private static decodeHanziSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V
    .locals 7
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 141
    mul-int/lit8 v5, p2, 0xd

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v6

    if-le v5, v6, :cond_0

    .line 142
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    .line 147
    :cond_0
    mul-int/lit8 v5, p2, 0x2

    new-array v1, v5, [B

    .line 148
    .local v1, "buffer":[B
    const/4 v3, 0x0

    .line 149
    .local v3, "offset":I
    :goto_0
    if-lez p2, :cond_2

    .line 151
    const/16 v5, 0xd

    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v4

    .line 152
    .local v4, "twoBytes":I
    div-int/lit8 v5, v4, 0x60

    shl-int/lit8 v5, v5, 0x8

    rem-int/lit8 v6, v4, 0x60

    or-int v0, v5, v6

    .line 153
    .local v0, "assembledTwoBytes":I
    const/16 v5, 0x3bf

    if-ge v0, v5, :cond_1

    .line 155
    const v5, 0xa1a1

    add-int/2addr v0, v5

    .line 160
    :goto_1
    shr-int/lit8 v5, v0, 0x8

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v1, v3

    .line 161
    add-int/lit8 v5, v3, 0x1

    and-int/lit16 v6, v0, 0xff

    int-to-byte v6, v6

    aput-byte v6, v1, v5

    .line 162
    add-int/lit8 v3, v3, 0x2

    .line 163
    add-int/lit8 p2, p2, -0x1

    .line 164
    goto :goto_0

    .line 158
    :cond_1
    const v5, 0xa6a1

    add-int/2addr v0, v5

    goto :goto_1

    .line 167
    .end local v0    # "assembledTwoBytes":I
    .end local v4    # "twoBytes":I
    :cond_2
    :try_start_0
    new-instance v5, Ljava/lang/String;

    const-string v6, "GB2312"

    invoke-direct {v5, v1, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    return-void

    .line 168
    :catch_0
    move-exception v2

    .line 169
    .local v2, "ignored":Ljava/io/UnsupportedEncodingException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5
.end method

.method private static decodeKanjiSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V
    .locals 7
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 177
    mul-int/lit8 v5, p2, 0xd

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v6

    if-le v5, v6, :cond_0

    .line 178
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    .line 183
    :cond_0
    mul-int/lit8 v5, p2, 0x2

    new-array v1, v5, [B

    .line 184
    .local v1, "buffer":[B
    const/4 v3, 0x0

    .line 185
    .local v3, "offset":I
    :goto_0
    if-lez p2, :cond_2

    .line 187
    const/16 v5, 0xd

    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v4

    .line 188
    .local v4, "twoBytes":I
    div-int/lit16 v5, v4, 0xc0

    shl-int/lit8 v5, v5, 0x8

    rem-int/lit16 v6, v4, 0xc0

    or-int v0, v5, v6

    .line 189
    .local v0, "assembledTwoBytes":I
    const/16 v5, 0x1f00

    if-ge v0, v5, :cond_1

    .line 191
    const v5, 0x8140

    add-int/2addr v0, v5

    .line 196
    :goto_1
    shr-int/lit8 v5, v0, 0x8

    int-to-byte v5, v5

    aput-byte v5, v1, v3

    .line 197
    add-int/lit8 v5, v3, 0x1

    int-to-byte v6, v0

    aput-byte v6, v1, v5

    .line 198
    add-int/lit8 v3, v3, 0x2

    .line 199
    add-int/lit8 p2, p2, -0x1

    .line 200
    goto :goto_0

    .line 194
    :cond_1
    const v5, 0xc140

    add-int/2addr v0, v5

    goto :goto_1

    .line 203
    .end local v0    # "assembledTwoBytes":I
    .end local v4    # "twoBytes":I
    :cond_2
    :try_start_0
    new-instance v5, Ljava/lang/String;

    const-string v6, "SJIS"

    invoke-direct {v5, v1, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    return-void

    .line 204
    :catch_0
    move-exception v2

    .line 205
    .local v2, "ignored":Ljava/io/UnsupportedEncodingException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5
.end method

.method private static decodeNumericSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;I)V
    .locals 7
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x7

    const/4 v5, 0x4

    const/16 v4, 0xa

    .line 293
    :goto_0
    const/4 v3, 0x3

    if-lt p2, v3, :cond_2

    .line 295
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v3

    if-ge v3, v4, :cond_0

    .line 296
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 298
    :cond_0
    invoke-virtual {p0, v4}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v1

    .line 299
    .local v1, "threeDigitsBits":I
    const/16 v3, 0x3e8

    if-lt v1, v3, :cond_1

    .line 300
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 302
    :cond_1
    div-int/lit8 v3, v1, 0x64

    invoke-static {v3}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 303
    div-int/lit8 v3, v1, 0xa

    rem-int/lit8 v3, v3, 0xa

    invoke-static {v3}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 304
    rem-int/lit8 v3, v1, 0xa

    invoke-static {v3}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 305
    add-int/lit8 p2, p2, -0x3

    .line 306
    goto :goto_0

    .line 307
    .end local v1    # "threeDigitsBits":I
    :cond_2
    const/4 v3, 0x2

    if-ne p2, v3, :cond_6

    .line 309
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v3

    if-ge v3, v6, :cond_3

    .line 310
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 312
    :cond_3
    invoke-virtual {p0, v6}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    .line 313
    .local v2, "twoDigitsBits":I
    const/16 v3, 0x64

    if-lt v2, v3, :cond_4

    .line 314
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 316
    :cond_4
    div-int/lit8 v3, v2, 0xa

    invoke-static {v3}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 317
    rem-int/lit8 v3, v2, 0xa

    invoke-static {v3}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 329
    .end local v2    # "twoDigitsBits":I
    :cond_5
    :goto_1
    return-void

    .line 318
    :cond_6
    const/4 v3, 0x1

    if-ne p2, v3, :cond_5

    .line 320
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v3

    if-ge v3, v5, :cond_7

    .line 321
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 323
    :cond_7
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v0

    .line 324
    .local v0, "digitBits":I
    if-lt v0, v4, :cond_8

    .line 325
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 327
    :cond_8
    invoke-static {v0}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->toAlphaNumericChar(I)C

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method private static parseECIValue(Lcom/google/zxing/common/BitSource;)I
    .locals 6
    .param p0, "bits"    # Lcom/google/zxing/common/BitSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x8

    .line 332
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v0

    .line 333
    .local v0, "firstByte":I
    and-int/lit16 v3, v0, 0x80

    if-nez v3, :cond_0

    .line 335
    and-int/lit8 v3, v0, 0x7f

    .line 345
    :goto_0
    return v3

    .line 337
    :cond_0
    and-int/lit16 v3, v0, 0xc0

    const/16 v4, 0x80

    if-ne v3, v4, :cond_1

    .line 339
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v1

    .line 340
    .local v1, "secondByte":I
    and-int/lit8 v3, v0, 0x3f

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v3, v1

    goto :goto_0

    .line 342
    .end local v1    # "secondByte":I
    :cond_1
    and-int/lit16 v3, v0, 0xe0

    const/16 v4, 0xc0

    if-ne v3, v4, :cond_2

    .line 344
    const/16 v3, 0x10

    invoke-virtual {p0, v3}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    .line 345
    .local v2, "secondThirdBytes":I
    and-int/lit8 v3, v0, 0x1f

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v3, v2

    goto :goto_0

    .line 347
    .end local v2    # "secondThirdBytes":I
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3
.end method

.method private static toAlphaNumericChar(I)C
    .locals 1
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 244
    sget-object v0, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->ALPHANUMERIC_CHARS:[C

    array-length v0, v0

    if-lt p0, v0, :cond_0

    .line 245
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    .line 247
    :cond_0
    sget-object v0, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->ALPHANUMERIC_CHARS:[C

    aget-char v0, v0, p0

    return v0
.end method

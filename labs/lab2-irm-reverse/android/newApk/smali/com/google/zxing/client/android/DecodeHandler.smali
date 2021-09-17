.class final Lcom/google/zxing/client/android/DecodeHandler;
.super Landroid/os/Handler;
.source "DecodeHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final activity:Lcom/google/zxing/client/android/CaptureActivity;

.field private frameCount:I

.field private final multiFormatReader:Lcom/google/zxing/MultiFormatReader;

.field private running:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lcom/google/zxing/client/android/DecodeHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/DecodeHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/google/zxing/client/android/CaptureActivity;Ljava/util/Map;)V
    .locals 1
    .param p1, "activity"    # Lcom/google/zxing/client/android/CaptureActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/client/android/CaptureActivity;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;Ljava/lang/Object;>;"
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/zxing/client/android/DecodeHandler;->running:Z

    .line 49
    new-instance v0, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {v0}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/client/android/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    .line 50
    iget-object v0, p0, Lcom/google/zxing/client/android/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v0, p2}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    .line 51
    iput-object p1, p0, Lcom/google/zxing/client/android/DecodeHandler;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    .line 52
    return-void
.end method

.method private static YUV_NV21_TO_RGB([I[BII)V
    .locals 26
    .param p0, "argb"    # [I
    .param p1, "yuv"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 136
    mul-int v14, p2, p3

    .line 138
    .local v14, "frameSize":I
    const/16 v17, 0x0

    .line 139
    .local v17, "ii":I
    const/16 v18, 0x0

    .line 140
    .local v18, "ij":I
    const/4 v12, 0x1

    .line 141
    .local v12, "di":I
    const/4 v13, 0x1

    .line 143
    .local v13, "dj":I
    const/4 v2, 0x0

    .line 144
    .local v2, "a":I
    const/16 v16, 0x0

    .local v16, "i":I
    const/4 v10, 0x0

    .local v10, "ci":I
    :goto_0
    move/from16 v0, v16

    move/from16 v1, p3

    if-ge v0, v1, :cond_8

    .line 145
    const/16 v19, 0x0

    .local v19, "j":I
    const/4 v11, 0x0

    .local v11, "cj":I
    move v3, v2

    .end local v2    # "a":I
    .local v3, "a":I
    :goto_1
    move/from16 v0, v19

    move/from16 v1, p2

    if-ge v0, v1, :cond_7

    .line 146
    mul-int v24, v10, p2

    add-int v24, v24, v11

    aget-byte v24, p1, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    .line 147
    .local v23, "y":I
    shr-int/lit8 v24, v10, 0x1

    mul-int v24, v24, p2

    add-int v24, v24, v14

    and-int/lit8 v25, v11, -0x2

    add-int v24, v24, v25

    add-int/lit8 v24, v24, 0x0

    aget-byte v24, p1, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v22, v0

    .line 148
    .local v22, "v":I
    shr-int/lit8 v24, v10, 0x1

    mul-int v24, v24, p2

    add-int v24, v24, v14

    and-int/lit8 v25, v11, -0x2

    add-int v24, v24, v25

    add-int/lit8 v24, v24, 0x1

    aget-byte v24, p1, v24

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    .line 149
    .local v21, "u":I
    const/16 v24, 0x10

    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_0

    const/16 v23, 0x10

    .line 151
    :cond_0
    add-int/lit8 v24, v23, -0x10

    move/from16 v0, v24

    mul-int/lit16 v4, v0, 0x4a8

    .line 152
    .local v4, "a0":I
    add-int/lit8 v24, v22, -0x80

    move/from16 v0, v24

    mul-int/lit16 v5, v0, 0x662

    .line 153
    .local v5, "a1":I
    add-int/lit8 v24, v22, -0x80

    move/from16 v0, v24

    mul-int/lit16 v6, v0, 0x340

    .line 154
    .local v6, "a2":I
    add-int/lit8 v24, v21, -0x80

    move/from16 v0, v24

    mul-int/lit16 v7, v0, 0x190

    .line 155
    .local v7, "a3":I
    add-int/lit8 v24, v21, -0x80

    move/from16 v0, v24

    mul-int/lit16 v8, v0, 0x812

    .line 157
    .local v8, "a4":I
    add-int v24, v4, v5

    shr-int/lit8 v20, v24, 0xa

    .line 158
    .local v20, "r":I
    sub-int v24, v4, v6

    sub-int v24, v24, v7

    shr-int/lit8 v15, v24, 0xa

    .line 159
    .local v15, "g":I
    add-int v24, v4, v8

    shr-int/lit8 v9, v24, 0xa

    .line 161
    .local v9, "b":I
    if-gez v20, :cond_4

    const/16 v20, 0x0

    .line 162
    :cond_1
    :goto_2
    if-gez v15, :cond_5

    const/4 v15, 0x0

    .line 163
    :cond_2
    :goto_3
    if-gez v9, :cond_6

    const/4 v9, 0x0

    .line 165
    :cond_3
    :goto_4
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "a":I
    .restart local v2    # "a":I
    shl-int/lit8 v24, v20, 0x10

    or-int/lit8 v24, v24, 0x0

    shl-int/lit8 v25, v15, 0x8

    or-int v24, v24, v25

    or-int v24, v24, v9

    aput v24, p0, v3

    .line 145
    add-int/lit8 v19, v19, 0x1

    add-int/lit8 v11, v11, 0x1

    move v3, v2

    .end local v2    # "a":I
    .restart local v3    # "a":I
    goto/16 :goto_1

    .line 161
    :cond_4
    const/16 v24, 0xff

    move/from16 v0, v20

    move/from16 v1, v24

    if-le v0, v1, :cond_1

    const/16 v20, 0xff

    goto :goto_2

    .line 162
    :cond_5
    const/16 v24, 0xff

    move/from16 v0, v24

    if-le v15, v0, :cond_2

    const/16 v15, 0xff

    goto :goto_3

    .line 163
    :cond_6
    const/16 v24, 0xff

    move/from16 v0, v24

    if-le v9, v0, :cond_3

    const/16 v9, 0xff

    goto :goto_4

    .line 144
    .end local v4    # "a0":I
    .end local v5    # "a1":I
    .end local v6    # "a2":I
    .end local v7    # "a3":I
    .end local v8    # "a4":I
    .end local v9    # "b":I
    .end local v15    # "g":I
    .end local v20    # "r":I
    .end local v21    # "u":I
    .end local v22    # "v":I
    .end local v23    # "y":I
    :cond_7
    add-int/lit8 v16, v16, 0x1

    add-int/lit8 v10, v10, 0x1

    move v2, v3

    .end local v3    # "a":I
    .restart local v2    # "a":I
    goto/16 :goto_0

    .line 168
    .end local v11    # "cj":I
    .end local v19    # "j":I
    :cond_8
    return-void
.end method

.method private static bundleThumbnail(Lcom/google/zxing/PlanarYUVLuminanceSource;Landroid/os/Bundle;)V
    .locals 8
    .param p0, "source"    # Lcom/google/zxing/PlanarYUVLuminanceSource;
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->renderThumbnail()[I

    move-result-object v0

    .line 126
    .local v0, "pixels":[I
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getThumbnailWidth()I

    move-result v2

    .line 127
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getThumbnailHeight()I

    move-result v4

    .line 128
    .local v4, "height":I
    const/4 v1, 0x0

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move v3, v2

    invoke-static/range {v0 .. v5}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 129
    .local v6, "bitmap":Landroid/graphics/Bitmap;
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 130
    .local v7, "out":Ljava/io/ByteArrayOutputStream;
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x32

    invoke-virtual {v6, v1, v3, v7}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 131
    const-string v1, "barcode_bitmap"

    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 132
    const-string v1, "barcode_scaled_factor"

    int-to-float v3, v2

    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v3, v5

    invoke-virtual {p1, v1, v3}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 133
    return-void
.end method

.method private decode([BII)V
    .locals 20
    .param p1, "data"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 79
    .local v14, "start":J
    const/4 v12, 0x0

    .line 81
    .local v12, "rawResult":Lcom/google/zxing/Result;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/zxing/client/android/DecodeHandler;->frameCount:I

    move/from16 v16, v0

    const/16 v17, 0x3

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_1

    .line 82
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/zxing/client/android/DecodeHandler;->frameCount:I

    .line 83
    mul-int v16, p2, p3

    move/from16 v0, v16

    new-array v4, v0, [I

    .line 84
    .local v4, "argb":[I
    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-static {v4, v0, v1, v2}, Lcom/google/zxing/client/android/DecodeHandler;->YUV_NV21_TO_RGB([I[BII)V

    .line 85
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    array-length v0, v4

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v10, v0, :cond_0

    .line 86
    const v16, 0xffffff

    aget v17, v4, v10

    sub-int v16, v16, v17

    aput v16, v4, v10

    .line 85
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 88
    :cond_0
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/google/zxing/client/android/DecodeHandler;->encodeYUV420SP([B[III)V

    .line 90
    .end local v4    # "argb":[I
    .end local v10    # "i":I
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/zxing/client/android/DecodeHandler;->frameCount:I

    move/from16 v16, v0

    add-int/lit8 v16, v16, 0x1

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/zxing/client/android/DecodeHandler;->frameCount:I

    .line 92
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/DecodeHandler;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/client/android/CaptureActivity;->getCameraManager()Lcom/google/zxing/client/android/camera/CameraManager;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/zxing/client/android/camera/CameraManager;->buildLuminanceSource([BII)Lcom/google/zxing/PlanarYUVLuminanceSource;

    move-result-object v13

    .line 93
    .local v13, "source":Lcom/google/zxing/PlanarYUVLuminanceSource;
    if-eqz v13, :cond_2

    .line 94
    new-instance v5, Lcom/google/zxing/BinaryBitmap;

    new-instance v16, Lcom/google/zxing/common/HybridBinarizer;

    move-object/from16 v0, v16

    invoke-direct {v0, v13}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    move-object/from16 v0, v16

    invoke-direct {v5, v0}, Lcom/google/zxing/BinaryBitmap;-><init>(Lcom/google/zxing/Binarizer;)V

    .line 96
    .local v5, "bitmap":Lcom/google/zxing/BinaryBitmap;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Lcom/google/zxing/MultiFormatReader;->decodeWithState(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v12

    .line 100
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 104
    .end local v5    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/DecodeHandler;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/client/android/CaptureActivity;->getHandler()Landroid/os/Handler;

    move-result-object v7

    .line 105
    .local v7, "handler":Landroid/os/Handler;
    if-eqz v12, :cond_4

    .line 107
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 108
    .local v8, "end":J
    sget-object v16, Lcom/google/zxing/client/android/DecodeHandler;->TAG:Ljava/lang/String;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Found barcode in "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    sub-long v18, v8, v14

    invoke-virtual/range {v17 .. v19}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " ms"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    if-eqz v7, :cond_3

    .line 110
    sget v16, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->decode_succeeded:I

    move/from16 v0, v16

    invoke-static {v7, v0, v12}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    .line 111
    .local v11, "message":Landroid/os/Message;
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 112
    .local v6, "bundle":Landroid/os/Bundle;
    invoke-static {v13, v6}, Lcom/google/zxing/client/android/DecodeHandler;->bundleThumbnail(Lcom/google/zxing/PlanarYUVLuminanceSource;Landroid/os/Bundle;)V

    .line 113
    invoke-virtual {v11, v6}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 114
    invoke-virtual {v11}, Landroid/os/Message;->sendToTarget()V

    .line 122
    .end local v6    # "bundle":Landroid/os/Bundle;
    .end local v8    # "end":J
    .end local v11    # "message":Landroid/os/Message;
    :cond_3
    :goto_2
    return-void

    .line 97
    .end local v7    # "handler":Landroid/os/Handler;
    .restart local v5    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    :catch_0
    move-exception v16

    .line 100
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/MultiFormatReader;->reset()V

    goto :goto_1

    :catchall_0
    move-exception v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/MultiFormatReader;->reset()V

    throw v16

    .line 117
    .end local v5    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    .restart local v7    # "handler":Landroid/os/Handler;
    :cond_4
    if-eqz v7, :cond_3

    .line 118
    sget v16, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->decode_failed:I

    move/from16 v0, v16

    invoke-static {v7, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v11

    .line 119
    .restart local v11    # "message":Landroid/os/Message;
    invoke-virtual {v11}, Landroid/os/Message;->sendToTarget()V

    goto :goto_2
.end method


# virtual methods
.method encodeYUV420SP([B[III)V
    .locals 21
    .param p1, "yuv420sp"    # [B
    .param p2, "argb"    # [I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 171
    mul-int v8, p3, p4

    .line 173
    .local v8, "frameSize":I
    const/16 v16, 0x0

    .line 174
    .local v16, "yIndex":I
    move v12, v8

    .line 175
    .local v12, "uIndex":I
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v18, v0

    sub-int v18, v18, v8

    div-int/lit8 v18, v18, 0x2

    add-int v14, v8, v18

    .line 176
    .local v14, "vIndex":I
    sget-object v18, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 180
    const/4 v10, 0x0

    .line 181
    .local v10, "index":I
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_0
    move/from16 v0, p4

    if-ge v11, v0, :cond_7

    .line 182
    const/4 v9, 0x0

    .local v9, "i":I
    move v15, v14

    .end local v14    # "vIndex":I
    .local v15, "vIndex":I
    move v13, v12

    .end local v12    # "uIndex":I
    .local v13, "uIndex":I
    move/from16 v17, v16

    .end local v16    # "yIndex":I
    .local v17, "yIndex":I
    :goto_1
    move/from16 v0, p3

    if-ge v9, v0, :cond_6

    .line 184
    aget v18, p2, v10

    const/high16 v19, -0x1000000

    and-int v18, v18, v19

    shr-int/lit8 v7, v18, 0x18

    .line 185
    .local v7, "a":I
    aget v18, p2, v10

    const/high16 v19, 0xff0000

    and-int v18, v18, v19

    shr-int/lit8 v3, v18, 0x10

    .line 186
    .local v3, "R":I
    aget v18, p2, v10

    const v19, 0xff00

    and-int v18, v18, v19

    shr-int/lit8 v2, v18, 0x8

    .line 187
    .local v2, "G":I
    aget v18, p2, v10

    move/from16 v0, v18

    and-int/lit16 v0, v0, 0xff

    move/from16 v18, v0

    shr-int/lit8 v1, v18, 0x0

    .line 191
    .local v1, "B":I
    mul-int/lit8 v18, v3, 0x42

    mul-int/lit16 v0, v2, 0x81

    move/from16 v19, v0

    add-int v18, v18, v19

    mul-int/lit8 v19, v1, 0x19

    add-int v18, v18, v19

    move/from16 v0, v18

    add-int/lit16 v0, v0, 0x80

    move/from16 v18, v0

    shr-int/lit8 v18, v18, 0x8

    add-int/lit8 v6, v18, 0x10

    .line 192
    .local v6, "Y":I
    mul-int/lit8 v18, v3, -0x26

    mul-int/lit8 v19, v2, 0x4a

    sub-int v18, v18, v19

    mul-int/lit8 v19, v1, 0x70

    add-int v18, v18, v19

    move/from16 v0, v18

    add-int/lit16 v0, v0, 0x80

    move/from16 v18, v0

    shr-int/lit8 v18, v18, 0x8

    move/from16 v0, v18

    add-int/lit16 v4, v0, 0x80

    .line 193
    .local v4, "U":I
    mul-int/lit8 v18, v3, 0x70

    mul-int/lit8 v19, v2, 0x5e

    sub-int v18, v18, v19

    mul-int/lit8 v19, v1, 0x12

    sub-int v18, v18, v19

    move/from16 v0, v18

    add-int/lit16 v0, v0, 0x80

    move/from16 v18, v0

    shr-int/lit8 v18, v18, 0x8

    move/from16 v0, v18

    add-int/lit16 v5, v0, 0x80

    .line 198
    .local v5, "V":I
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "yIndex":I
    .restart local v16    # "yIndex":I
    if-gez v6, :cond_3

    const/4 v6, 0x0

    .end local v6    # "Y":I
    :cond_0
    :goto_2
    int-to-byte v0, v6

    move/from16 v18, v0

    aput-byte v18, p1, v17

    .line 199
    rem-int/lit8 v18, v11, 0x2

    if-nez v18, :cond_8

    rem-int/lit8 v18, v10, 0x2

    if-nez v18, :cond_8

    .line 200
    add-int/lit8 v12, v13, 0x1

    .end local v13    # "uIndex":I
    .restart local v12    # "uIndex":I
    if-gez v4, :cond_4

    const/4 v4, 0x0

    .end local v4    # "U":I
    :cond_1
    :goto_3
    int-to-byte v0, v4

    move/from16 v18, v0

    aput-byte v18, p1, v13

    .line 201
    add-int/lit8 v14, v15, 0x1

    .end local v15    # "vIndex":I
    .restart local v14    # "vIndex":I
    if-gez v5, :cond_5

    const/4 v5, 0x0

    .end local v5    # "V":I
    :cond_2
    :goto_4
    int-to-byte v0, v5

    move/from16 v18, v0

    aput-byte v18, p1, v15

    .line 204
    :goto_5
    add-int/lit8 v10, v10, 0x1

    .line 182
    add-int/lit8 v9, v9, 0x1

    move v15, v14

    .end local v14    # "vIndex":I
    .restart local v15    # "vIndex":I
    move v13, v12

    .end local v12    # "uIndex":I
    .restart local v13    # "uIndex":I
    move/from16 v17, v16

    .end local v16    # "yIndex":I
    .restart local v17    # "yIndex":I
    goto/16 :goto_1

    .line 198
    .end local v17    # "yIndex":I
    .restart local v4    # "U":I
    .restart local v5    # "V":I
    .restart local v6    # "Y":I
    .restart local v16    # "yIndex":I
    :cond_3
    const/16 v18, 0xff

    move/from16 v0, v18

    if-le v6, v0, :cond_0

    const/16 v6, 0xff

    goto :goto_2

    .line 200
    .end local v6    # "Y":I
    .end local v13    # "uIndex":I
    .restart local v12    # "uIndex":I
    :cond_4
    const/16 v18, 0xff

    move/from16 v0, v18

    if-le v4, v0, :cond_1

    const/16 v4, 0xff

    goto :goto_3

    .line 201
    .end local v4    # "U":I
    .end local v15    # "vIndex":I
    .restart local v14    # "vIndex":I
    :cond_5
    const/16 v18, 0xff

    move/from16 v0, v18

    if-le v5, v0, :cond_2

    const/16 v5, 0xff

    goto :goto_4

    .line 181
    .end local v1    # "B":I
    .end local v2    # "G":I
    .end local v3    # "R":I
    .end local v5    # "V":I
    .end local v7    # "a":I
    .end local v12    # "uIndex":I
    .end local v14    # "vIndex":I
    .end local v16    # "yIndex":I
    .restart local v13    # "uIndex":I
    .restart local v15    # "vIndex":I
    .restart local v17    # "yIndex":I
    :cond_6
    add-int/lit8 v11, v11, 0x1

    move v14, v15

    .end local v15    # "vIndex":I
    .restart local v14    # "vIndex":I
    move v12, v13

    .end local v13    # "uIndex":I
    .restart local v12    # "uIndex":I
    move/from16 v16, v17

    .end local v17    # "yIndex":I
    .restart local v16    # "yIndex":I
    goto/16 :goto_0

    .line 207
    .end local v9    # "i":I
    :cond_7
    return-void

    .end local v12    # "uIndex":I
    .end local v14    # "vIndex":I
    .restart local v1    # "B":I
    .restart local v2    # "G":I
    .restart local v3    # "R":I
    .restart local v4    # "U":I
    .restart local v5    # "V":I
    .restart local v7    # "a":I
    .restart local v9    # "i":I
    .restart local v13    # "uIndex":I
    .restart local v15    # "vIndex":I
    :cond_8
    move v14, v15

    .end local v15    # "vIndex":I
    .restart local v14    # "vIndex":I
    move v12, v13

    .end local v13    # "uIndex":I
    .restart local v12    # "uIndex":I
    goto :goto_5
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 56
    iget-boolean v0, p0, Lcom/google/zxing/client/android/DecodeHandler;->running:Z

    if-nez v0, :cond_1

    .line 67
    :cond_0
    :goto_0
    return-void

    .line 59
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->decode:I

    if-ne v0, v1, :cond_2

    .line 60
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    check-cast v0, [B

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-direct {p0, v0, v1, v2}, Lcom/google/zxing/client/android/DecodeHandler;->decode([BII)V

    goto :goto_0

    .line 62
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->quit:I

    if-ne v0, v1, :cond_0

    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/client/android/DecodeHandler;->running:Z

    .line 64
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    goto :goto_0
.end method

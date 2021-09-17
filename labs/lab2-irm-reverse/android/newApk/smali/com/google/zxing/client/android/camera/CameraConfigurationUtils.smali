.class public final Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;
.super Ljava/lang/Object;
.source "CameraConfigurationUtils.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xf
.end annotation


# static fields
.field private static final AREA_PER_1000:I = 0x190

.field private static final MAX_ASPECT_DISTORTION:D = 0.15

.field private static final MAX_EXPOSURE_COMPENSATION:F = 1.5f

.field private static final MAX_FPS:I = 0x14

.field private static final MIN_EXPOSURE_COMPENSATION:F = 0.0f

.field private static final MIN_FPS:I = 0xa

.field private static final MIN_PREVIEW_PIXELS:I = 0x25800

.field private static final SEMICOLON:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String; = "CameraConfiguration"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const-string v0, ";"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->SEMICOLON:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method

.method private static buildMiddleArea(I)Ljava/util/List;
    .locals 4
    .param p0, "areaPer1000"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Landroid/hardware/Camera$Area;",
            ">;"
        }
    .end annotation

    .prologue
    .line 194
    new-instance v0, Landroid/hardware/Camera$Area;

    new-instance v1, Landroid/graphics/Rect;

    neg-int v2, p0

    neg-int v3, p0

    invoke-direct {v1, v2, v3, p0, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static collectStats(Landroid/hardware/Camera$Parameters;)Ljava/lang/String;
    .locals 1
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 413
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->collectStats(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static collectStats(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 7
    .param p0, "flattenedParams"    # Ljava/lang/CharSequence;

    .prologue
    const/16 v6, 0xa

    .line 417
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x3e8

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 419
    .local v2, "result":Ljava/lang/StringBuilder;
    const-string v3, "BOARD="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->BOARD:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 420
    const-string v3, "BRAND="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 421
    const-string v3, "CPU_ABI="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 422
    const-string v3, "DEVICE="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 423
    const-string v3, "DISPLAY="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 424
    const-string v3, "FINGERPRINT="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 425
    const-string v3, "HOST="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->HOST:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 426
    const-string v3, "ID="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 427
    const-string v3, "MANUFACTURER="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 428
    const-string v3, "MODEL="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 429
    const-string v3, "PRODUCT="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 430
    const-string v3, "TAGS="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->TAGS:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 431
    const-string v3, "TIME="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-wide v4, Landroid/os/Build;->TIME:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 432
    const-string v3, "TYPE="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 433
    const-string v3, "USER="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->USER:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 434
    const-string v3, "VERSION.CODENAME="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 435
    const-string v3, "VERSION.INCREMENTAL="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 436
    const-string v3, "VERSION.RELEASE="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 437
    const-string v3, "VERSION.SDK_INT="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 439
    if-eqz p0, :cond_0

    .line 440
    sget-object v3, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->SEMICOLON:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v1

    .line 441
    .local v1, "params":[Ljava/lang/String;
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 442
    array-length v4, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v0, v1, v3

    .line 443
    .local v0, "param":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 442
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 447
    .end local v0    # "param":Ljava/lang/String;
    .end local v1    # "params":[Ljava/lang/String;
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static findBestPreviewSizeValue(Landroid/hardware/Camera$Parameters;Landroid/graphics/Point;)Landroid/graphics/Point;
    .locals 30
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "screenResolution"    # Landroid/graphics/Point;

    .prologue
    .line 278
    invoke-virtual/range {p0 .. p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v18

    .line 279
    .local v18, "rawSupportedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    if-nez v18, :cond_1

    .line 280
    const-string v25, "CameraConfiguration"

    const-string v26, "Device returned no supported preview sizes; using default"

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    invoke-virtual/range {p0 .. p0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v5

    .line 282
    .local v5, "defaultSize":Landroid/hardware/Camera$Size;
    if-nez v5, :cond_0

    .line 283
    new-instance v25, Ljava/lang/IllegalStateException;

    const-string v26, "Parameters contained no preview size!"

    invoke-direct/range {v25 .. v26}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v25

    .line 285
    :cond_0
    new-instance v8, Landroid/graphics/Point;

    iget v0, v5, Landroid/hardware/Camera$Size;->width:I

    move/from16 v25, v0

    iget v0, v5, Landroid/hardware/Camera$Size;->height:I

    move/from16 v26, v0

    move/from16 v0, v25

    move/from16 v1, v26

    invoke-direct {v8, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 364
    .end local v5    # "defaultSize":Landroid/hardware/Camera$Size;
    :goto_0
    return-object v8

    .line 289
    :cond_1
    new-instance v24, Ljava/util/ArrayList;

    move-object/from16 v0, v24

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 290
    .local v24, "supportedPreviewSizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    new-instance v25, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils$1;

    invoke-direct/range {v25 .. v25}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils$1;-><init>()V

    invoke-static/range {v24 .. v25}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 305
    const-string v25, "CameraConfiguration"

    const/16 v26, 0x4

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    if-eqz v25, :cond_3

    .line 306
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    .line 307
    .local v17, "previewSizesString":Ljava/lang/StringBuilder;
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v25

    :goto_1
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_2

    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Landroid/hardware/Camera$Size;

    .line 308
    .local v21, "supportedPreviewSize":Landroid/hardware/Camera$Size;
    move-object/from16 v0, v21

    iget v0, v0, Landroid/hardware/Camera$Size;->width:I

    move/from16 v26, v0

    move-object/from16 v0, v17

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const/16 v27, 0x78

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v21

    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    move/from16 v27, v0

    .line 309
    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const/16 v27, 0x20

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 311
    .end local v21    # "supportedPreviewSize":Landroid/hardware/Camera$Size;
    :cond_2
    const-string v25, "CameraConfiguration"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Supported preview sizes: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    .end local v17    # "previewSizesString":Ljava/lang/StringBuilder;
    :cond_3
    move-object/from16 v0, p1

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-double v0, v0

    move-wide/from16 v26, v0

    move-object/from16 v0, p1

    iget v0, v0, Landroid/graphics/Point;->y:I

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-double v0, v0

    move-wide/from16 v28, v0

    div-double v22, v26, v28

    .line 317
    .local v22, "screenAspectRatio":D
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .line 318
    .local v12, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/hardware/Camera$Size;>;"
    :cond_4
    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_e

    .line 319
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Landroid/hardware/Camera$Size;

    .line 320
    .restart local v21    # "supportedPreviewSize":Landroid/hardware/Camera$Size;
    move-object/from16 v0, v21

    iget v0, v0, Landroid/hardware/Camera$Size;->width:I

    move/from16 v20, v0

    .line 321
    .local v20, "realWidth":I
    move-object/from16 v0, v21

    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    move/from16 v19, v0

    .line 322
    .local v19, "realHeight":I
    mul-int v25, v20, v19

    const v26, 0x25800

    move/from16 v0, v25

    move/from16 v1, v26

    if-ge v0, v1, :cond_5

    .line 323
    invoke-interface {v12}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    .line 327
    :cond_5
    move/from16 v0, v20

    move/from16 v1, v19

    if-ge v0, v1, :cond_8

    const/4 v9, 0x1

    .line 328
    .local v9, "isCandidatePortrait":Z
    :goto_3
    move-object/from16 v0, p1

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v25, v0

    move-object/from16 v0, p1

    iget v0, v0, Landroid/graphics/Point;->y:I

    move/from16 v26, v0

    move/from16 v0, v25

    move/from16 v1, v26

    if-ge v0, v1, :cond_9

    const/4 v11, 0x1

    .line 329
    .local v11, "isScreenPortrait":Z
    :goto_4
    if-eqz v9, :cond_6

    if-nez v11, :cond_7

    :cond_6
    if-nez v9, :cond_a

    if-nez v11, :cond_a

    :cond_7
    const/4 v10, 0x1

    .line 331
    .local v10, "isOrientationMatch":Z
    :goto_5
    if-eqz v10, :cond_b

    move/from16 v16, v20

    .line 332
    .local v16, "maybeFlippedWidth":I
    :goto_6
    if-eqz v10, :cond_c

    move/from16 v15, v19

    .line 333
    .local v15, "maybeFlippedHeight":I
    :goto_7
    move/from16 v0, v16

    int-to-double v0, v0

    move-wide/from16 v26, v0

    int-to-double v0, v15

    move-wide/from16 v28, v0

    div-double v2, v26, v28

    .line 334
    .local v2, "aspectRatio":D
    sub-double v26, v2, v22

    invoke-static/range {v26 .. v27}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    .line 335
    .local v6, "distortion":D
    const-wide v26, 0x3fc3333333333333L    # 0.15

    cmpl-double v25, v6, v26

    if-lez v25, :cond_d

    .line 336
    invoke-interface {v12}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    .line 327
    .end local v2    # "aspectRatio":D
    .end local v6    # "distortion":D
    .end local v9    # "isCandidatePortrait":Z
    .end local v10    # "isOrientationMatch":Z
    .end local v11    # "isScreenPortrait":Z
    .end local v15    # "maybeFlippedHeight":I
    .end local v16    # "maybeFlippedWidth":I
    :cond_8
    const/4 v9, 0x0

    goto :goto_3

    .line 328
    .restart local v9    # "isCandidatePortrait":Z
    :cond_9
    const/4 v11, 0x0

    goto :goto_4

    .line 329
    .restart local v11    # "isScreenPortrait":Z
    :cond_a
    const/4 v10, 0x0

    goto :goto_5

    .restart local v10    # "isOrientationMatch":Z
    :cond_b
    move/from16 v16, v19

    .line 331
    goto :goto_6

    .restart local v16    # "maybeFlippedWidth":I
    :cond_c
    move/from16 v15, v20

    .line 332
    goto :goto_7

    .line 340
    .restart local v2    # "aspectRatio":D
    .restart local v6    # "distortion":D
    .restart local v15    # "maybeFlippedHeight":I
    :cond_d
    move-object/from16 v0, p1

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v25, v0

    move/from16 v0, v16

    move/from16 v1, v25

    if-ne v0, v1, :cond_4

    move-object/from16 v0, p1

    iget v0, v0, Landroid/graphics/Point;->y:I

    move/from16 v25, v0

    move/from16 v0, v25

    if-ne v15, v0, :cond_4

    .line 341
    new-instance v8, Landroid/graphics/Point;

    move/from16 v0, v20

    move/from16 v1, v19

    invoke-direct {v8, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 342
    .local v8, "exactPoint":Landroid/graphics/Point;
    const-string v25, "CameraConfiguration"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Found preview size exactly matching screen size: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 350
    .end local v2    # "aspectRatio":D
    .end local v6    # "distortion":D
    .end local v8    # "exactPoint":Landroid/graphics/Point;
    .end local v9    # "isCandidatePortrait":Z
    .end local v10    # "isOrientationMatch":Z
    .end local v11    # "isScreenPortrait":Z
    .end local v15    # "maybeFlippedHeight":I
    .end local v16    # "maybeFlippedWidth":I
    .end local v19    # "realHeight":I
    .end local v20    # "realWidth":I
    .end local v21    # "supportedPreviewSize":Landroid/hardware/Camera$Size;
    :cond_e
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->isEmpty()Z

    move-result v25

    if-nez v25, :cond_f

    .line 351
    const/16 v25, 0x0

    invoke-interface/range {v24 .. v25}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/hardware/Camera$Size;

    .line 352
    .local v13, "largestPreview":Landroid/hardware/Camera$Size;
    new-instance v14, Landroid/graphics/Point;

    iget v0, v13, Landroid/hardware/Camera$Size;->width:I

    move/from16 v25, v0

    iget v0, v13, Landroid/hardware/Camera$Size;->height:I

    move/from16 v26, v0

    move/from16 v0, v25

    move/from16 v1, v26

    invoke-direct {v14, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 353
    .local v14, "largestSize":Landroid/graphics/Point;
    const-string v25, "CameraConfiguration"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Using largest suitable preview size: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v8, v14

    .line 354
    goto/16 :goto_0

    .line 358
    .end local v13    # "largestPreview":Landroid/hardware/Camera$Size;
    .end local v14    # "largestSize":Landroid/graphics/Point;
    :cond_f
    invoke-virtual/range {p0 .. p0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v4

    .line 359
    .local v4, "defaultPreview":Landroid/hardware/Camera$Size;
    if-nez v4, :cond_10

    .line 360
    new-instance v25, Ljava/lang/IllegalStateException;

    const-string v26, "Parameters contained no preview size!"

    invoke-direct/range {v25 .. v26}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v25

    .line 362
    :cond_10
    new-instance v5, Landroid/graphics/Point;

    iget v0, v4, Landroid/hardware/Camera$Size;->width:I

    move/from16 v25, v0

    iget v0, v4, Landroid/hardware/Camera$Size;->height:I

    move/from16 v26, v0

    move/from16 v0, v25

    move/from16 v1, v26

    invoke-direct {v5, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 363
    .local v5, "defaultSize":Landroid/graphics/Point;
    const-string v25, "CameraConfiguration"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "No suitable preview sizes, using default: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v8, v5

    .line 364
    goto/16 :goto_0
.end method

.method private static varargs findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
    .param p2, "desiredValues"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 370
    .local p1, "supportedValues":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Requesting "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " value from among: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Supported "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " values: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    if-eqz p1, :cond_1

    .line 373
    array-length v2, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v0, p2, v1

    .line 374
    .local v0, "desiredValue":Ljava/lang/String;
    invoke-interface {p1, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 375
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Can set "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    .end local v0    # "desiredValue":Ljava/lang/String;
    :goto_1
    return-object v0

    .line 373
    .restart local v0    # "desiredValue":Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 380
    .end local v0    # "desiredValue":Ljava/lang/String;
    :cond_1
    const-string v1, "CameraConfiguration"

    const-string v2, "No supported values match"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private static indexOfClosestZoom(Landroid/hardware/Camera$Parameters;D)Ljava/lang/Integer;
    .locals 19
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "targetZoomRatio"    # D

    .prologue
    .line 242
    invoke-virtual/range {p0 .. p0}, Landroid/hardware/Camera$Parameters;->getZoomRatios()Ljava/util/List;

    move-result-object v5

    .line 243
    .local v5, "ratios":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const-string v10, "CameraConfiguration"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Zoom ratios: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    invoke-virtual/range {p0 .. p0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result v4

    .line 245
    .local v4, "maxZoom":I
    if-eqz v5, :cond_0

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_0

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    add-int/lit8 v11, v4, 0x1

    if-eq v10, v11, :cond_1

    .line 246
    :cond_0
    const-string v10, "CameraConfiguration"

    const-string v11, "Invalid zoom ratios!"

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    const/4 v10, 0x0

    .line 260
    :goto_0
    return-object v10

    .line 249
    :cond_1
    const-wide/high16 v10, 0x4059000000000000L    # 100.0

    mul-double v8, v10, p1

    .line 250
    .local v8, "target100":D
    const-wide/high16 v6, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 251
    .local v6, "smallestDiff":D
    const/4 v0, 0x0

    .line 252
    .local v0, "closestIndex":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    if-ge v1, v10, :cond_3

    .line 253
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    int-to-double v10, v10

    sub-double/2addr v10, v8

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    .line 254
    .local v2, "diff":D
    cmpg-double v10, v2, v6

    if-gez v10, :cond_2

    .line 255
    move-wide v6, v2

    .line 256
    move v0, v1

    .line 252
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 259
    .end local v2    # "diff":D
    :cond_3
    const-string v11, "CameraConfiguration"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Chose zoom ratio of "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    int-to-double v14, v10

    const-wide/high16 v16, 0x4059000000000000L    # 100.0

    div-double v14, v14, v16

    invoke-virtual {v12, v14, v15}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v11, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    goto :goto_0
.end method

.method public static setBarcodeSceneMode(Landroid/hardware/Camera$Parameters;)V
    .locals 6
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 212
    const-string v1, "barcode"

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSceneMode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 213
    const-string v1, "CameraConfiguration"

    const-string v2, "Barcode scene mode already set"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    :cond_0
    :goto_0
    return-void

    .line 216
    :cond_1
    const-string v1, "scene mode"

    .line 217
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedSceneModes()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "barcode"

    aput-object v5, v3, v4

    .line 216
    invoke-static {v1, v2, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "sceneMode":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 220
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setSceneMode(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static setBestExposure(Landroid/hardware/Camera$Parameters;Z)V
    .locals 9
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "lightOn"    # Z

    .prologue
    const/4 v5, 0x0

    .line 117
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMinExposureCompensation()I

    move-result v3

    .line 118
    .local v3, "minExposure":I
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxExposureCompensation()I

    move-result v2

    .line 119
    .local v2, "maxExposure":I
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getExposureCompensationStep()F

    move-result v4

    .line 120
    .local v4, "step":F
    if-nez v3, :cond_0

    if-eqz v2, :cond_3

    :cond_0
    cmpl-float v6, v4, v5

    if-lez v6, :cond_3

    .line 122
    if-eqz p1, :cond_1

    .line 123
    .local v5, "targetCompensation":F
    :goto_0
    div-float v6, v5, v4

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 124
    .local v1, "compensationSteps":I
    int-to-float v6, v1

    mul-float v0, v4, v6

    .line 126
    .local v0, "actualCompensation":F
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 127
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getExposureCompensation()I

    move-result v6

    if-ne v6, v1, :cond_2

    .line 128
    const-string v6, "CameraConfiguration"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exposure compensation already set to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " / "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    .end local v0    # "actualCompensation":F
    .end local v1    # "compensationSteps":I
    .end local v5    # "targetCompensation":F
    :goto_1
    return-void

    .line 122
    :cond_1
    const/high16 v5, 0x3fc00000    # 1.5f

    goto :goto_0

    .line 130
    .restart local v0    # "actualCompensation":F
    .restart local v1    # "compensationSteps":I
    .restart local v5    # "targetCompensation":F
    :cond_2
    const-string v6, "CameraConfiguration"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Setting exposure compensation to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " / "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    invoke-virtual {p0, v1}, Landroid/hardware/Camera$Parameters;->setExposureCompensation(I)V

    goto :goto_1

    .line 134
    .end local v0    # "actualCompensation":F
    .end local v1    # "compensationSteps":I
    .end local v5    # "targetCompensation":F
    :cond_3
    const-string v6, "CameraConfiguration"

    const-string v7, "Camera does not support exposure compensation"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public static setBestPreviewFPS(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 139
    const/16 v0, 0xa

    const/16 v1, 0x14

    invoke-static {p0, v0, v1}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setBestPreviewFPS(Landroid/hardware/Camera$Parameters;II)V

    .line 140
    return-void
.end method

.method public static setBestPreviewFPS(Landroid/hardware/Camera$Parameters;II)V
    .locals 11
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "minFPS"    # I
    .param p2, "maxFPS"    # I

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 143
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    move-result-object v3

    .line 144
    .local v3, "supportedPreviewFpsRanges":Ljava/util/List;, "Ljava/util/List<[I>;"
    const-string v6, "CameraConfiguration"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Supported FPS ranges: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->toString(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    if-eqz v3, :cond_2

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 146
    const/4 v2, 0x0

    .line 147
    .local v2, "suitableFPSRange":[I
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    .line 148
    .local v1, "fpsRange":[I
    aget v5, v1, v9

    .line 149
    .local v5, "thisMin":I
    aget v4, v1, v10

    .line 150
    .local v4, "thisMax":I
    mul-int/lit16 v7, p1, 0x3e8

    if-lt v5, v7, :cond_0

    mul-int/lit16 v7, p2, 0x3e8

    if-gt v4, v7, :cond_0

    .line 151
    move-object v2, v1

    .line 155
    .end local v1    # "fpsRange":[I
    .end local v4    # "thisMax":I
    .end local v5    # "thisMin":I
    :cond_1
    if-nez v2, :cond_3

    .line 156
    const-string v6, "CameraConfiguration"

    const-string v7, "No suitable FPS range?"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    .end local v2    # "suitableFPSRange":[I
    :cond_2
    :goto_0
    return-void

    .line 158
    .restart local v2    # "suitableFPSRange":[I
    :cond_3
    const/4 v6, 0x2

    new-array v0, v6, [I

    .line 159
    .local v0, "currentFpsRange":[I
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->getPreviewFpsRange([I)V

    .line 160
    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 161
    const-string v6, "CameraConfiguration"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "FPS range already set to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v2}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 163
    :cond_4
    const-string v6, "CameraConfiguration"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Setting FPS range to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v2}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    aget v6, v2, v9

    aget v7, v2, v10

    invoke-virtual {p0, v6, v7}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    goto :goto_0
.end method

.method public static setFocus(Landroid/hardware/Camera$Parameters;ZZZ)V
    .locals 8
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "autoFocus"    # Z
    .param p2, "disableContinuous"    # Z
    .param p3, "safeMode"    # Z

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 62
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v1

    .line 63
    .local v1, "supportedFocusModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 64
    .local v0, "focusMode":Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 65
    if-nez p3, :cond_0

    if-eqz p2, :cond_4

    .line 66
    :cond_0
    const-string v2, "focus mode"

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "auto"

    aput-object v4, v3, v5

    invoke-static {v2, v1, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 78
    :cond_1
    :goto_0
    if-nez p3, :cond_2

    if-nez v0, :cond_2

    .line 79
    const-string v2, "focus mode"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "macro"

    aput-object v4, v3, v5

    const-string v4, "edof"

    aput-object v4, v3, v6

    invoke-static {v2, v1, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 84
    :cond_2
    if-eqz v0, :cond_3

    .line 85
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 86
    const-string v2, "CameraConfiguration"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Focus mode already set to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :cond_3
    :goto_1
    return-void

    .line 70
    :cond_4
    const-string v2, "focus mode"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "continuous-picture"

    aput-object v4, v3, v5

    const-string v4, "continuous-video"

    aput-object v4, v3, v6

    const-string v4, "auto"

    aput-object v4, v3, v7

    invoke-static {v2, v1, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 88
    :cond_5
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static setFocusArea(Landroid/hardware/Camera$Parameters;)V
    .locals 4
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 172
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxNumFocusAreas()I

    move-result v1

    if-lez v1, :cond_0

    .line 173
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Old focus areas: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getFocusAreas()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->toString(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    const/16 v1, 0x190

    invoke-static {v1}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->buildMiddleArea(I)Ljava/util/List;

    move-result-object v0

    .line 175
    .local v0, "middleArea":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Area;>;"
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting focus area to : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->toString(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setFocusAreas(Ljava/util/List;)V

    .line 180
    .end local v0    # "middleArea":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Area;>;"
    :goto_0
    return-void

    .line 178
    :cond_0
    const-string v1, "CameraConfiguration"

    const-string v2, "Device does not support focus areas"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static setInvertColor(Landroid/hardware/Camera$Parameters;)V
    .locals 6
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 264
    const-string v1, "negative"

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getColorEffect()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 265
    const-string v1, "CameraConfiguration"

    const-string v2, "Negative effect already set"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    :cond_0
    :goto_0
    return-void

    .line 268
    :cond_1
    const-string v1, "color effect"

    .line 269
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedColorEffects()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "negative"

    aput-object v5, v3, v4

    .line 268
    invoke-static {v1, v2, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 271
    .local v0, "colorMode":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 272
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static setMetering(Landroid/hardware/Camera$Parameters;)V
    .locals 4
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 183
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxNumMeteringAreas()I

    move-result v1

    if-lez v1, :cond_0

    .line 184
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Old metering areas: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMeteringAreas()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    const/16 v1, 0x190

    invoke-static {v1}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->buildMiddleArea(I)Ljava/util/List;

    move-result-object v0

    .line 186
    .local v0, "middleArea":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Area;>;"
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting metering area to : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->toString(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setMeteringAreas(Ljava/util/List;)V

    .line 191
    .end local v0    # "middleArea":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Area;>;"
    :goto_0
    return-void

    .line 189
    :cond_0
    const-string v1, "CameraConfiguration"

    const-string v2, "Device does not support metering areas"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static setTorch(Landroid/hardware/Camera$Parameters;Z)V
    .locals 7
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "on"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 94
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v1

    .line 96
    .local v1, "supportedFlashModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p1, :cond_1

    .line 97
    const-string v2, "flash mode"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "torch"

    aput-object v4, v3, v5

    const-string v4, "on"

    aput-object v4, v3, v6

    invoke-static {v2, v1, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "flashMode":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 108
    const-string v2, "CameraConfiguration"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Flash mode already set to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    :cond_0
    :goto_1
    return-void

    .line 102
    .end local v0    # "flashMode":Ljava/lang/String;
    :cond_1
    const-string v2, "flash mode"

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "off"

    aput-object v4, v3, v5

    invoke-static {v2, v1, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "flashMode":Ljava/lang/String;
    goto :goto_0

    .line 110
    :cond_2
    const-string v2, "CameraConfiguration"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Setting flash mode to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static setVideoStabilization(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 199
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->isVideoStabilizationSupported()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 200
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getVideoStabilization()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    const-string v0, "CameraConfiguration"

    const-string v1, "Video stabilization already enabled"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    :goto_0
    return-void

    .line 203
    :cond_0
    const-string v0, "CameraConfiguration"

    const-string v1, "Enabling video stabilization..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setVideoStabilization(Z)V

    goto :goto_0

    .line 207
    :cond_1
    const-string v0, "CameraConfiguration"

    const-string v1, "This device does not support video stabilization"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static setZoom(Landroid/hardware/Camera$Parameters;D)V
    .locals 5
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "targetZoomRatio"    # D

    .prologue
    .line 225
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 226
    invoke-static {p0, p1, p2}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->indexOfClosestZoom(Landroid/hardware/Camera$Parameters;D)Ljava/lang/Integer;

    move-result-object v0

    .line 227
    .local v0, "zoom":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 239
    .end local v0    # "zoom":Ljava/lang/Integer;
    :goto_0
    return-void

    .line 230
    .restart local v0    # "zoom":Ljava/lang/Integer;
    :cond_0
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getZoom()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 231
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Zoom is already set to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 233
    :cond_1
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting zoom to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    goto :goto_0

    .line 237
    .end local v0    # "zoom":Ljava/lang/Integer;
    :cond_2
    const-string v1, "CameraConfiguration"

    const-string v2, "Zoom is not supported"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static toString(Ljava/lang/Iterable;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Landroid/hardware/Camera$Area;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 402
    .local p0, "areas":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Landroid/hardware/Camera$Area;>;"
    if-nez p0, :cond_0

    .line 403
    const/4 v2, 0x0

    .line 409
    :goto_0
    return-object v2

    .line 405
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 406
    .local v1, "result":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Camera$Area;

    .line 407
    .local v0, "area":Landroid/hardware/Camera$Area;
    iget-object v3, v0, Landroid/hardware/Camera$Area;->rect:Landroid/graphics/Rect;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Landroid/hardware/Camera$Area;->weight:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 409
    .end local v0    # "area":Landroid/hardware/Camera$Area;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private static toString(Ljava/util/Collection;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<[I>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 385
    .local p0, "arrays":Ljava/util/Collection;, "Ljava/util/Collection<[I>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 386
    :cond_0
    const-string v2, "[]"

    .line 398
    :goto_0
    return-object v2

    .line 388
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 389
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/16 v2, 0x5b

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 390
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 391
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<[I>;"
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 392
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    invoke-static {v2}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 394
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 397
    :cond_3
    const/16 v2, 0x5d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 398
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

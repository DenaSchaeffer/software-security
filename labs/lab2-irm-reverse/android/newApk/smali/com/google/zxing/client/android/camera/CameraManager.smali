.class public final Lcom/google/zxing/client/android/camera/CameraManager;
.super Ljava/lang/Object;
.source "CameraManager.java"


# static fields
.field private static final MAX_FRAME_HEIGHT:I = 0x2a3

.field private static final MAX_FRAME_WIDTH:I = 0x4b0

.field private static final MIN_FRAME_HEIGHT:I = 0xf0

.field private static final MIN_FRAME_WIDTH:I = 0xf0

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private autoFocusManager:Lcom/google/zxing/client/android/camera/AutoFocusManager;

.field private camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

.field private final configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

.field private final context:Landroid/content/Context;

.field private framingRect:Landroid/graphics/Rect;

.field private framingRectInPreview:Landroid/graphics/Rect;

.field private initialized:Z

.field private final previewCallback:Lcom/google/zxing/client/android/camera/PreviewCallback;

.field private previewing:Z

.field private requestedCameraId:I

.field private requestedFramingRectHeight:I

.field private requestedFramingRectWidth:I

.field private torchInitiallyOn:Z

.field private windowManager:Landroid/view/WindowManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-class v0, Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/camera/CameraManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedCameraId:I

    .line 72
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->context:Landroid/content/Context;

    .line 73
    new-instance v0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    invoke-direct {v0, p1}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    .line 74
    new-instance v0, Lcom/google/zxing/client/android/camera/PreviewCallback;

    iget-object v1, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    invoke-direct {v0, v1}, Lcom/google/zxing/client/android/camera/PreviewCallback;-><init>(Lcom/google/zxing/client/android/camera/CameraConfigurationManager;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->previewCallback:Lcom/google/zxing/client/android/camera/PreviewCallback;

    .line 75
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->context:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->windowManager:Landroid/view/WindowManager;

    .line 76
    return-void
.end method

.method private static findDesiredDimensionInRange(III)I
    .locals 2
    .param p0, "resolution"    # I
    .param p1, "hardMin"    # I
    .param p2, "hardMax"    # I

    .prologue
    .line 252
    mul-int/lit8 v1, p0, 0x5

    div-int/lit8 v0, v1, 0x8

    .line 253
    .local v0, "dim":I
    if-ge v0, p1, :cond_0

    .line 259
    .end local p1    # "hardMin":I
    :goto_0
    return p1

    .line 256
    .restart local p1    # "hardMin":I
    :cond_0
    if-le v0, p2, :cond_1

    move p1, p2

    .line 257
    goto :goto_0

    :cond_1
    move p1, v0

    .line 259
    goto :goto_0
.end method


# virtual methods
.method public buildLuminanceSource([BII)Lcom/google/zxing/PlanarYUVLuminanceSource;
    .locals 16
    .param p1, "data"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 359
    move-object/from16 v0, p1

    array-length v1, v0

    new-array v11, v1, [B

    .line 360
    .local v11, "rotatedData":[B
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/zxing/client/android/camera/CameraManager;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v12, v1, Landroid/content/res/Configuration;->orientation:I

    .line 361
    .local v12, "rotation":I
    const/4 v1, 0x1

    if-ne v12, v1, :cond_2

    .line 362
    const/4 v15, 0x0

    .local v15, "y":I
    :goto_0
    move/from16 v0, p3

    if-ge v15, v0, :cond_1

    .line 363
    const/4 v14, 0x0

    .local v14, "x":I
    :goto_1
    move/from16 v0, p2

    if-ge v14, v0, :cond_0

    .line 364
    mul-int v1, v14, p3

    add-int v1, v1, p3

    sub-int/2addr v1, v15

    add-int/lit8 v1, v1, -0x1

    mul-int v2, v15, p2

    add-int/2addr v2, v14

    aget-byte v2, p1, v2

    aput-byte v2, v11, v1

    .line 363
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 362
    :cond_0
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 367
    .end local v14    # "x":I
    :cond_1
    move/from16 v13, p2

    .line 369
    .local v13, "tmp":I
    move/from16 p2, p3

    .line 370
    move/from16 p3, v13

    .line 375
    .end local v13    # "tmp":I
    .end local v15    # "y":I
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/client/android/camera/CameraManager;->getFramingRectInPreview()Landroid/graphics/Rect;

    move-result-object v10

    .line 376
    .local v10, "rect":Landroid/graphics/Rect;
    if-nez v10, :cond_3

    .line 377
    const/4 v1, 0x0

    .line 380
    :goto_3
    return-object v1

    .line 372
    .end local v10    # "rect":Landroid/graphics/Rect;
    :cond_2
    const/4 v11, 0x0

    goto :goto_2

    .line 380
    .restart local v10    # "rect":Landroid/graphics/Rect;
    :cond_3
    new-instance v1, Lcom/google/zxing/PlanarYUVLuminanceSource;

    const/4 v2, 0x1

    if-ne v12, v2, :cond_4

    move-object v2, v11

    :goto_4
    iget v5, v10, Landroid/graphics/Rect;->left:I

    iget v6, v10, Landroid/graphics/Rect;->top:I

    .line 381
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v8

    const/4 v9, 0x0

    move/from16 v3, p2

    move/from16 v4, p3

    invoke-direct/range {v1 .. v9}, Lcom/google/zxing/PlanarYUVLuminanceSource;-><init>([BIIIIIIZ)V

    goto :goto_3

    :cond_4
    move-object/from16 v2, p1

    .line 380
    goto :goto_4
.end method

.method public declared-synchronized closeDriver()V
    .locals 1

    .prologue
    .line 141
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 143
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    .line 146
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRect:Landroid/graphics/Rect;

    .line 147
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRectInPreview:Landroid/graphics/Rect;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    :cond_0
    monitor-exit p0

    return-void

    .line 141
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getFramingRect()Landroid/graphics/Rect;
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 230
    monitor-enter p0

    :try_start_0
    iget-object v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRect:Landroid/graphics/Rect;

    if-nez v6, :cond_2

    .line 231
    iget-object v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v6, :cond_1

    .line 248
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v5

    .line 234
    :cond_1
    :try_start_1
    iget-object v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    invoke-virtual {v6}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->getScreenResolution()Landroid/graphics/Point;

    move-result-object v2

    .line 235
    .local v2, "screenResolution":Landroid/graphics/Point;
    if-eqz v2, :cond_0

    .line 240
    iget v5, v2, Landroid/graphics/Point;->x:I

    const/16 v6, 0xf0

    const/16 v7, 0x4b0

    invoke-static {v5, v6, v7}, Lcom/google/zxing/client/android/camera/CameraManager;->findDesiredDimensionInRange(III)I

    move-result v4

    .line 241
    .local v4, "width":I
    iget v5, v2, Landroid/graphics/Point;->y:I

    const/16 v6, 0xf0

    const/16 v7, 0x2a3

    invoke-static {v5, v6, v7}, Lcom/google/zxing/client/android/camera/CameraManager;->findDesiredDimensionInRange(III)I

    move-result v0

    .line 243
    .local v0, "height":I
    iget v5, v2, Landroid/graphics/Point;->x:I

    sub-int/2addr v5, v4

    div-int/lit8 v1, v5, 0x2

    .line 244
    .local v1, "leftOffset":I
    iget v5, v2, Landroid/graphics/Point;->y:I

    sub-int/2addr v5, v0

    div-int/lit8 v3, v5, 0x2

    .line 245
    .local v3, "topOffset":I
    new-instance v5, Landroid/graphics/Rect;

    add-int v6, v1, v4

    add-int v7, v3, v0

    invoke-direct {v5, v1, v3, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v5, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRect:Landroid/graphics/Rect;

    .line 246
    sget-object v5, Lcom/google/zxing/client/android/camera/CameraManager;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Calculated framing rect: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRect:Landroid/graphics/Rect;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    .end local v0    # "height":I
    .end local v1    # "leftOffset":I
    .end local v2    # "screenResolution":Landroid/graphics/Point;
    .end local v3    # "topOffset":I
    .end local v4    # "width":I
    :cond_2
    iget-object v5, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRect:Landroid/graphics/Rect;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 230
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public declared-synchronized getFramingRectInPreview()Landroid/graphics/Rect;
    .locals 7

    .prologue
    const/4 v5, 0x0

    .line 269
    monitor-enter p0

    :try_start_0
    iget-object v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRectInPreview:Landroid/graphics/Rect;

    if-nez v6, :cond_2

    .line 270
    invoke-virtual {p0}, Lcom/google/zxing/client/android/camera/CameraManager;->getFramingRect()Landroid/graphics/Rect;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 271
    .local v1, "framingRect":Landroid/graphics/Rect;
    if-nez v1, :cond_1

    .line 300
    .end local v1    # "framingRect":Landroid/graphics/Rect;
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v5

    .line 274
    .restart local v1    # "framingRect":Landroid/graphics/Rect;
    :cond_1
    :try_start_1
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 275
    .local v2, "rect":Landroid/graphics/Rect;
    iget-object v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    invoke-virtual {v6}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->getCameraResolution()Landroid/graphics/Point;

    move-result-object v0

    .line 276
    .local v0, "cameraResolution":Landroid/graphics/Point;
    iget-object v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    invoke-virtual {v6}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->getScreenResolution()Landroid/graphics/Point;

    move-result-object v4

    .line 277
    .local v4, "screenResolution":Landroid/graphics/Point;
    if-eqz v0, :cond_0

    if-eqz v4, :cond_0

    .line 286
    iget-object v5, p0, Lcom/google/zxing/client/android/camera/CameraManager;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v3, v5, Landroid/content/res/Configuration;->orientation:I

    .line 287
    .local v3, "rotation":I
    const/4 v5, 0x1

    if-ne v3, v5, :cond_3

    .line 288
    iget v5, v2, Landroid/graphics/Rect;->left:I

    iget v6, v0, Landroid/graphics/Point;->y:I

    mul-int/2addr v5, v6

    iget v6, v4, Landroid/graphics/Point;->x:I

    div-int/2addr v5, v6

    iput v5, v2, Landroid/graphics/Rect;->left:I

    .line 289
    iget v5, v2, Landroid/graphics/Rect;->right:I

    iget v6, v0, Landroid/graphics/Point;->y:I

    mul-int/2addr v5, v6

    iget v6, v4, Landroid/graphics/Point;->x:I

    div-int/2addr v5, v6

    iput v5, v2, Landroid/graphics/Rect;->right:I

    .line 290
    iget v5, v2, Landroid/graphics/Rect;->top:I

    iget v6, v0, Landroid/graphics/Point;->x:I

    mul-int/2addr v5, v6

    iget v6, v4, Landroid/graphics/Point;->y:I

    div-int/2addr v5, v6

    iput v5, v2, Landroid/graphics/Rect;->top:I

    .line 291
    iget v5, v2, Landroid/graphics/Rect;->bottom:I

    iget v6, v0, Landroid/graphics/Point;->x:I

    mul-int/2addr v5, v6

    iget v6, v4, Landroid/graphics/Point;->y:I

    div-int/2addr v5, v6

    iput v5, v2, Landroid/graphics/Rect;->bottom:I

    .line 298
    :goto_1
    iput-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRectInPreview:Landroid/graphics/Rect;

    .line 300
    .end local v0    # "cameraResolution":Landroid/graphics/Point;
    .end local v1    # "framingRect":Landroid/graphics/Rect;
    .end local v2    # "rect":Landroid/graphics/Rect;
    .end local v3    # "rotation":I
    .end local v4    # "screenResolution":Landroid/graphics/Point;
    :cond_2
    iget-object v5, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRectInPreview:Landroid/graphics/Rect;

    goto :goto_0

    .line 293
    .restart local v0    # "cameraResolution":Landroid/graphics/Point;
    .restart local v1    # "framingRect":Landroid/graphics/Rect;
    .restart local v2    # "rect":Landroid/graphics/Rect;
    .restart local v3    # "rotation":I
    .restart local v4    # "screenResolution":Landroid/graphics/Point;
    :cond_3
    iget v5, v2, Landroid/graphics/Rect;->left:I

    iget v6, v0, Landroid/graphics/Point;->x:I

    mul-int/2addr v5, v6

    iget v6, v4, Landroid/graphics/Point;->x:I

    div-int/2addr v5, v6

    iput v5, v2, Landroid/graphics/Rect;->left:I

    .line 294
    iget v5, v2, Landroid/graphics/Rect;->right:I

    iget v6, v0, Landroid/graphics/Point;->x:I

    mul-int/2addr v5, v6

    iget v6, v4, Landroid/graphics/Point;->x:I

    div-int/2addr v5, v6

    iput v5, v2, Landroid/graphics/Rect;->right:I

    .line 295
    iget v5, v2, Landroid/graphics/Rect;->top:I

    iget v6, v0, Landroid/graphics/Point;->y:I

    mul-int/2addr v5, v6

    iget v6, v4, Landroid/graphics/Point;->y:I

    div-int/2addr v5, v6

    iput v5, v2, Landroid/graphics/Rect;->top:I

    .line 296
    iget v5, v2, Landroid/graphics/Rect;->bottom:I

    iget v6, v0, Landroid/graphics/Point;->y:I

    mul-int/2addr v5, v6

    iget v6, v4, Landroid/graphics/Point;->y:I

    div-int/2addr v5, v6

    iput v5, v2, Landroid/graphics/Rect;->bottom:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 269
    .end local v0    # "cameraResolution":Landroid/graphics/Point;
    .end local v1    # "framingRect":Landroid/graphics/Rect;
    .end local v2    # "rect":Landroid/graphics/Rect;
    .end local v3    # "rotation":I
    .end local v4    # "screenResolution":Landroid/graphics/Point;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public declared-synchronized isOpen()Z
    .locals 1

    .prologue
    .line 134
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isTorchOn()Z
    .locals 2

    .prologue
    .line 179
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    iget-object v1, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    .line 180
    invoke-virtual {v1}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->getTorchState(Landroid/hardware/Camera;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 179
    :goto_0
    monitor-exit p0

    return v0

    .line 180
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 179
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized openDriver(Landroid/view/SurfaceHolder;)V
    .locals 9
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    .line 86
    .local v5, "theCamera":Lcom/google/zxing/client/android/camera/open/OpenCamera;
    if-nez v5, :cond_1

    .line 87
    iget v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedCameraId:I

    invoke-static {v6}, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->open(I)Lcom/google/zxing/client/android/camera/open/OpenCamera;

    move-result-object v5

    .line 88
    if-nez v5, :cond_0

    .line 89
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Camera.open() failed to return object from driver"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    .end local v5    # "theCamera":Lcom/google/zxing/client/android/camera/open/OpenCamera;
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 91
    .restart local v5    # "theCamera":Lcom/google/zxing/client/android/camera/open/OpenCamera;
    :cond_0
    :try_start_1
    iput-object v5, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    .line 94
    :cond_1
    iget-boolean v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->initialized:Z

    if-nez v6, :cond_2

    .line 95
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->initialized:Z

    .line 96
    iget-object v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    invoke-virtual {v6, v5}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->initFromCameraParameters(Lcom/google/zxing/client/android/camera/open/OpenCamera;)V

    .line 97
    iget v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedFramingRectWidth:I

    if-lez v6, :cond_2

    iget v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedFramingRectHeight:I

    if-lez v6, :cond_2

    .line 98
    iget v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedFramingRectWidth:I

    iget v7, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedFramingRectHeight:I

    invoke-virtual {p0, v6, v7}, Lcom/google/zxing/client/android/camera/CameraManager;->setManualFramingRect(II)V

    .line 99
    const/4 v6, 0x0

    iput v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedFramingRectWidth:I

    .line 100
    const/4 v6, 0x0

    iput v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedFramingRectHeight:I

    .line 104
    :cond_2
    invoke-virtual {v5}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v0

    .line 105
    .local v0, "cameraObject":Landroid/hardware/Camera;
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 106
    .local v1, "parameters":Landroid/hardware/Camera$Parameters;
    if-nez v1, :cond_5

    const/4 v2, 0x0

    .line 108
    .local v2, "parametersFlattened":Ljava/lang/String;
    :goto_0
    :try_start_2
    iget-object v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->setDesiredCameraParameters(Lcom/google/zxing/client/android/camera/open/OpenCamera;Z)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    :cond_3
    :goto_1
    :try_start_3
    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 128
    iget-boolean v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->torchInitiallyOn:Z

    if-eqz v6, :cond_4

    .line 129
    const/4 v6, 0x1

    invoke-virtual {p0, v6}, Lcom/google/zxing/client/android/camera/CameraManager;->setTorch(Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 131
    :cond_4
    monitor-exit p0

    return-void

    .line 106
    .end local v2    # "parametersFlattened":Ljava/lang/String;
    :cond_5
    :try_start_4
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 109
    .restart local v2    # "parametersFlattened":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 111
    .local v3, "re":Ljava/lang/RuntimeException;
    sget-object v6, Lcom/google/zxing/client/android/camera/CameraManager;->TAG:Ljava/lang/String;

    const-string v7, "Camera rejected parameters. Setting only minimal safe-mode parameters"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    sget-object v6, Lcom/google/zxing/client/android/camera/CameraManager;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Resetting to saved camera params: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    if-eqz v2, :cond_3

    .line 115
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 116
    invoke-virtual {v1, v2}, Landroid/hardware/Camera$Parameters;->unflatten(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 118
    :try_start_5
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 119
    iget-object v6, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    const/4 v7, 0x1

    invoke-virtual {v6, v5, v7}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->setDesiredCameraParameters(Lcom/google/zxing/client/android/camera/open/OpenCamera;Z)V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 120
    :catch_1
    move-exception v4

    .line 122
    .local v4, "re2":Ljava/lang/RuntimeException;
    :try_start_6
    sget-object v6, Lcom/google/zxing/client/android/camera/CameraManager;->TAG:Ljava/lang/String;

    const-string v7, "Camera rejected even safe-mode parameters! No configuration"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_1
.end method

.method public declared-synchronized requestPreviewFrame(Landroid/os/Handler;I)V
    .locals 3
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "message"    # I

    .prologue
    .line 215
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    .line 216
    .local v0, "theCamera":Lcom/google/zxing/client/android/camera/open/OpenCamera;
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/google/zxing/client/android/camera/CameraManager;->previewing:Z

    if-eqz v1, :cond_0

    .line 217
    iget-object v1, p0, Lcom/google/zxing/client/android/camera/CameraManager;->previewCallback:Lcom/google/zxing/client/android/camera/PreviewCallback;

    invoke-virtual {v1, p1, p2}, Lcom/google/zxing/client/android/camera/PreviewCallback;->setHandler(Landroid/os/Handler;I)V

    .line 218
    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v1

    iget-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->previewCallback:Lcom/google/zxing/client/android/camera/PreviewCallback;

    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    :cond_0
    monitor-exit p0

    return-void

    .line 215
    .end local v0    # "theCamera":Lcom/google/zxing/client/android/camera/open/OpenCamera;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setManualCameraId(I)V
    .locals 1
    .param p1, "cameraId"    # I

    .prologue
    .line 311
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedCameraId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 312
    monitor-exit p0

    return-void

    .line 311
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setManualFramingRect(II)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 326
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->initialized:Z

    if-eqz v0, :cond_0

    .line 339
    invoke-virtual {p0}, Lcom/google/zxing/client/android/camera/CameraManager;->getFramingRect()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRect:Landroid/graphics/Rect;

    .line 341
    sget-object v0, Lcom/google/zxing/client/android/camera/CameraManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Calculated manual framing rect: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->framingRectInPreview:Landroid/graphics/Rect;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 347
    :goto_0
    monitor-exit p0

    return-void

    .line 344
    :cond_0
    :try_start_1
    iput p1, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedFramingRectWidth:I

    .line 345
    iput p2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->requestedFramingRectHeight:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 326
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setTorch(Z)V
    .locals 5
    .param p1, "newSetting"    # Z

    .prologue
    .line 189
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    .line 190
    .local v0, "theCamera":Lcom/google/zxing/client/android/camera/open/OpenCamera;
    if-eqz v0, :cond_1

    .line 191
    iget-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->getTorchState(Landroid/hardware/Camera;)Z

    move-result v2

    if-eq p1, v2, :cond_1

    .line 192
    iget-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->autoFocusManager:Lcom/google/zxing/client/android/camera/AutoFocusManager;

    if-eqz v2, :cond_2

    const/4 v1, 0x1

    .line 193
    .local v1, "wasAutoFocusManager":Z
    :goto_0
    if-eqz v1, :cond_0

    .line 194
    iget-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->autoFocusManager:Lcom/google/zxing/client/android/camera/AutoFocusManager;

    invoke-virtual {v2}, Lcom/google/zxing/client/android/camera/AutoFocusManager;->stop()V

    .line 195
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->autoFocusManager:Lcom/google/zxing/client/android/camera/AutoFocusManager;

    .line 197
    :cond_0
    iget-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->configManager:Lcom/google/zxing/client/android/camera/CameraConfigurationManager;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v3

    invoke-virtual {v2, v3, p1}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->setTorch(Landroid/hardware/Camera;Z)V

    .line 198
    if-eqz v1, :cond_1

    .line 199
    new-instance v2, Lcom/google/zxing/client/android/camera/AutoFocusManager;

    iget-object v3, p0, Lcom/google/zxing/client/android/camera/CameraManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/google/zxing/client/android/camera/AutoFocusManager;-><init>(Landroid/content/Context;Landroid/hardware/Camera;)V

    iput-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->autoFocusManager:Lcom/google/zxing/client/android/camera/AutoFocusManager;

    .line 200
    iget-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->autoFocusManager:Lcom/google/zxing/client/android/camera/AutoFocusManager;

    invoke-virtual {v2}, Lcom/google/zxing/client/android/camera/AutoFocusManager;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 204
    .end local v1    # "wasAutoFocusManager":Z
    :cond_1
    monitor-exit p0

    return-void

    .line 192
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 189
    .end local v0    # "theCamera":Lcom/google/zxing/client/android/camera/open/OpenCamera;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized setTorchInitiallyOn(Z)V
    .locals 1
    .param p1, "on"    # Z

    .prologue
    .line 315
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/google/zxing/client/android/camera/CameraManager;->torchInitiallyOn:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 316
    monitor-exit p0

    return-void

    .line 315
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startPreview()V
    .locals 4

    .prologue
    .line 155
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    .line 156
    .local v0, "theCamera":Lcom/google/zxing/client/android/camera/open/OpenCamera;
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/google/zxing/client/android/camera/CameraManager;->previewing:Z

    if-nez v1, :cond_0

    .line 157
    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/Camera;->startPreview()V

    .line 158
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/zxing/client/android/camera/CameraManager;->previewing:Z

    .line 159
    new-instance v1, Lcom/google/zxing/client/android/camera/AutoFocusManager;

    iget-object v2, p0, Lcom/google/zxing/client/android/camera/CameraManager;->context:Landroid/content/Context;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/client/android/camera/AutoFocusManager;-><init>(Landroid/content/Context;Landroid/hardware/Camera;)V

    iput-object v1, p0, Lcom/google/zxing/client/android/camera/CameraManager;->autoFocusManager:Lcom/google/zxing/client/android/camera/AutoFocusManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    :cond_0
    monitor-exit p0

    return-void

    .line 155
    .end local v0    # "theCamera":Lcom/google/zxing/client/android/camera/open/OpenCamera;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized stopPreview()V
    .locals 3

    .prologue
    .line 167
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->autoFocusManager:Lcom/google/zxing/client/android/camera/AutoFocusManager;

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->autoFocusManager:Lcom/google/zxing/client/android/camera/AutoFocusManager;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/AutoFocusManager;->stop()V

    .line 169
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->autoFocusManager:Lcom/google/zxing/client/android/camera/AutoFocusManager;

    .line 171
    :cond_0
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->previewing:Z

    if-eqz v0, :cond_1

    .line 172
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->camera:Lcom/google/zxing/client/android/camera/open/OpenCamera;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 173
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->previewCallback:Lcom/google/zxing/client/android/camera/PreviewCallback;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/google/zxing/client/android/camera/PreviewCallback;->setHandler(Landroid/os/Handler;I)V

    .line 174
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/client/android/camera/CameraManager;->previewing:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 176
    :cond_1
    monitor-exit p0

    return-void

    .line 167
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

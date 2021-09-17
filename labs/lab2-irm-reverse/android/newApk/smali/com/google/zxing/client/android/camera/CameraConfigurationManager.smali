.class final Lcom/google/zxing/client/android/camera/CameraConfigurationManager;
.super Ljava/lang/Object;
.source "CameraConfigurationManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraConfiguration"


# instance fields
.field private bestPreviewSize:Landroid/graphics/Point;

.field private cameraResolution:Landroid/graphics/Point;

.field private final context:Landroid/content/Context;

.field private cwNeededRotation:I

.field private cwRotationFromDisplayToCamera:I

.field private previewSizeOnScreen:Landroid/graphics/Point;

.field private screenResolution:Landroid/graphics/Point;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->context:Landroid/content/Context;

    .line 52
    return-void
.end method

.method private doSetTorch(Landroid/hardware/Camera$Parameters;ZZ)V
    .locals 3
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p2, "newSetting"    # Z
    .param p3, "safeMode"    # Z

    .prologue
    .line 263
    invoke-static {p1, p2}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setTorch(Landroid/hardware/Camera$Parameters;Z)V

    .line 264
    iget-object v1, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 265
    .local v0, "prefs":Landroid/content/SharedPreferences;
    if-nez p3, :cond_0

    const-string v1, "preferences_disable_exposure"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 266
    invoke-static {p1, p2}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setBestExposure(Landroid/hardware/Camera$Parameters;Z)V

    .line 268
    :cond_0
    return-void
.end method

.method private initializeTorch(Landroid/hardware/Camera$Parameters;Landroid/content/SharedPreferences;Z)V
    .locals 3
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p2, "prefs"    # Landroid/content/SharedPreferences;
    .param p3, "safeMode"    # Z

    .prologue
    .line 258
    invoke-static {p2}, Lcom/google/zxing/client/android/camera/FrontLightMode;->readPref(Landroid/content/SharedPreferences;)Lcom/google/zxing/client/android/camera/FrontLightMode;

    move-result-object v1

    sget-object v2, Lcom/google/zxing/client/android/camera/FrontLightMode;->ON:Lcom/google/zxing/client/android/camera/FrontLightMode;

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    .line 259
    .local v0, "currentSetting":Z
    :goto_0
    invoke-direct {p0, p1, v0, p3}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->doSetTorch(Landroid/hardware/Camera$Parameters;ZZ)V

    .line 260
    return-void

    .line 258
    .end local v0    # "currentSetting":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method getBestPreviewSize()Landroid/graphics/Point;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    return-object v0
.end method

.method getCWNeededRotation()I
    .locals 1

    .prologue
    .line 235
    iget v0, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cwNeededRotation:I

    return v0
.end method

.method getCameraResolution()Landroid/graphics/Point;
    .locals 1

    .prologue
    .line 227
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cameraResolution:Landroid/graphics/Point;

    return-object v0
.end method

.method getPreviewSizeOnScreen()Landroid/graphics/Point;
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->previewSizeOnScreen:Landroid/graphics/Point;

    return-object v0
.end method

.method getScreenResolution()Landroid/graphics/Point;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->screenResolution:Landroid/graphics/Point;

    return-object v0
.end method

.method getTorchState(Landroid/hardware/Camera;)Z
    .locals 4
    .param p1, "camera"    # Landroid/hardware/Camera;

    .prologue
    const/4 v2, 0x0

    .line 239
    if-eqz p1, :cond_1

    .line 240
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 241
    .local v1, "parameters":Landroid/hardware/Camera$Parameters;
    if-eqz v1, :cond_1

    .line 242
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v0

    .line 243
    .local v0, "flashMode":Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v3, "on"

    .line 244
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "torch"

    .line 245
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    const/4 v2, 0x1

    .line 248
    .end local v0    # "flashMode":Ljava/lang/String;
    .end local v1    # "parameters":Landroid/hardware/Camera$Parameters;
    :cond_1
    return v2
.end method

.method initFromCameraParameters(Lcom/google/zxing/client/android/camera/open/OpenCamera;)V
    .locals 14
    .param p1, "camera"    # Lcom/google/zxing/client/android/camera/open/OpenCamera;

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 58
    invoke-virtual {p1}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v11

    invoke-virtual {v11}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v7

    .line 59
    .local v7, "parameters":Landroid/hardware/Camera$Parameters;
    iget-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->context:Landroid/content/Context;

    const-string v12, "window"

    invoke-virtual {v11, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/WindowManager;

    .line 60
    .local v6, "manager":Landroid/view/WindowManager;
    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 62
    .local v2, "display":Landroid/view/Display;
    invoke-virtual {v2}, Landroid/view/Display;->getRotation()I

    move-result v3

    .line 64
    .local v3, "displayRotation":I
    packed-switch v3, :pswitch_data_0

    .line 79
    rem-int/lit8 v11, v3, 0x5a

    if-nez v11, :cond_1

    .line 80
    add-int/lit16 v11, v3, 0x168

    rem-int/lit16 v1, v11, 0x168

    .line 85
    .local v1, "cwRotationFromNaturalToDisplay":I
    :goto_0
    const-string v11, "CameraConfiguration"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Display at: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    invoke-virtual {p1}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getOrientation()I

    move-result v0

    .line 88
    .local v0, "cwRotationFromNaturalToCamera":I
    const-string v11, "CameraConfiguration"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Camera at: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    invoke-virtual {p1}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getFacing()Lcom/google/zxing/client/android/camera/open/CameraFacing;

    move-result-object v11

    sget-object v12, Lcom/google/zxing/client/android/camera/open/CameraFacing;->FRONT:Lcom/google/zxing/client/android/camera/open/CameraFacing;

    if-ne v11, v12, :cond_0

    .line 92
    rsub-int v11, v0, 0x168

    rem-int/lit16 v0, v11, 0x168

    .line 93
    const-string v11, "CameraConfiguration"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Front camera overriden to: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    :cond_0
    add-int/lit16 v11, v0, 0x168

    sub-int/2addr v11, v1

    rem-int/lit16 v11, v11, 0x168

    iput v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cwRotationFromDisplayToCamera:I

    .line 112
    const-string v11, "CameraConfiguration"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Final display orientation: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cwRotationFromDisplayToCamera:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    invoke-virtual {p1}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getFacing()Lcom/google/zxing/client/android/camera/open/CameraFacing;

    move-result-object v11

    sget-object v12, Lcom/google/zxing/client/android/camera/open/CameraFacing;->FRONT:Lcom/google/zxing/client/android/camera/open/CameraFacing;

    if-ne v11, v12, :cond_2

    .line 114
    const-string v11, "CameraConfiguration"

    const-string v12, "Compensating rotation for front camera"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iget v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cwRotationFromDisplayToCamera:I

    rsub-int v11, v11, 0x168

    rem-int/lit16 v11, v11, 0x168

    iput v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cwNeededRotation:I

    .line 119
    :goto_1
    const-string v11, "CameraConfiguration"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Clockwise rotation from display to camera: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cwNeededRotation:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    new-instance v8, Landroid/graphics/Point;

    invoke-direct {v8}, Landroid/graphics/Point;-><init>()V

    .line 122
    .local v8, "theScreenResolution":Landroid/graphics/Point;
    invoke-virtual {v2, v8}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 123
    iput-object v8, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->screenResolution:Landroid/graphics/Point;

    .line 124
    const-string v11, "CameraConfiguration"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Screen resolution in current orientation: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->screenResolution:Landroid/graphics/Point;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    iget-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->screenResolution:Landroid/graphics/Point;

    invoke-static {v7, v11}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findBestPreviewSizeValue(Landroid/hardware/Camera$Parameters;Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cameraResolution:Landroid/graphics/Point;

    .line 126
    const-string v11, "CameraConfiguration"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Camera resolution: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cameraResolution:Landroid/graphics/Point;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    iget-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->screenResolution:Landroid/graphics/Point;

    invoke-static {v7, v11}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findBestPreviewSizeValue(Landroid/hardware/Camera$Parameters;Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    .line 128
    const-string v11, "CameraConfiguration"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Best available preview size: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    iget-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->screenResolution:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    iget-object v12, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->screenResolution:Landroid/graphics/Point;

    iget v12, v12, Landroid/graphics/Point;->y:I

    if-ge v11, v12, :cond_3

    move v5, v9

    .line 131
    .local v5, "isScreenPortrait":Z
    :goto_2
    iget-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    iget-object v12, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v12, v12, Landroid/graphics/Point;->y:I

    if-ge v11, v12, :cond_4

    move v4, v9

    .line 133
    .local v4, "isPreviewSizePortrait":Z
    :goto_3
    if-ne v5, v4, :cond_5

    .line 134
    iget-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iput-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->previewSizeOnScreen:Landroid/graphics/Point;

    .line 138
    :goto_4
    const-string v9, "CameraConfiguration"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Preview size on screen: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->previewSizeOnScreen:Landroid/graphics/Point;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    return-void

    .line 66
    .end local v0    # "cwRotationFromNaturalToCamera":I
    .end local v1    # "cwRotationFromNaturalToDisplay":I
    .end local v4    # "isPreviewSizePortrait":Z
    .end local v5    # "isScreenPortrait":Z
    .end local v8    # "theScreenResolution":Landroid/graphics/Point;
    :pswitch_0
    const/4 v1, 0x0

    .line 67
    .restart local v1    # "cwRotationFromNaturalToDisplay":I
    goto/16 :goto_0

    .line 69
    .end local v1    # "cwRotationFromNaturalToDisplay":I
    :pswitch_1
    const/16 v1, 0x5a

    .line 70
    .restart local v1    # "cwRotationFromNaturalToDisplay":I
    goto/16 :goto_0

    .line 72
    .end local v1    # "cwRotationFromNaturalToDisplay":I
    :pswitch_2
    const/16 v1, 0xb4

    .line 73
    .restart local v1    # "cwRotationFromNaturalToDisplay":I
    goto/16 :goto_0

    .line 75
    .end local v1    # "cwRotationFromNaturalToDisplay":I
    :pswitch_3
    const/16 v1, 0x10e

    .line 76
    .restart local v1    # "cwRotationFromNaturalToDisplay":I
    goto/16 :goto_0

    .line 82
    .end local v1    # "cwRotationFromNaturalToDisplay":I
    :cond_1
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Bad rotation: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 117
    .restart local v0    # "cwRotationFromNaturalToCamera":I
    .restart local v1    # "cwRotationFromNaturalToDisplay":I
    :cond_2
    iget v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cwRotationFromDisplayToCamera:I

    iput v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cwNeededRotation:I

    goto/16 :goto_1

    .restart local v8    # "theScreenResolution":Landroid/graphics/Point;
    :cond_3
    move v5, v10

    .line 130
    goto :goto_2

    .restart local v5    # "isScreenPortrait":Z
    :cond_4
    move v4, v10

    .line 131
    goto :goto_3

    .line 136
    .restart local v4    # "isPreviewSizePortrait":Z
    :cond_5
    new-instance v9, Landroid/graphics/Point;

    iget-object v10, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    iget-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    invoke-direct {v9, v10, v11}, Landroid/graphics/Point;-><init>(II)V

    iput-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->previewSizeOnScreen:Landroid/graphics/Point;

    goto :goto_4

    .line 64
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method setDesiredCameraParameters(Lcom/google/zxing/client/android/camera/open/OpenCamera;Z)V
    .locals 12
    .param p1, "camera"    # Lcom/google/zxing/client/android/camera/open/OpenCamera;
    .param p2, "safeMode"    # Z

    .prologue
    .line 142
    invoke-virtual {p1}, Lcom/google/zxing/client/android/camera/open/OpenCamera;->getCamera()Landroid/hardware/Camera;

    move-result-object v7

    .line 144
    .local v7, "theCamera":Landroid/hardware/Camera;
    iget-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v9

    iget v6, v9, Landroid/content/res/Configuration;->orientation:I

    .line 146
    .local v6, "rotation":I
    iget-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->context:Landroid/content/Context;

    const-string v10, "window"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/WindowManager;

    .line 147
    .local v8, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v8}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    .line 148
    .local v3, "display":Landroid/view/Display;
    invoke-virtual {v3}, Landroid/view/Display;->getRotation()I

    move-result v2

    .line 150
    .local v2, "deviceSpecificRotation":I
    const/4 v9, 0x1

    if-ne v6, v9, :cond_4

    .line 151
    if-eqz v2, :cond_0

    const/4 v9, 0x1

    if-ne v2, v9, :cond_3

    .line 152
    :cond_0
    const/16 v9, 0x5a

    invoke-virtual {v7, v9}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 163
    :cond_1
    :goto_0
    invoke-virtual {v7}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v4

    .line 164
    .local v4, "parameters":Landroid/hardware/Camera$Parameters;
    if-nez v4, :cond_6

    .line 165
    const-string v9, "CameraConfiguration"

    const-string v10, "Device error: no camera parameters are available. Proceeding without configuration."

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    :cond_2
    :goto_1
    return-void

    .line 154
    .end local v4    # "parameters":Landroid/hardware/Camera$Parameters;
    :cond_3
    const/16 v9, 0x10e

    invoke-virtual {v7, v9}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto :goto_0

    .line 158
    :cond_4
    const/4 v9, 0x2

    if-eq v2, v9, :cond_5

    const/4 v9, 0x3

    if-ne v2, v9, :cond_1

    .line 159
    :cond_5
    const/16 v9, 0xb4

    invoke-virtual {v7, v9}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto :goto_0

    .line 169
    .restart local v4    # "parameters":Landroid/hardware/Camera$Parameters;
    :cond_6
    const-string v9, "CameraConfiguration"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Initial camera parameters: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    if-eqz p2, :cond_7

    .line 172
    const-string v9, "CameraConfiguration"

    const-string v10, "In camera config safe mode -- most settings will not be honored"

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    :cond_7
    iget-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->context:Landroid/content/Context;

    invoke-static {v9}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 177
    .local v5, "prefs":Landroid/content/SharedPreferences;
    invoke-direct {p0, v4, v5, p2}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->initializeTorch(Landroid/hardware/Camera$Parameters;Landroid/content/SharedPreferences;Z)V

    .line 179
    const-string v9, "preferences_auto_focus"

    const/4 v10, 0x1

    .line 181
    invoke-interface {v5, v9, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    const-string v10, "preferences_disable_continuous_focus"

    const/4 v11, 0x1

    .line 182
    invoke-interface {v5, v10, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    .line 179
    invoke-static {v4, v9, v10, p2}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setFocus(Landroid/hardware/Camera$Parameters;ZZZ)V

    .line 185
    if-nez p2, :cond_a

    .line 186
    const-string v9, "preferences_invert_scan"

    const/4 v10, 0x0

    invoke-interface {v5, v9, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 187
    invoke-static {v4}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setInvertColor(Landroid/hardware/Camera$Parameters;)V

    .line 190
    :cond_8
    const-string v9, "preferences_disable_barcode_scene_mode"

    const/4 v10, 0x1

    invoke-interface {v5, v9, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    if-nez v9, :cond_9

    .line 191
    invoke-static {v4}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setBarcodeSceneMode(Landroid/hardware/Camera$Parameters;)V

    .line 194
    :cond_9
    const-string v9, "preferences_disable_metering"

    const/4 v10, 0x1

    invoke-interface {v5, v9, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    if-nez v9, :cond_a

    .line 195
    invoke-static {v4}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setVideoStabilization(Landroid/hardware/Camera$Parameters;)V

    .line 196
    invoke-static {v4}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setFocusArea(Landroid/hardware/Camera$Parameters;)V

    .line 197
    invoke-static {v4}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setMetering(Landroid/hardware/Camera$Parameters;)V

    .line 202
    :cond_a
    iget-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v9, v9, Landroid/graphics/Point;->x:I

    iget-object v10, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    invoke-virtual {v4, v9, v10}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 204
    invoke-virtual {v7, v4}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 206
    iget v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->cwRotationFromDisplayToCamera:I

    invoke-virtual {v7, v9}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 208
    invoke-virtual {v7}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 209
    .local v0, "afterParameters":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v1

    .line 210
    .local v1, "afterSize":Landroid/hardware/Camera$Size;
    if-eqz v1, :cond_2

    iget-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v9, v9, Landroid/graphics/Point;->x:I

    iget v10, v1, Landroid/hardware/Camera$Size;->width:I

    if-ne v9, v10, :cond_b

    iget-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v9, v9, Landroid/graphics/Point;->y:I

    iget v10, v1, Landroid/hardware/Camera$Size;->height:I

    if-eq v9, v10, :cond_2

    .line 211
    :cond_b
    const-string v9, "CameraConfiguration"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Camera said it supported preview size "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const/16 v11, 0x78

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->y:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", but after setting it, preview size is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v1, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const/16 v11, 0x78

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v1, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    iget-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v10, v1, Landroid/hardware/Camera$Size;->width:I

    iput v10, v9, Landroid/graphics/Point;->x:I

    .line 214
    iget-object v9, p0, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->bestPreviewSize:Landroid/graphics/Point;

    iget v10, v1, Landroid/hardware/Camera$Size;->height:I

    iput v10, v9, Landroid/graphics/Point;->y:I

    goto/16 :goto_1
.end method

.method setTorch(Landroid/hardware/Camera;Z)V
    .locals 2
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "newSetting"    # Z

    .prologue
    .line 252
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 253
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Lcom/google/zxing/client/android/camera/CameraConfigurationManager;->doSetTorch(Landroid/hardware/Camera$Parameters;ZZ)V

    .line 254
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 255
    return-void
.end method

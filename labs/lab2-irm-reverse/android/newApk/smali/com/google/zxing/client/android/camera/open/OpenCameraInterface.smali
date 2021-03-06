.class public final Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;
.super Ljava/lang/Object;
.source "OpenCameraInterface.java"


# static fields
.field public static final NO_REQUESTED_CAMERA:I = -0x1

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static open(I)Lcom/google/zxing/client/android/camera/open/OpenCamera;
    .locals 12
    .param p0, "cameraId"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v2, 0x1

    const/4 v8, 0x0

    .line 45
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v4

    .line 46
    .local v4, "numCameras":I
    if-nez v4, :cond_1

    .line 47
    sget-object v8, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->TAG:Ljava/lang/String;

    const-string v9, "No cameras!"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    :cond_0
    :goto_0
    return-object v7

    .line 49
    :cond_1
    if-ne v4, v2, :cond_2

    .line 50
    const/4 p0, 0x0

    .line 53
    :cond_2
    if-ltz p0, :cond_4

    .line 55
    .local v2, "explicitRequest":Z
    :goto_1
    const/4 v6, 0x0

    .line 57
    .local v6, "selectedCameraInfo":Landroid/hardware/Camera$CameraInfo;
    if-eqz v2, :cond_5

    .line 58
    move v3, p0

    .line 59
    .local v3, "index":I
    new-instance v6, Landroid/hardware/Camera$CameraInfo;

    .end local v6    # "selectedCameraInfo":Landroid/hardware/Camera$CameraInfo;
    invoke-direct {v6}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 60
    .restart local v6    # "selectedCameraInfo":Landroid/hardware/Camera$CameraInfo;
    invoke-static {v3, v6}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 76
    :cond_3
    :goto_2
    if-ge v3, v4, :cond_7

    .line 77
    sget-object v8, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Opening camera #"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    invoke-static {v3}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    .line 91
    .local v0, "camera":Landroid/hardware/Camera;
    :goto_3
    if-eqz v0, :cond_0

    .line 94
    new-instance v7, Lcom/google/zxing/client/android/camera/open/OpenCamera;

    .line 96
    invoke-static {}, Lcom/google/zxing/client/android/camera/open/CameraFacing;->values()[Lcom/google/zxing/client/android/camera/open/CameraFacing;

    move-result-object v8

    iget v9, v6, Landroid/hardware/Camera$CameraInfo;->facing:I

    aget-object v8, v8, v9

    iget v9, v6, Landroid/hardware/Camera$CameraInfo;->orientation:I

    invoke-direct {v7, v3, v0, v8, v9}, Lcom/google/zxing/client/android/camera/open/OpenCamera;-><init>(ILandroid/hardware/Camera;Lcom/google/zxing/client/android/camera/open/CameraFacing;I)V

    goto :goto_0

    .end local v0    # "camera":Landroid/hardware/Camera;
    .end local v2    # "explicitRequest":Z
    .end local v3    # "index":I
    .end local v6    # "selectedCameraInfo":Landroid/hardware/Camera$CameraInfo;
    :cond_4
    move v2, v8

    .line 53
    goto :goto_1

    .line 62
    .restart local v2    # "explicitRequest":Z
    .restart local v6    # "selectedCameraInfo":Landroid/hardware/Camera$CameraInfo;
    :cond_5
    const/4 v3, 0x0

    .line 63
    .restart local v3    # "index":I
    :goto_4
    if-ge v3, v4, :cond_3

    .line 64
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 65
    .local v1, "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    invoke-static {v3, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 66
    invoke-static {}, Lcom/google/zxing/client/android/camera/open/CameraFacing;->values()[Lcom/google/zxing/client/android/camera/open/CameraFacing;

    move-result-object v9

    iget v10, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    aget-object v5, v9, v10

    .line 67
    .local v5, "reportedFacing":Lcom/google/zxing/client/android/camera/open/CameraFacing;
    sget-object v9, Lcom/google/zxing/client/android/camera/open/CameraFacing;->BACK:Lcom/google/zxing/client/android/camera/open/CameraFacing;

    if-ne v5, v9, :cond_6

    .line 68
    move-object v6, v1

    .line 69
    goto :goto_2

    .line 71
    :cond_6
    add-int/lit8 v3, v3, 0x1

    .line 72
    goto :goto_4

    .line 80
    .end local v1    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    .end local v5    # "reportedFacing":Lcom/google/zxing/client/android/camera/open/CameraFacing;
    :cond_7
    if-eqz v2, :cond_8

    .line 81
    sget-object v8, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Requested camera does not exist: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    const/4 v0, 0x0

    .restart local v0    # "camera":Landroid/hardware/Camera;
    goto :goto_3

    .line 84
    .end local v0    # "camera":Landroid/hardware/Camera;
    :cond_8
    sget-object v9, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "No camera facing "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lcom/google/zxing/client/android/camera/open/CameraFacing;->BACK:Lcom/google/zxing/client/android/camera/open/CameraFacing;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "; returning camera #0"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    invoke-static {v8}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    .line 86
    .restart local v0    # "camera":Landroid/hardware/Camera;
    new-instance v6, Landroid/hardware/Camera$CameraInfo;

    .end local v6    # "selectedCameraInfo":Landroid/hardware/Camera$CameraInfo;
    invoke-direct {v6}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 87
    .restart local v6    # "selectedCameraInfo":Landroid/hardware/Camera$CameraInfo;
    invoke-static {v8, v6}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    goto :goto_3
.end method

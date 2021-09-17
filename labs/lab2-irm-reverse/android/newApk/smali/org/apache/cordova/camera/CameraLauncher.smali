.class public Lorg/apache/cordova/camera/CameraLauncher;
.super Lorg/apache/cordova/CordovaPlugin;
.source "CameraLauncher.java"

# interfaces
.implements Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;


# static fields
.field private static final ALLMEDIA:I = 0x2

.field private static final CAMERA:I = 0x1

.field private static final CROP_CAMERA:I = 0x64

.field private static final DATA_URL:I = 0x0

.field private static final FILE_URI:I = 0x1

.field private static final GET_All:Ljava/lang/String; = "Get All"

.field private static final GET_PICTURE:Ljava/lang/String; = "Get Picture"

.field private static final GET_VIDEO:Ljava/lang/String; = "Get Video"

.field private static final JPEG:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "CameraLauncher"

.field private static final NATIVE_URI:I = 0x2

.field public static final PERMISSION_DENIED_ERROR:I = 0x14

.field private static final PHOTOLIBRARY:I = 0x0

.field private static final PICTURE:I = 0x0

.field private static final PNG:I = 0x1

.field private static final SAVEDPHOTOALBUM:I = 0x2

.field public static final SAVE_TO_ALBUM_SEC:I = 0x1

.field public static final TAKE_PIC_SEC:I = 0x0

.field private static final VIDEO:I = 0x1

.field protected static final permissions:[Ljava/lang/String;


# instance fields
.field private allowEdit:Z

.field private applicationId:Ljava/lang/String;

.field public callbackContext:Lorg/apache/cordova/CallbackContext;

.field private conn:Landroid/media/MediaScannerConnection;

.field private correctOrientation:Z

.field private croppedUri:Landroid/net/Uri;

.field private destType:I

.field private encodingType:I

.field private exifData:Lorg/apache/cordova/camera/ExifHelper;

.field private imageUri:Lorg/apache/cordova/camera/CordovaUri;

.field private mQuality:I

.field private mediaType:I

.field private numPics:I

.field private orientationCorrected:Z

.field private saveToPhotoAlbum:Z

.field private scanMe:Landroid/net/Uri;

.field private srcType:I

.field private targetHeight:I

.field private targetWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 116
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.CAMERA"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/cordova/camera/CameraLauncher;->permissions:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/apache/cordova/camera/CameraLauncher;ILandroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/camera/CameraLauncher;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/content/Intent;

    .prologue
    .line 74
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/camera/CameraLauncher;->processResultFromGallery(ILandroid/content/Intent;)V

    return-void
.end method

.method public static calculateSampleSize(IIII)I
    .locals 4
    .param p0, "srcWidth"    # I
    .param p1, "srcHeight"    # I
    .param p2, "dstWidth"    # I
    .param p3, "dstHeight"    # I

    .prologue
    .line 1164
    int-to-float v2, p0

    int-to-float v3, p1

    div-float v1, v2, v3

    .line 1165
    .local v1, "srcAspect":F
    int-to-float v2, p2

    int-to-float v3, p3

    div-float v0, v2, v3

    .line 1167
    .local v0, "dstAspect":F
    cmpl-float v2, v1, v0

    if-lez v2, :cond_0

    .line 1168
    div-int v2, p0, p2

    .line 1170
    :goto_0
    return v2

    :cond_0
    div-int v2, p1, p3

    goto :goto_0
.end method

.method private checkForDuplicateImage(I)V
    .locals 9
    .param p1, "type"    # I

    .prologue
    const/4 v8, 0x0

    .line 1218
    const/4 v3, 0x1

    .line 1219
    .local v3, "diff":I
    invoke-direct {p0}, Lorg/apache/cordova/camera/CameraLauncher;->whichContentStore()Landroid/net/Uri;

    move-result-object v0

    .line 1220
    .local v0, "contentStore":Landroid/net/Uri;
    invoke-direct {p0, v0}, Lorg/apache/cordova/camera/CameraLauncher;->queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v2

    .line 1221
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v1

    .line 1223
    .local v1, "currentNumOfImages":I
    const/4 v6, 0x1

    if-ne p1, v6, :cond_0

    iget-boolean v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v6, :cond_0

    .line 1224
    const/4 v3, 0x2

    .line 1228
    :cond_0
    iget v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->numPics:I

    sub-int v6, v1, v6

    if-ne v6, v3, :cond_2

    .line 1229
    invoke-interface {v2}, Landroid/database/Cursor;->moveToLast()Z

    .line 1230
    const-string v6, "_id"

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 1231
    .local v4, "id":I
    const/4 v6, 0x2

    if-ne v3, v6, :cond_1

    .line 1232
    add-int/lit8 v4, v4, -0x1

    .line 1234
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 1235
    .local v5, "uri":Landroid/net/Uri;
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v5, v8, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1236
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 1238
    .end local v4    # "id":I
    .end local v5    # "uri":Landroid/net/Uri;
    :cond_2
    return-void
.end method

.method private cleanup(ILandroid/net/Uri;Landroid/net/Uri;Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "imageType"    # I
    .param p2, "oldImage"    # Landroid/net/Uri;
    .param p3, "newImage"    # Landroid/net/Uri;
    .param p4, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 1194
    if-eqz p4, :cond_0

    .line 1195
    invoke-virtual {p4}, Landroid/graphics/Bitmap;->recycle()V

    .line 1199
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/cordova/camera/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1201
    invoke-direct {p0, p1}, Lorg/apache/cordova/camera/CameraLauncher;->checkForDuplicateImage(I)V

    .line 1203
    iget-boolean v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v0, :cond_1

    if-eqz p3, :cond_1

    .line 1204
    invoke-direct {p0, p3}, Lorg/apache/cordova/camera/CameraLauncher;->scanForGallery(Landroid/net/Uri;)V

    .line 1207
    :cond_1
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 1208
    return-void
.end method

.method private createCaptureFile(I)Ljava/io/File;
    .locals 1
    .param p1, "encodingType"    # I

    .prologue
    .line 328
    const-string v0, ""

    invoke-direct {p0, p1, v0}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(ILjava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private createCaptureFile(ILjava/lang/String;)Ljava/io/File;
    .locals 3
    .param p1, "encodingType"    # I
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 339
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 340
    const-string p2, ".Pic"

    .line 343
    :cond_0
    if-nez p1, :cond_1

    .line 344
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".jpg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 351
    :goto_0
    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lorg/apache/cordova/camera/CameraLauncher;->getTempDirectoryPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 345
    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 346
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 348
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid Encoding Type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private exifToDegrees(I)I
    .locals 1
    .param p1, "exifOrientation"    # I

    .prologue
    .line 845
    const/4 v0, 0x6

    if-ne p1, v0, :cond_0

    .line 846
    const/16 v0, 0x5a

    .line 852
    :goto_0
    return v0

    .line 847
    :cond_0
    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 848
    const/16 v0, 0xb4

    goto :goto_0

    .line 849
    :cond_1
    const/16 v0, 0x8

    if-ne p1, v0, :cond_2

    .line 850
    const/16 v0, 0x10e

    goto :goto_0

    .line 852
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getFileNameFromUri(Landroid/net/Uri;)Ljava/lang/String;
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1398
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1399
    .local v1, "fullUri":Ljava/lang/String;
    const-string v4, "external_files"

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aget-object v2, v4, v5

    .line 1400
    .local v2, "partial_path":Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 1401
    .local v0, "external_storage":Ljava/io/File;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1402
    .local v3, "path":Ljava/lang/String;
    return-object v3
.end method

.method private getMimetypeForFormat(I)Ljava/lang/String;
    .locals 1
    .param p1, "outputFormat"    # I

    .prologue
    .line 624
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string v0, "image/png"

    .line 626
    :goto_0
    return-object v0

    .line 625
    :cond_0
    if-nez p1, :cond_1

    const-string v0, "image/jpeg"

    goto :goto_0

    .line 626
    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method private getPicturesPath()Ljava/lang/String;
    .locals 6

    .prologue
    .line 602
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMdd_HHmmss"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 603
    .local v3, "timeStamp":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "IMG_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v4, :cond_0

    const-string v4, ".jpg"

    :goto_0
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 604
    .local v1, "imageFileName":Ljava/lang/String;
    sget-object v4, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v4}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 606
    .local v2, "storageDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 607
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 608
    .local v0, "galleryPath":Ljava/lang/String;
    return-object v0

    .line 603
    .end local v0    # "galleryPath":Ljava/lang/String;
    .end local v1    # "imageFileName":Ljava/lang/String;
    .end local v2    # "storageDir":Ljava/io/File;
    :cond_0
    const-string v4, ".png"

    goto :goto_0
.end method

.method private getScaledAndRotatedBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 32
    .param p1, "imageUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 940
    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-gtz v4, :cond_2

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-gtz v4, :cond_2

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-nez v4, :cond_2

    .line 941
    const/4 v14, 0x0

    .line 942
    .local v14, "fileStream":Ljava/io/InputStream;
    const/16 v16, 0x0

    .line 944
    .local v16, "image":Landroid/graphics/Bitmap;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/apache/cordova/camera/FileHelper;->getInputStreamFromUriString(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/io/InputStream;

    move-result-object v14

    .line 945
    invoke-static {v14}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v16

    .line 952
    if-eqz v14, :cond_0

    .line 954
    :try_start_1
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1095
    .end local v14    # "fileStream":Ljava/io/InputStream;
    .end local v16    # "image":Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    return-object v16

    .line 955
    .restart local v14    # "fileStream":Ljava/io/InputStream;
    .restart local v16    # "image":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v10

    .line 956
    .local v10, "e":Ljava/io/IOException;
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing file input stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 946
    .end local v10    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v10

    .line 947
    .local v10, "e":Ljava/lang/OutOfMemoryError;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v10}, Ljava/lang/OutOfMemoryError;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 952
    if-eqz v14, :cond_0

    .line 954
    :try_start_3
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 955
    :catch_2
    move-exception v10

    .line 956
    .local v10, "e":Ljava/io/IOException;
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing file input stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 948
    .end local v10    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v10

    .line 949
    .local v10, "e":Ljava/lang/Exception;
    :try_start_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v10}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 952
    if-eqz v14, :cond_0

    .line 954
    :try_start_5
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_0

    .line 955
    :catch_4
    move-exception v10

    .line 956
    .local v10, "e":Ljava/io/IOException;
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing file input stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 952
    .end local v10    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    if-eqz v14, :cond_1

    .line 954
    :try_start_6
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    .line 957
    :cond_1
    :goto_1
    throw v4

    .line 955
    :catch_5
    move-exception v10

    .line 956
    .restart local v10    # "e":Ljava/io/IOException;
    const-string v5, "CameraLauncher"

    const-string v6, "Exception while closing file input stream."

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 971
    .end local v10    # "e":Ljava/io/IOException;
    .end local v14    # "fileStream":Ljava/io/InputStream;
    .end local v16    # "image":Landroid/graphics/Bitmap;
    :cond_2
    const/16 v17, 0x0

    .line 972
    .local v17, "localFile":Ljava/io/File;
    const/4 v15, 0x0

    .line 973
    .local v15, "galleryUri":Landroid/net/Uri;
    const/16 v23, 0x0

    .line 975
    .local v23, "rotate":I
    :try_start_7
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/apache/cordova/camera/FileHelper;->getInputStreamFromUriString(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/io/InputStream;

    move-result-object v14

    .line 976
    .restart local v14    # "fileStream":Ljava/io/InputStream;
    if-eqz v14, :cond_4

    .line 978
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMdd_HHmmss"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v29

    .line 979
    .local v29, "timeStamp":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "IMG_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v29

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v4, :cond_7

    const-string v4, ".jpg"

    :goto_2
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 980
    .local v12, "fileName":Ljava/lang/String;
    new-instance v18, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct/range {p0 .. p0}, Lorg/apache/cordova/camera/CameraLauncher;->getTempDirectoryPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    .line 981
    .end local v17    # "localFile":Ljava/io/File;
    .local v18, "localFile":Ljava/io/File;
    :try_start_8
    invoke-static/range {v18 .. v18}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v15

    .line 982
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Ljava/io/InputStream;Landroid/net/Uri;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_d

    .line 984
    :try_start_9
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v4, v5}, Lorg/apache/cordova/camera/FileHelper;->getMimeType(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/lang/String;

    move-result-object v19

    .line 985
    .local v19, "mimeType":Ljava/lang/String;
    const-string v4, "image/jpeg"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 987
    invoke-virtual {v15}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file://"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v13

    .line 989
    .local v13, "filePath":Ljava/lang/String;
    new-instance v4, Lorg/apache/cordova/camera/ExifHelper;

    invoke-direct {v4}, Lorg/apache/cordova/camera/ExifHelper;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    .line 990
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    invoke-virtual {v4, v13}, Lorg/apache/cordova/camera/ExifHelper;->createInFile(Ljava/lang/String;)V

    .line 992
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-eqz v4, :cond_3

    .line 993
    new-instance v11, Landroid/media/ExifInterface;

    invoke-direct {v11, v13}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 994
    .local v11, "exif":Landroid/media/ExifInterface;
    const-string v4, "Orientation"

    const/4 v5, 0x0

    invoke-virtual {v11, v4, v5}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/apache/cordova/camera/CameraLauncher;->exifToDegrees(I)I
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    move-result v23

    .end local v11    # "exif":Landroid/media/ExifInterface;
    .end local v13    # "filePath":Ljava/lang/String;
    :cond_3
    move-object/from16 v17, v18

    .line 1013
    .end local v12    # "fileName":Ljava/lang/String;
    .end local v18    # "localFile":Ljava/io/File;
    .end local v19    # "mimeType":Ljava/lang/String;
    .end local v29    # "timeStamp":Ljava/lang/String;
    .restart local v17    # "localFile":Ljava/io/File;
    :cond_4
    :goto_3
    :try_start_a
    new-instance v22, Landroid/graphics/BitmapFactory$Options;

    invoke-direct/range {v22 .. v22}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 1014
    .local v22, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v4, 0x1

    move-object/from16 v0, v22

    iput-boolean v4, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 1015
    const/4 v14, 0x0

    .line 1017
    :try_start_b
    invoke-virtual {v15}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v4, v5}, Lorg/apache/cordova/camera/FileHelper;->getInputStreamFromUriString(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/io/InputStream;

    move-result-object v14

    .line 1018
    const/4 v4, 0x0

    move-object/from16 v0, v22

    invoke-static {v14, v4, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 1020
    if-eqz v14, :cond_5

    .line 1022
    :try_start_c
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_8
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 1031
    :cond_5
    :goto_4
    :try_start_d
    move-object/from16 v0, v22

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-eqz v4, :cond_6

    move-object/from16 v0, v22

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    if-nez v4, :cond_a

    .line 1032
    :cond_6
    const/16 v16, 0x0

    .line 1099
    if-eqz v17, :cond_0

    .line 1100
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 979
    .end local v22    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v29    # "timeStamp":Ljava/lang/String;
    :cond_7
    :try_start_e
    const-string v4, ".png"
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_7

    goto/16 :goto_2

    .line 997
    .end local v17    # "localFile":Ljava/io/File;
    .restart local v12    # "fileName":Ljava/lang/String;
    .restart local v18    # "localFile":Ljava/io/File;
    :catch_6
    move-exception v20

    .line 998
    .local v20, "oe":Ljava/lang/Exception;
    :try_start_f
    const-string v4, "CameraLauncher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to read Exif data: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_d

    .line 999
    const/16 v23, 0x0

    move-object/from16 v17, v18

    .end local v18    # "localFile":Ljava/io/File;
    .restart local v17    # "localFile":Ljava/io/File;
    goto :goto_3

    .line 1003
    .end local v12    # "fileName":Ljava/lang/String;
    .end local v14    # "fileStream":Ljava/io/InputStream;
    .end local v20    # "oe":Ljava/lang/Exception;
    .end local v29    # "timeStamp":Ljava/lang/String;
    :catch_7
    move-exception v10

    .line 1005
    .local v10, "e":Ljava/lang/Exception;
    :goto_5
    const-string v4, "CameraLauncher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception while getting input stream: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v10}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1006
    const/16 v16, 0x0

    goto/16 :goto_0

    .line 1023
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v14    # "fileStream":Ljava/io/InputStream;
    .restart local v22    # "options":Landroid/graphics/BitmapFactory$Options;
    :catch_8
    move-exception v10

    .line 1024
    .local v10, "e":Ljava/io/IOException;
    :try_start_10
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing file input stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    goto :goto_4

    .line 1099
    .end local v10    # "e":Ljava/io/IOException;
    .end local v22    # "options":Landroid/graphics/BitmapFactory$Options;
    :catchall_1
    move-exception v4

    if-eqz v17, :cond_8

    .line 1100
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    :cond_8
    throw v4

    .line 1020
    .restart local v22    # "options":Landroid/graphics/BitmapFactory$Options;
    :catchall_2
    move-exception v4

    if-eqz v14, :cond_9

    .line 1022
    :try_start_11
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_9
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    .line 1025
    :cond_9
    :goto_6
    :try_start_12
    throw v4

    .line 1023
    :catch_9
    move-exception v10

    .line 1024
    .restart local v10    # "e":Ljava/io/IOException;
    const-string v5, "CameraLauncher"

    const-string v6, "Exception while closing file input stream."

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    .line 1036
    .end local v10    # "e":Ljava/io/IOException;
    :cond_a
    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-gtz v4, :cond_b

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-gtz v4, :cond_b

    .line 1037
    move-object/from16 v0, v22

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move-object/from16 v0, p0

    iput v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 1038
    move-object/from16 v0, v22

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move-object/from16 v0, p0

    iput v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 1043
    :cond_b
    const/16 v24, 0x0

    .line 1044
    .local v24, "rotated":Z
    const/16 v4, 0x5a

    move/from16 v0, v23

    if-eq v0, v4, :cond_c

    const/16 v4, 0x10e

    move/from16 v0, v23

    if-ne v0, v4, :cond_e

    .line 1045
    :cond_c
    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move/from16 v26, v0

    .line 1046
    .local v26, "rotatedWidth":I
    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move/from16 v25, v0

    .line 1047
    .local v25, "rotatedHeight":I
    const/16 v24, 0x1

    .line 1054
    :goto_7
    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/camera/CameraLauncher;->calculateAspectRatio(II)[I

    move-result-object v31

    .line 1058
    .local v31, "widthHeight":[I
    const/4 v4, 0x0

    move-object/from16 v0, v22

    iput-boolean v4, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 1059
    const/4 v4, 0x0

    aget v4, v31, v4

    const/4 v5, 0x1

    aget v5, v31, v5

    move/from16 v0, v26

    move/from16 v1, v25

    invoke-static {v0, v1, v4, v5}, Lorg/apache/cordova/camera/CameraLauncher;->calculateSampleSize(IIII)I

    move-result v4

    move-object/from16 v0, v22

    iput v4, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    .line 1060
    const/16 v30, 0x0

    .line 1062
    .local v30, "unscaledBitmap":Landroid/graphics/Bitmap;
    :try_start_13
    invoke-virtual {v15}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v4, v5}, Lorg/apache/cordova/camera/FileHelper;->getInputStreamFromUriString(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/io/InputStream;

    move-result-object v14

    .line 1063
    const/4 v4, 0x0

    move-object/from16 v0, v22

    invoke-static {v14, v4, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    move-result-object v30

    .line 1065
    if-eqz v14, :cond_d

    .line 1067
    :try_start_14
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_a
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    .line 1073
    :cond_d
    :goto_8
    if-nez v30, :cond_10

    .line 1074
    const/16 v16, 0x0

    .line 1099
    if-eqz v17, :cond_0

    .line 1100
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 1049
    .end local v25    # "rotatedHeight":I
    .end local v26    # "rotatedWidth":I
    .end local v30    # "unscaledBitmap":Landroid/graphics/Bitmap;
    .end local v31    # "widthHeight":[I
    :cond_e
    :try_start_15
    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move/from16 v26, v0

    .line 1050
    .restart local v26    # "rotatedWidth":I
    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move/from16 v25, v0

    .restart local v25    # "rotatedHeight":I
    goto :goto_7

    .line 1068
    .restart local v30    # "unscaledBitmap":Landroid/graphics/Bitmap;
    .restart local v31    # "widthHeight":[I
    :catch_a
    move-exception v10

    .line 1069
    .restart local v10    # "e":Ljava/io/IOException;
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing file input stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_1

    goto :goto_8

    .line 1065
    .end local v10    # "e":Ljava/io/IOException;
    :catchall_3
    move-exception v4

    if-eqz v14, :cond_f

    .line 1067
    :try_start_16
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_b
    .catchall {:try_start_16 .. :try_end_16} :catchall_1

    .line 1070
    :cond_f
    :goto_9
    :try_start_17
    throw v4

    .line 1068
    :catch_b
    move-exception v10

    .line 1069
    .restart local v10    # "e":Ljava/io/IOException;
    const-string v5, "CameraLauncher"

    const-string v6, "Exception while closing file input stream."

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    .line 1077
    .end local v10    # "e":Ljava/io/IOException;
    :cond_10
    if-nez v24, :cond_14

    const/4 v4, 0x0

    aget v28, v31, v4

    .line 1078
    .local v28, "scaledWidth":I
    :goto_a
    if-nez v24, :cond_15

    const/4 v4, 0x1

    aget v27, v31, v4

    .line 1080
    .local v27, "scaledHeight":I
    :goto_b
    const/4 v4, 0x1

    move-object/from16 v0, v30

    move/from16 v1, v28

    move/from16 v2, v27

    invoke-static {v0, v1, v2, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 1081
    .local v3, "scaledBitmap":Landroid/graphics/Bitmap;
    move-object/from16 v0, v30

    if-eq v3, v0, :cond_11

    .line 1082
    invoke-virtual/range {v30 .. v30}, Landroid/graphics/Bitmap;->recycle()V

    .line 1083
    const/16 v30, 0x0

    .line 1085
    :cond_11
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-eqz v4, :cond_12

    if-eqz v23, :cond_12

    .line 1086
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 1087
    .local v8, "matrix":Landroid/graphics/Matrix;
    move/from16 v0, v23

    int-to-float v4, v0

    invoke-virtual {v8, v4}, Landroid/graphics/Matrix;->setRotate(F)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_1

    .line 1089
    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_18
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    const/4 v9, 0x1

    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 1090
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->orientationCorrected:Z
    :try_end_18
    .catch Ljava/lang/OutOfMemoryError; {:try_start_18 .. :try_end_18} :catch_c
    .catchall {:try_start_18 .. :try_end_18} :catchall_1

    .line 1099
    .end local v8    # "matrix":Landroid/graphics/Matrix;
    :cond_12
    :goto_c
    if-eqz v17, :cond_13

    .line 1100
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    :cond_13
    move-object/from16 v16, v3

    .line 1095
    goto/16 :goto_0

    .line 1077
    .end local v3    # "scaledBitmap":Landroid/graphics/Bitmap;
    .end local v27    # "scaledHeight":I
    .end local v28    # "scaledWidth":I
    :cond_14
    const/4 v4, 0x1

    :try_start_19
    aget v28, v31, v4

    goto :goto_a

    .line 1078
    .restart local v28    # "scaledWidth":I
    :cond_15
    const/4 v4, 0x0

    aget v27, v31, v4

    goto :goto_b

    .line 1091
    .restart local v3    # "scaledBitmap":Landroid/graphics/Bitmap;
    .restart local v8    # "matrix":Landroid/graphics/Matrix;
    .restart local v27    # "scaledHeight":I
    :catch_c
    move-exception v21

    .line 1092
    .local v21, "oom":Ljava/lang/OutOfMemoryError;
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lorg/apache/cordova/camera/CameraLauncher;->orientationCorrected:Z
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_1

    goto :goto_c

    .line 1003
    .end local v3    # "scaledBitmap":Landroid/graphics/Bitmap;
    .end local v8    # "matrix":Landroid/graphics/Matrix;
    .end local v17    # "localFile":Ljava/io/File;
    .end local v21    # "oom":Ljava/lang/OutOfMemoryError;
    .end local v22    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v24    # "rotated":Z
    .end local v25    # "rotatedHeight":I
    .end local v26    # "rotatedWidth":I
    .end local v27    # "scaledHeight":I
    .end local v28    # "scaledWidth":I
    .end local v30    # "unscaledBitmap":Landroid/graphics/Bitmap;
    .end local v31    # "widthHeight":[I
    .restart local v12    # "fileName":Ljava/lang/String;
    .restart local v18    # "localFile":Ljava/io/File;
    .restart local v29    # "timeStamp":Ljava/lang/String;
    :catch_d
    move-exception v10

    move-object/from16 v17, v18

    .end local v18    # "localFile":Ljava/io/File;
    .restart local v17    # "localFile":Ljava/io/File;
    goto/16 :goto_5
.end method

.method private getTempDirectoryPath()Ljava/lang/String;
    .locals 3

    .prologue
    .line 217
    const/4 v0, 0x0

    .line 220
    .local v0, "cache":Ljava/io/File;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mounted"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 221
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    .line 229
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 230
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 225
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method private getUriFromMediaStore()Landroid/net/Uri;
    .locals 6

    .prologue
    .line 914
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 915
    .local v3, "values":Landroid/content/ContentValues;
    const-string v4, "mime_type"

    const-string v5, "image/jpeg"

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 918
    :try_start_0
    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 928
    :goto_0
    return-object v2

    .line 919
    :catch_0
    move-exception v0

    .line 920
    .local v0, "e":Ljava/lang/RuntimeException;
    const-string v4, "CameraLauncher"

    const-string v5, "Can\'t write to external media storage."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 922
    :try_start_1
    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .local v2, "uri":Landroid/net/Uri;
    goto :goto_0

    .line 923
    .end local v2    # "uri":Landroid/net/Uri;
    :catch_1
    move-exception v1

    .line 924
    .local v1, "ex":Ljava/lang/RuntimeException;
    const-string v4, "CameraLauncher"

    const-string v5, "Can\'t write to internal media storage."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 925
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private outputModifiedBitmap(Landroid/graphics/Bitmap;Landroid/net/Uri;)Ljava/lang/String;
    .locals 9
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 632
    iget-object v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {p2, v7}, Lorg/apache/cordova/camera/FileHelper;->getRealPath(Landroid/net/Uri;Lorg/apache/cordova/CordovaInterface;)Ljava/lang/String;

    move-result-object v5

    .line 635
    .local v5, "realPath":Ljava/lang/String;
    if-eqz v5, :cond_2

    const/16 v7, 0x2f

    .line 636
    invoke-virtual {v5, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 639
    .local v2, "fileName":Ljava/lang/String;
    :goto_0
    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string v8, "yyyyMMdd_HHmmss"

    invoke-direct {v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8}, Ljava/util/Date;-><init>()V

    invoke-virtual {v7, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    .line 641
    .local v6, "timeStamp":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lorg/apache/cordova/camera/CameraLauncher;->getTempDirectoryPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 643
    .local v3, "modifiedPath":Ljava/lang/String;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 644
    .local v4, "os":Ljava/io/OutputStream;
    iget v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v7, :cond_4

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 648
    .local v0, "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :goto_1
    iget v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    invoke-virtual {p1, v0, v7, v4}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 649
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 651
    iget-object v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    if-eqz v7, :cond_1

    iget v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v7, :cond_1

    .line 653
    :try_start_0
    iget-boolean v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-eqz v7, :cond_0

    iget-boolean v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->orientationCorrected:Z

    if-eqz v7, :cond_0

    .line 654
    iget-object v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    invoke-virtual {v7}, Lorg/apache/cordova/camera/ExifHelper;->resetOrientation()V

    .line 656
    :cond_0
    iget-object v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    invoke-virtual {v7, v3}, Lorg/apache/cordova/camera/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 657
    iget-object v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;

    invoke-virtual {v7}, Lorg/apache/cordova/camera/ExifHelper;->writeExifData()V

    .line 658
    const/4 v7, 0x0

    iput-object v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->exifData:Lorg/apache/cordova/camera/ExifHelper;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 663
    :cond_1
    :goto_2
    return-object v3

    .line 636
    .end local v0    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "modifiedPath":Ljava/lang/String;
    .end local v4    # "os":Ljava/io/OutputStream;
    .end local v6    # "timeStamp":Ljava/lang/String;
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "modified."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v7, :cond_3

    const-string v7, "jpg"

    :goto_3
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_3
    const-string v7, "png"

    goto :goto_3

    .line 644
    .restart local v2    # "fileName":Ljava/lang/String;
    .restart local v3    # "modifiedPath":Ljava/lang/String;
    .restart local v4    # "os":Ljava/io/OutputStream;
    .restart local v6    # "timeStamp":Ljava/lang/String;
    :cond_4
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_1

    .line 659
    .restart local v0    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :catch_0
    move-exception v1

    .line 660
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method private performCrop(Landroid/net/Uri;ILandroid/content/Intent;)V
    .locals 8
    .param p1, "picUri"    # Landroid/net/Uri;
    .param p2, "destType"    # I
    .param p3, "cameraIntent"    # Landroid/content/Intent;

    .prologue
    .line 418
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v3, "com.android.camera.action.CROP"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 420
    .local v1, "cropIntent":Landroid/content/Intent;
    const-string v3, "image/*"

    invoke-virtual {v1, p1, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 422
    const-string v3, "crop"

    const-string v4, "true"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 426
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-lez v3, :cond_0

    .line 427
    const-string v3, "outputX"

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 429
    :cond_0
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-lez v3, :cond_1

    .line 430
    const-string v3, "outputY"

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 432
    :cond_1
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-lez v3, :cond_2

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-lez v3, :cond_2

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-ne v3, v4, :cond_2

    .line 433
    const-string v3, "aspectX"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 434
    const-string v3, "aspectY"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 437
    :cond_2
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(ILjava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 438
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 439
    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 440
    const-string v3, "output"

    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 445
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    if-eqz v3, :cond_3

    .line 446
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    add-int/lit8 v4, p2, 0x64

    invoke-interface {v3, p0, v1, v4}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 460
    .end local v1    # "cropIntent":Landroid/content/Intent;
    :cond_3
    :goto_0
    return-void

    .line 449
    :catch_0
    move-exception v0

    .line 450
    .local v0, "anfe":Landroid/content/ActivityNotFoundException;
    const-string v3, "CameraLauncher"

    const-string v4, "Crop operation not supported on this device"

    invoke-static {v3, v4}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    :try_start_1
    invoke-direct {p0, p2, p3}, Lorg/apache/cordova/camera/CameraLauncher;->processResultFromCamera(ILandroid/content/Intent;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 454
    :catch_1
    move-exception v2

    .line 456
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 457
    const-string v3, "CameraLauncher"

    const-string v4, "Unable to write to file"

    invoke-static {v3, v4}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private processResultFromCamera(ILandroid/content/Intent;)V
    .locals 18
    .param p1, "destType"    # I
    .param p2, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 469
    const/4 v11, 0x0

    .line 472
    .local v11, "rotate":I
    new-instance v6, Lorg/apache/cordova/camera/ExifHelper;

    invoke-direct {v6}, Lorg/apache/cordova/camera/ExifHelper;-><init>()V

    .line 474
    .local v6, "exif":Lorg/apache/cordova/camera/ExifHelper;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    if-eqz v14, :cond_3

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    if-eqz v14, :cond_3

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 475
    invoke-virtual {v14}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lorg/apache/cordova/camera/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 479
    .local v12, "sourcePath":Ljava/lang/String;
    :goto_0
    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v14, :cond_0

    .line 482
    :try_start_0
    invoke-virtual {v6, v12}, Lorg/apache/cordova/camera/ExifHelper;->createInFile(Ljava/lang/String;)V

    .line 483
    invoke-virtual {v6}, Lorg/apache/cordova/camera/ExifHelper;->readExifData()V

    .line 484
    invoke-virtual {v6}, Lorg/apache/cordova/camera/ExifHelper;->getOrientation()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v11

    .line 491
    :cond_0
    :goto_1
    const/4 v2, 0x0

    .line 492
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    const/4 v8, 0x0

    .line 497
    .local v8, "galleryUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v14, :cond_1

    .line 498
    new-instance v14, Ljava/io/File;

    invoke-direct/range {p0 .. p0}, Lorg/apache/cordova/camera/CameraLauncher;->getPicturesPath()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v14}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v8

    .line 500
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    if-eqz v14, :cond_4

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    if-eqz v14, :cond_4

    .line 501
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v8}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 507
    :goto_2
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->refreshGallery(Landroid/net/Uri;)V

    .line 511
    :cond_1
    if-nez p1, :cond_7

    .line 512
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/apache/cordova/camera/CameraLauncher;->getScaledAndRotatedBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 514
    if-nez v2, :cond_2

    .line 516
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v14

    const-string v15, "data"

    invoke-virtual {v14, v15}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    check-cast v2, Landroid/graphics/Bitmap;

    .line 520
    .restart local v2    # "bitmap":Landroid/graphics/Bitmap;
    :cond_2
    if-nez v2, :cond_5

    .line 521
    const-string v14, "CameraLauncher"

    const-string v15, "I either have a null image path or bitmap"

    invoke-static {v14, v15}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 522
    const-string v14, "Unable to create bitmap!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    .line 599
    :goto_3
    return-void

    .line 475
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    .end local v8    # "galleryUri":Landroid/net/Uri;
    .end local v12    # "sourcePath":Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Lorg/apache/cordova/camera/CordovaUri;

    .line 476
    invoke-virtual {v14}, Lorg/apache/cordova/camera/CordovaUri;->getFilePath()Ljava/lang/String;

    move-result-object v12

    goto :goto_0

    .line 486
    .restart local v12    # "sourcePath":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 487
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 503
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v2    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v8    # "galleryUri":Landroid/net/Uri;
    :cond_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Lorg/apache/cordova/camera/CordovaUri;

    invoke-virtual {v14}, Lorg/apache/cordova/camera/CordovaUri;->getFileUri()Landroid/net/Uri;

    move-result-object v9

    .line 504
    .local v9, "imageUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    invoke-direct {v0, v9, v8}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Landroid/net/Uri;Landroid/net/Uri;)V

    goto :goto_2

    .line 527
    .end local v9    # "imageUri":Landroid/net/Uri;
    :cond_5
    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v14}, Lorg/apache/cordova/camera/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;I)V

    .line 529
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    if-nez v14, :cond_6

    .line 530
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/apache/cordova/camera/CameraLauncher;->checkForDuplicateImage(I)V

    .line 597
    :cond_6
    :goto_4
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Lorg/apache/cordova/camera/CordovaUri;

    invoke-virtual {v15}, Lorg/apache/cordova/camera/CordovaUri;->getFileUri()Landroid/net/Uri;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15, v8, v2}, Lorg/apache/cordova/camera/CameraLauncher;->cleanup(ILandroid/net/Uri;Landroid/net/Uri;Landroid/graphics/Bitmap;)V

    .line 598
    const/4 v2, 0x0

    .line 599
    goto :goto_3

    .line 535
    :cond_7
    const/4 v14, 0x1

    move/from16 v0, p1

    if-eq v0, v14, :cond_8

    const/4 v14, 0x2

    move/from16 v0, p1

    if-ne v0, v14, :cond_10

    .line 537
    :cond_8
    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    const/4 v15, -0x1

    if-ne v14, v15, :cond_b

    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    const/4 v15, -0x1

    if-ne v14, v15, :cond_b

    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    const/16 v15, 0x64

    if-ne v14, v15, :cond_b

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-nez v14, :cond_b

    .line 542
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v14, :cond_9

    .line 543
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_4

    .line 545
    :cond_9
    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(ILjava/lang/String;)Ljava/io/File;

    move-result-object v14

    invoke-static {v14}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v13

    .line 547
    .local v13, "uri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    if-eqz v14, :cond_a

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    if-eqz v14, :cond_a

    .line 548
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/apache/cordova/camera/CameraLauncher;->getFileNameFromUri(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v14}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    .line 549
    .local v4, "croppedUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v13}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 555
    .end local v4    # "croppedUri":Landroid/net/Uri;
    :goto_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v13}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 551
    :cond_a
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Lorg/apache/cordova/camera/CordovaUri;

    invoke-virtual {v14}, Lorg/apache/cordova/camera/CordovaUri;->getFileUri()Landroid/net/Uri;

    move-result-object v9

    .line 552
    .restart local v9    # "imageUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    invoke-direct {v0, v9, v13}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Landroid/net/Uri;Landroid/net/Uri;)V

    goto :goto_5

    .line 558
    .end local v9    # "imageUri":Landroid/net/Uri;
    .end local v13    # "uri":Landroid/net/Uri;
    :cond_b
    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(ILjava/lang/String;)Ljava/io/File;

    move-result-object v14

    invoke-static {v14}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v13

    .line 559
    .restart local v13    # "uri":Landroid/net/Uri;
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/apache/cordova/camera/CameraLauncher;->getScaledAndRotatedBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 562
    if-nez v2, :cond_c

    .line 563
    const-string v14, "CameraLauncher"

    const-string v15, "I either have a null image path or bitmap"

    invoke-static {v14, v15}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    const-string v14, "Unable to create bitmap!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 570
    :cond_c
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v14}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v14

    invoke-virtual {v14}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    invoke-virtual {v14, v13}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v10

    .line 571
    .local v10, "os":Ljava/io/OutputStream;
    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v14, :cond_f

    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 575
    .local v3, "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :goto_6
    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    invoke-virtual {v2, v3, v14, v10}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 576
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V

    .line 579
    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-nez v14, :cond_e

    .line 581
    invoke-virtual {v13}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v7

    .line 583
    .local v7, "exifPath":Ljava/lang/String;
    const/4 v14, 0x1

    if-eq v11, v14, :cond_d

    .line 584
    invoke-virtual {v6}, Lorg/apache/cordova/camera/ExifHelper;->resetOrientation()V

    .line 585
    :cond_d
    invoke-virtual {v6, v7}, Lorg/apache/cordova/camera/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 586
    invoke-virtual {v6}, Lorg/apache/cordova/camera/ExifHelper;->writeExifData()V

    .line 590
    .end local v7    # "exifPath":Ljava/lang/String;
    :cond_e
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v13}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 571
    .end local v3    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :cond_f
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_6

    .line 594
    .end local v10    # "os":Ljava/io/OutputStream;
    .end local v13    # "uri":Landroid/net/Uri;
    :cond_10
    new-instance v14, Ljava/lang/IllegalStateException;

    invoke-direct {v14}, Ljava/lang/IllegalStateException;-><init>()V

    throw v14
.end method

.method private processResultFromGallery(ILandroid/content/Intent;)V
    .locals 12
    .param p1, "destType"    # I
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 674
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    .line 675
    .local v6, "uri":Landroid/net/Uri;
    if-nez v6, :cond_0

    .line 676
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    if-eqz v8, :cond_1

    .line 677
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 683
    :cond_0
    const/4 v5, 0x0

    .line 685
    .local v5, "rotate":I
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v6, v8}, Lorg/apache/cordova/camera/FileHelper;->getRealPath(Landroid/net/Uri;Lorg/apache/cordova/CordovaInterface;)Ljava/lang/String;

    move-result-object v2

    .line 686
    .local v2, "fileLocation":Ljava/lang/String;
    const-string v8, "CameraLauncher"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "File locaton is: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 690
    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    if-eqz v8, :cond_2

    .line 691
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v8, v2}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 757
    .end local v2    # "fileLocation":Ljava/lang/String;
    .end local v5    # "rotate":I
    :goto_0
    return-void

    .line 679
    :cond_1
    const-string v8, "null data from photo library"

    invoke-virtual {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 694
    .restart local v2    # "fileLocation":Ljava/lang/String;
    .restart local v5    # "rotate":I
    :cond_2
    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    .line 696
    .local v7, "uriString":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v7, v8}, Lorg/apache/cordova/camera/FileHelper;->getMimeType(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;)Ljava/lang/String;

    move-result-object v3

    .line 700
    .local v3, "mimeType":Ljava/lang/String;
    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_4

    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_4

    const/4 v8, 0x1

    if-eq p1, v8, :cond_3

    const/4 v8, 0x2

    if-ne p1, v8, :cond_4

    :cond_3
    iget-boolean v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-nez v8, :cond_4

    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 702
    invoke-direct {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->getMimetypeForFormat(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 704
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v8, v7}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_0

    .line 707
    :cond_4
    const-string v8, "image/jpeg"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5

    const-string v8, "image/png"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 708
    const-string v8, "CameraLauncher"

    const-string v9, "I either have a null image path or bitmap"

    invoke-static {v8, v9}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 709
    const-string v8, "Unable to retrieve path to picture!"

    invoke-virtual {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 712
    :cond_5
    const/4 v0, 0x0

    .line 714
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :try_start_0
    invoke-direct {p0, v7}, Lorg/apache/cordova/camera/CameraLauncher;->getScaledAndRotatedBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 718
    :goto_1
    if-nez v0, :cond_6

    .line 719
    const-string v8, "CameraLauncher"

    const-string v9, "I either have a null image path or bitmap"

    invoke-static {v8, v9}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    const-string v8, "Unable to create bitmap!"

    invoke-virtual {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 715
    :catch_0
    move-exception v1

    .line 716
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 725
    .end local v1    # "e":Ljava/io/IOException;
    :cond_6
    if-nez p1, :cond_9

    .line 726
    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;I)V

    .line 750
    :cond_7
    :goto_2
    if-eqz v0, :cond_8

    .line 751
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 752
    const/4 v0, 0x0

    .line 754
    :cond_8
    invoke-static {}, Ljava/lang/System;->gc()V

    goto :goto_0

    .line 730
    :cond_9
    const/4 v8, 0x1

    if-eq p1, v8, :cond_a

    const/4 v8, 0x2

    if-ne p1, v8, :cond_7

    .line 732
    :cond_a
    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-lez v8, :cond_b

    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-gtz v8, :cond_d

    :cond_b
    iget-boolean v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-eqz v8, :cond_c

    iget-boolean v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->orientationCorrected:Z

    if-nez v8, :cond_d

    :cond_c
    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 734
    invoke-direct {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->getMimetypeForFormat(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_e

    .line 737
    :cond_d
    :try_start_1
    invoke-direct {p0, v0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->outputModifiedBitmap(Landroid/graphics/Bitmap;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    .line 740
    .local v4, "modifiedPath":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "file://"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "?"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 742
    .end local v4    # "modifiedPath":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 743
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 744
    const-string v8, "Error retrieving image."

    invoke-virtual {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_2

    .line 747
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_e
    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v8, v2}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_2
.end method

.method private queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;
    .locals 6
    .param p1, "contentStore"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 1180
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v1

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private refreshGallery(Landroid/net/Uri;)V
    .locals 2
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    .line 612
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 613
    .local v0, "mediaScanIntent":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 614
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 615
    return-void
.end method

.method private scanForGallery(Landroid/net/Uri;)V
    .locals 2
    .param p1, "newImage"    # Landroid/net/Uri;

    .prologue
    .line 1290
    iput-object p1, p0, Lorg/apache/cordova/camera/CameraLauncher;->scanMe:Landroid/net/Uri;

    .line 1291
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    if-eqz v0, :cond_0

    .line 1292
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 1294
    :cond_0
    new-instance v0, Landroid/media/MediaScannerConnection;

    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/media/MediaScannerConnection;-><init>(Landroid/content/Context;Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;)V

    iput-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    .line 1295
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->connect()V

    .line 1296
    return-void
.end method

.method private whichContentStore()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 1246
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1247
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 1249
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_0
.end method

.method private writeUncompressedImage(Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 2
    .param p1, "src"    # Landroid/net/Uri;
    .param p2, "dest"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 903
    new-instance v0, Ljava/io/FileInputStream;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/cordova/camera/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 904
    .local v0, "fis":Ljava/io/FileInputStream;
    invoke-direct {p0, v0, p2}, Lorg/apache/cordova/camera/CameraLauncher;->writeUncompressedImage(Ljava/io/InputStream;Landroid/net/Uri;)V

    .line 906
    return-void
.end method

.method private writeUncompressedImage(Ljava/io/InputStream;Landroid/net/Uri;)V
    .locals 7
    .param p1, "fis"    # Ljava/io/InputStream;
    .param p2, "dest"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 866
    const/4 v3, 0x0

    .line 868
    .local v3, "os":Ljava/io/OutputStream;
    :try_start_0
    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, p2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v3

    .line 869
    const/16 v4, 0x1000

    new-array v0, v4, [B

    .line 871
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "len":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_2

    .line 872
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 876
    .end local v0    # "buffer":[B
    .end local v2    # "len":I
    :catchall_0
    move-exception v4

    if-eqz v3, :cond_0

    .line 878
    :try_start_1
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 883
    :cond_0
    :goto_1
    if-eqz p1, :cond_1

    .line 885
    :try_start_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 888
    :cond_1
    :goto_2
    throw v4

    .line 874
    .restart local v0    # "buffer":[B
    .restart local v2    # "len":I
    :cond_2
    :try_start_3
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 876
    if-eqz v3, :cond_3

    .line 878
    :try_start_4
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 883
    :cond_3
    :goto_3
    if-eqz p1, :cond_4

    .line 885
    :try_start_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 891
    :cond_4
    :goto_4
    return-void

    .line 879
    :catch_0
    move-exception v1

    .line 880
    .local v1, "e":Ljava/io/IOException;
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing output stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 886
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 887
    .restart local v1    # "e":Ljava/io/IOException;
    const-string v4, "CameraLauncher"

    const-string v5, "Exception while closing file input stream."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 879
    .end local v0    # "buffer":[B
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "len":I
    :catch_2
    move-exception v1

    .line 880
    .restart local v1    # "e":Ljava/io/IOException;
    const-string v5, "CameraLauncher"

    const-string v6, "Exception while closing output stream."

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 886
    .end local v1    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v1

    .line 887
    .restart local v1    # "e":Ljava/io/IOException;
    const-string v5, "CameraLauncher"

    const-string v6, "Exception while closing file input stream."

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method


# virtual methods
.method public calculateAspectRatio(II)[I
    .locals 12
    .param p1, "origWidth"    # I
    .param p2, "origHeight"    # I

    .prologue
    .line 1114
    iget v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 1115
    .local v1, "newWidth":I
    iget v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 1118
    .local v0, "newHeight":I
    if-gtz v1, :cond_1

    if-gtz v0, :cond_1

    .line 1119
    move v1, p1

    .line 1120
    move v0, p2

    .line 1147
    :cond_0
    :goto_0
    const/4 v7, 0x2

    new-array v6, v7, [I

    .line 1148
    .local v6, "retval":[I
    const/4 v7, 0x0

    aput v1, v6, v7

    .line 1149
    const/4 v7, 0x1

    aput v0, v6, v7

    .line 1150
    return-object v6

    .line 1123
    .end local v6    # "retval":[I
    :cond_1
    if-lez v1, :cond_2

    if-gtz v0, :cond_2

    .line 1124
    int-to-double v8, v1

    int-to-double v10, p1

    div-double/2addr v8, v10

    int-to-double v10, p2

    mul-double/2addr v8, v10

    double-to-int v0, v8

    goto :goto_0

    .line 1127
    :cond_2
    if-gtz v1, :cond_3

    if-lez v0, :cond_3

    .line 1128
    int-to-double v8, v0

    int-to-double v10, p2

    div-double/2addr v8, v10

    int-to-double v10, p1

    mul-double/2addr v8, v10

    double-to-int v1, v8

    goto :goto_0

    .line 1137
    :cond_3
    int-to-double v8, v1

    int-to-double v10, v0

    div-double v2, v8, v10

    .line 1138
    .local v2, "newRatio":D
    int-to-double v8, p1

    int-to-double v10, p2

    div-double v4, v8, v10

    .line 1140
    .local v4, "origRatio":D
    cmpl-double v7, v4, v2

    if-lez v7, :cond_4

    .line 1141
    mul-int v7, v1, p2

    div-int v0, v7, p1

    goto :goto_0

    .line 1142
    :cond_4
    cmpg-double v7, v4, v2

    if-gez v7, :cond_0

    .line 1143
    mul-int v7, v0, p1

    div-int v1, v7, p2

    goto :goto_0
.end method

.method public callTakePicture(II)V
    .locals 10
    .param p1, "returnType"    # I
    .param p2, "encodingType"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 248
    const-string v7, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v7}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    const-string v7, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 249
    invoke-static {p0, v7}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    move v3, v5

    .line 250
    .local v3, "saveAlbumPermission":Z
    :goto_0
    const-string v7, "android.permission.CAMERA"

    invoke-static {p0, v7}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v4

    .line 256
    .local v4, "takePicturePermission":Z
    if-nez v4, :cond_0

    .line 257
    const/4 v4, 0x1

    .line 259
    :try_start_0
    iget-object v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 260
    .local v0, "packageManager":Landroid/content/pm/PackageManager;
    iget-object v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x1000

    invoke-virtual {v0, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v7

    iget-object v2, v7, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    .line 261
    .local v2, "permissionsInPackage":[Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 262
    array-length v8, v2

    move v7, v6

    :goto_1
    if-ge v7, v8, :cond_0

    aget-object v1, v2, v7

    .line 263
    .local v1, "permission":Ljava/lang/String;
    const-string v9, "android.permission.CAMERA"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v9

    if-eqz v9, :cond_2

    .line 264
    const/4 v4, 0x0

    .line 275
    .end local v0    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v1    # "permission":Ljava/lang/String;
    .end local v2    # "permissionsInPackage":[Ljava/lang/String;
    :cond_0
    :goto_2
    if-eqz v4, :cond_3

    if-eqz v3, :cond_3

    .line 276
    invoke-virtual {p0, p1, p2}, Lorg/apache/cordova/camera/CameraLauncher;->takePicture(II)V

    .line 285
    :goto_3
    return-void

    .end local v3    # "saveAlbumPermission":Z
    .end local v4    # "takePicturePermission":Z
    :cond_1
    move v3, v6

    .line 249
    goto :goto_0

    .line 262
    .restart local v0    # "packageManager":Landroid/content/pm/PackageManager;
    .restart local v1    # "permission":Ljava/lang/String;
    .restart local v2    # "permissionsInPackage":[Ljava/lang/String;
    .restart local v3    # "saveAlbumPermission":Z
    .restart local v4    # "takePicturePermission":Z
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 277
    .end local v0    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v1    # "permission":Ljava/lang/String;
    .end local v2    # "permissionsInPackage":[Ljava/lang/String;
    :cond_3
    if-eqz v3, :cond_4

    if-nez v4, :cond_4

    .line 278
    const-string v5, "android.permission.CAMERA"

    invoke-static {p0, v6, v5}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    goto :goto_3

    .line 279
    :cond_4
    if-nez v3, :cond_5

    if-eqz v4, :cond_5

    .line 280
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/String;

    const-string v8, "android.permission.READ_EXTERNAL_STORAGE"

    aput-object v8, v7, v6

    const-string v8, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v8, v7, v5

    invoke-static {p0, v6, v7}, Lorg/apache/cordova/PermissionHelper;->requestPermissions(Lorg/apache/cordova/CordovaPlugin;I[Ljava/lang/String;)V

    goto :goto_3

    .line 283
    :cond_5
    sget-object v5, Lorg/apache/cordova/camera/CameraLauncher;->permissions:[Ljava/lang/String;

    invoke-static {p0, v6, v5}, Lorg/apache/cordova/PermissionHelper;->requestPermissions(Lorg/apache/cordova/CordovaPlugin;I[Ljava/lang/String;)V

    goto :goto_3

    .line 269
    :catch_0
    move-exception v7

    goto :goto_2
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 9
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x2

    const/4 v7, -0x1

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 137
    iput-object p3, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 140
    iget-object v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v5, "APPLICATION_ID"

    invoke-static {v2, v5}, Lorg/apache/cordova/BuildHelper;->getBuildConfigValue(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->applicationId:Ljava/lang/String;

    .line 141
    iget-object v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v5, "applicationId"

    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->applicationId:Ljava/lang/String;

    invoke-virtual {v2, v5, v6}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->applicationId:Ljava/lang/String;

    .line 144
    const-string v2, "takePicture"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 145
    iput v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    .line 146
    iput v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    .line 147
    iput-boolean v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    .line 148
    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 149
    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 150
    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 151
    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    .line 152
    const/16 v2, 0x32

    iput v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    .line 155
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    .line 156
    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    .line 157
    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    .line 158
    const/4 v2, 0x3

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 159
    const/4 v2, 0x4

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 160
    const/4 v2, 0x5

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 161
    const/4 v2, 0x6

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    .line 162
    const/4 v2, 0x7

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v2

    iput-boolean v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    .line 163
    const/16 v2, 0x8

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v2

    iput-boolean v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    .line 164
    const/16 v2, 0x9

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v2

    iput-boolean v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    .line 168
    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-ge v2, v3, :cond_0

    .line 169
    iput v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 171
    :cond_0
    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-ge v2, v3, :cond_1

    .line 172
    iput v7, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 177
    :cond_1
    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-ne v2, v7, :cond_2

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-ne v2, v7, :cond_2

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    const/16 v5, 0x64

    if-ne v2, v5, :cond_2

    iget-boolean v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    if-nez v2, :cond_2

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    if-ne v2, v3, :cond_2

    .line 179
    iput v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 183
    :cond_2
    :try_start_0
    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    if-ne v2, v3, :cond_4

    .line 184
    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v2, v4}, Lorg/apache/cordova/camera/CameraLauncher;->callTakePicture(II)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    :cond_3
    :goto_0
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 204
    .local v1, "r":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v1, v3}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 205
    invoke-virtual {p3, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    move v2, v3

    .line 209
    .end local v1    # "r":Lorg/apache/cordova/PluginResult;
    :goto_1
    return v2

    .line 186
    :cond_4
    :try_start_1
    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    if-eqz v2, :cond_5

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    if-ne v2, v8, :cond_3

    .line 188
    :cond_5
    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v2}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 189
    const/4 v2, 0x1

    const-string v4, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v2, v4}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 195
    :catch_0
    move-exception v0

    .line 197
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v2, "Illegal Argument Exception"

    invoke-virtual {p3, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 198
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 199
    .restart local v1    # "r":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p3, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    move v2, v3

    .line 200
    goto :goto_1

    .line 191
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v1    # "r":Lorg/apache/cordova/PluginResult;
    :cond_6
    :try_start_2
    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    iget v5, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v2, v4, v5}, Lorg/apache/cordova/camera/CameraLauncher;->getImage(III)V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :cond_7
    move v2, v4

    .line 209
    goto :goto_1
.end method

.method public failPicture(Ljava/lang/String;)V
    .locals 1
    .param p1, "err"    # Ljava/lang/String;

    .prologue
    .line 1286
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 1287
    return-void
.end method

.method public getImage(III)V
    .locals 6
    .param p1, "srcType"    # I
    .param p2, "returnType"    # I
    .param p3, "encodingType"    # I

    .prologue
    const/4 v5, 0x1

    .line 366
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 367
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "Get Picture"

    .line 368
    .local v2, "title":Ljava/lang/String;
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 369
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    if-nez v3, :cond_6

    .line 370
    const-string v3, "image/*"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 371
    iget-boolean v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    if-eqz v3, :cond_5

    .line 372
    const-string v3, "android.intent.action.PICK"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 373
    const-string v3, "crop"

    const-string v4, "true"

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 374
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-lez v3, :cond_0

    .line 375
    const-string v3, "outputX"

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 377
    :cond_0
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-lez v3, :cond_1

    .line 378
    const-string v3, "outputY"

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 380
    :cond_1
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-lez v3, :cond_2

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    if-lez v3, :cond_2

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    iget v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    if-ne v3, v4, :cond_2

    .line 381
    const-string v3, "aspectX"

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 382
    const-string v3, "aspectY"

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 384
    :cond_2
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(I)Ljava/io/File;

    move-result-object v1

    .line 385
    .local v1, "photo":Ljava/io/File;
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 386
    const-string v3, "output"

    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 404
    .end local v1    # "photo":Ljava/io/File;
    :cond_3
    :goto_0
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    if-eqz v3, :cond_4

    .line 405
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v4}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v4

    add-int/lit8 v5, p1, 0x1

    mul-int/lit8 v5, v5, 0x10

    add-int/2addr v5, p2

    add-int/lit8 v5, v5, 0x1

    invoke-interface {v3, p0, v4, v5}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    .line 408
    :cond_4
    return-void

    .line 388
    :cond_5
    const-string v3, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 389
    const-string v3, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 391
    :cond_6
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    if-ne v3, v5, :cond_7

    .line 392
    const-string v3, "video/*"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 393
    const-string v2, "Get Video"

    .line 394
    const-string v3, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 395
    const-string v3, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 396
    :cond_7
    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_3

    .line 399
    const-string v3, "*/*"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 400
    const-string v2, "Get All"

    .line 401
    const-string v3, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 402
    const-string v3, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 9
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v7, -0x1

    .line 770
    div-int/lit8 v6, p1, 0x10

    add-int/lit8 v4, v6, -0x1

    .line 771
    .local v4, "srcType":I
    rem-int/lit8 v6, p1, 0x10

    add-int/lit8 v0, v6, -0x1

    .line 774
    .local v0, "destType":I
    const/16 v6, 0x64

    if-lt p1, v6, :cond_3

    .line 775
    if-ne p2, v7, :cond_1

    .line 779
    add-int/lit8 v0, p1, -0x64

    .line 781
    :try_start_0
    invoke-direct {p0, v0, p3}, Lorg/apache/cordova/camera/CameraLauncher;->processResultFromCamera(ILandroid/content/Intent;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 842
    :cond_0
    :goto_0
    return-void

    .line 782
    :catch_0
    move-exception v1

    .line 783
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 784
    const-string v6, "CameraLauncher"

    const-string v7, "Unable to write to file"

    invoke-static {v6, v7}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 788
    .end local v1    # "e":Ljava/io/IOException;
    :cond_1
    if-nez p2, :cond_2

    .line 789
    const-string v6, "No Image Selected"

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 794
    :cond_2
    const-string v6, "Did not complete!"

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 798
    :cond_3
    const/4 v6, 0x1

    if-ne v4, v6, :cond_7

    .line 800
    if-ne p2, v7, :cond_5

    .line 802
    :try_start_1
    iget-boolean v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    if-eqz v6, :cond_4

    .line 803
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->applicationId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".provider"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget v8, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 805
    invoke-direct {p0, v8}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(I)Ljava/io/File;

    move-result-object v8

    .line 803
    invoke-static {v6, v7, v8}, Landroid/support/v4/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    .line 806
    .local v5, "tmpFile":Landroid/net/Uri;
    invoke-direct {p0, v5, v0, p3}, Lorg/apache/cordova/camera/CameraLauncher;->performCrop(Landroid/net/Uri;ILandroid/content/Intent;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 810
    .end local v5    # "tmpFile":Landroid/net/Uri;
    :catch_1
    move-exception v1

    .line 811
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 812
    const-string v6, "Error capturing image."

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 808
    .end local v1    # "e":Ljava/io/IOException;
    :cond_4
    :try_start_2
    invoke-direct {p0, v0, p3}, Lorg/apache/cordova/camera/CameraLauncher;->processResultFromCamera(ILandroid/content/Intent;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 817
    :cond_5
    if-nez p2, :cond_6

    .line 818
    const-string v6, "No Image Selected"

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 823
    :cond_6
    const-string v6, "Did not complete!"

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0

    .line 827
    :cond_7
    if-eqz v4, :cond_8

    const/4 v6, 0x2

    if-ne v4, v6, :cond_0

    .line 828
    :cond_8
    if-ne p2, v7, :cond_9

    if-eqz p3, :cond_9

    .line 829
    move-object v3, p3

    .line 830
    .local v3, "i":Landroid/content/Intent;
    move v2, v0

    .line 831
    .local v2, "finalDestType":I
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v6

    new-instance v7, Lorg/apache/cordova/camera/CameraLauncher$1;

    invoke-direct {v7, p0, v2, v3}, Lorg/apache/cordova/camera/CameraLauncher$1;-><init>(Lorg/apache/cordova/camera/CameraLauncher;ILandroid/content/Intent;)V

    invoke-interface {v6, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 836
    .end local v2    # "finalDestType":I
    .end local v3    # "i":Landroid/content/Intent;
    :cond_9
    if-nez p2, :cond_a

    .line 837
    const-string v6, "No Image Selected"

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 839
    :cond_a
    const-string v6, "Selection did not complete!"

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public onMediaScannerConnected()V
    .locals 4

    .prologue
    .line 1300
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    iget-object v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->scanMe:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "image/*"

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1305
    :goto_0
    return-void

    .line 1301
    :catch_0
    move-exception v0

    .line 1302
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v1, "CameraLauncher"

    const-string v2, "Can\'t scan file in MediaScanner after taking picture"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1314
    array-length v2, p3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_1

    aget v0, p3, v1

    .line 1315
    .local v0, "r":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 1316
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const/16 v4, 0x14

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1328
    .end local v0    # "r":I
    :goto_1
    return-void

    .line 1314
    .restart local v0    # "r":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1320
    .end local v0    # "r":I
    :cond_1
    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 1322
    :pswitch_0
    iget v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v1, v2}, Lorg/apache/cordova/camera/CameraLauncher;->takePicture(II)V

    goto :goto_1

    .line 1325
    :pswitch_1
    iget v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    iget v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v1, v2, v3}, Lorg/apache/cordova/camera/CameraLauncher;->getImage(III)V

    goto :goto_1

    .line 1320
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onRestoreStateForActivityResult(Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Bundle;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 1361
    const-string v0, "destType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    .line 1362
    const-string v0, "srcType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    .line 1363
    const-string v0, "mQuality"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    .line 1364
    const-string v0, "targetWidth"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    .line 1365
    const-string v0, "targetHeight"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    .line 1366
    const-string v0, "encodingType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    .line 1367
    const-string v0, "mediaType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    .line 1368
    const-string v0, "numPics"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->numPics:I

    .line 1369
    const-string v0, "allowEdit"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    .line 1370
    const-string v0, "correctOrientation"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    .line 1371
    const-string v0, "saveToPhotoAlbum"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    .line 1373
    const-string v0, "croppedUri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1374
    const-string v0, "croppedUri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    .line 1377
    :cond_0
    const-string v0, "imageUri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1379
    new-instance v0, Lorg/apache/cordova/camera/CordovaUri;

    const-string v1, "imageUri"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/cordova/camera/CordovaUri;-><init>(Landroid/net/Uri;)V

    iput-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Lorg/apache/cordova/camera/CordovaUri;

    .line 1382
    :cond_1
    iput-object p2, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 1383
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .locals 3

    .prologue
    .line 1336
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1337
    .local v0, "state":Landroid/os/Bundle;
    const-string v1, "destType"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->destType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1338
    const-string v1, "srcType"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->srcType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1339
    const-string v1, "mQuality"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1340
    const-string v1, "targetWidth"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetWidth:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1341
    const-string v1, "targetHeight"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->targetHeight:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1342
    const-string v1, "encodingType"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->encodingType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1343
    const-string v1, "mediaType"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->mediaType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1344
    const-string v1, "numPics"

    iget v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->numPics:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1345
    const-string v1, "allowEdit"

    iget-boolean v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->allowEdit:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1346
    const-string v1, "correctOrientation"

    iget-boolean v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->correctOrientation:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1347
    const-string v1, "saveToPhotoAlbum"

    iget-boolean v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->saveToPhotoAlbum:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1349
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    if-eqz v1, :cond_0

    .line 1350
    const-string v1, "croppedUri"

    iget-object v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->croppedUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1353
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Lorg/apache/cordova/camera/CordovaUri;

    if-eqz v1, :cond_1

    .line 1354
    const-string v1, "imageUri"

    iget-object v2, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Lorg/apache/cordova/camera/CordovaUri;

    invoke-virtual {v2}, Lorg/apache/cordova/camera/CordovaUri;->getFileUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1357
    :cond_1
    return-object v0
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1308
    iget-object v0, p0, Lorg/apache/cordova/camera/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 1309
    return-void
.end method

.method public processPicture(Landroid/graphics/Bitmap;I)V
    .locals 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "encodingType"    # I

    .prologue
    .line 1259
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1260
    .local v3, "jpeg_data":Ljava/io/ByteArrayOutputStream;
    if-nez p2, :cond_1

    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 1265
    .local v1, "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :goto_0
    :try_start_0
    iget v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->mQuality:I

    invoke-virtual {p1, v1, v6, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1266
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 1267
    .local v0, "code":[B
    const/4 v6, 0x2

    invoke-static {v0, v6}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v5

    .line 1268
    .local v5, "output":[B
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    .line 1269
    .local v4, "js_out":Ljava/lang/String;
    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v6, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1270
    const/4 v4, 0x0

    .line 1271
    const/4 v5, 0x0

    .line 1277
    .end local v0    # "code":[B
    .end local v4    # "js_out":Ljava/lang/String;
    .end local v5    # "output":[B
    :cond_0
    :goto_1
    const/4 v3, 0x0

    .line 1278
    return-void

    .line 1260
    .end local v1    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :cond_1
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_0

    .line 1274
    .restart local v1    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :catch_0
    move-exception v2

    .line 1275
    .local v2, "e":Ljava/lang/Exception;
    const-string v6, "Error compressing image."

    invoke-virtual {p0, v6}, Lorg/apache/cordova/camera/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public takePicture(II)V
    .locals 7
    .param p1, "returnType"    # I
    .param p2, "encodingType"    # I

    .prologue
    .line 290
    invoke-direct {p0}, Lorg/apache/cordova/camera/CameraLauncher;->whichContentStore()Landroid/net/Uri;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/cordova/camera/CameraLauncher;->queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v3

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v3

    iput v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->numPics:I

    .line 293
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 296
    .local v0, "intent":Landroid/content/Intent;
    invoke-direct {p0, p2}, Lorg/apache/cordova/camera/CameraLauncher;->createCaptureFile(I)Ljava/io/File;

    move-result-object v2

    .line 297
    .local v2, "photo":Ljava/io/File;
    new-instance v3, Lorg/apache/cordova/camera/CordovaUri;

    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/apache/cordova/camera/CameraLauncher;->applicationId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".provider"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v2}, Landroid/support/v4/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/cordova/camera/CordovaUri;-><init>(Landroid/net/Uri;)V

    iput-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Lorg/apache/cordova/camera/CordovaUri;

    .line 300
    const-string v3, "output"

    iget-object v4, p0, Lorg/apache/cordova/camera/CameraLauncher;->imageUri:Lorg/apache/cordova/camera/CordovaUri;

    invoke-virtual {v4}, Lorg/apache/cordova/camera/CordovaUri;->getCorrectUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 302
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 304
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    if-eqz v3, :cond_0

    .line 306
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 307
    .local v1, "mPm":Landroid/content/pm/PackageManager;
    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 310
    iget-object v3, p0, Lorg/apache/cordova/camera/CameraLauncher;->cordova:Lorg/apache/cordova/CordovaInterface;

    add-int/lit8 v4, p1, 0x20

    add-int/lit8 v4, v4, 0x1

    invoke-interface {v3, p0, v0, v4}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    .line 319
    .end local v1    # "mPm":Landroid/content/pm/PackageManager;
    :cond_0
    :goto_0
    return-void

    .line 314
    .restart local v1    # "mPm":Landroid/content/pm/PackageManager;
    :cond_1
    const-string v3, "CameraLauncher"

    const-string v4, "Error: You don\'t have a default camera.  Your device may not be CTS complaint."

    invoke-static {v3, v4}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

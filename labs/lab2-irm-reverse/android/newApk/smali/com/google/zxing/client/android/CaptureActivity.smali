.class public final Lcom/google/zxing/client/android/CaptureActivity;
.super Landroid/app/Activity;
.source "CaptureActivity.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field private static final BULK_MODE_SCAN_DELAY_MS:J = 0x3e8L

.field private static final DEFAULT_INTENT_RESULT_DURATION_MS:J = 0x5dcL

.field private static final DISPLAYABLE_METADATA_TYPES:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/google/zxing/ResultMetadataType;",
            ">;"
        }
    .end annotation
.end field

.field private static final HISTORY_REQUEST_CODE:I = 0xbacc

.field private static final TAG:Ljava/lang/String;

.field private static final ZXING_URLS:[Ljava/lang/String;


# instance fields
.field private ambientLightManager:Lcom/google/zxing/client/android/AmbientLightManager;

.field private beepManager:Lcom/google/zxing/client/android/BeepManager;

.field private beepOnScan:Z

.field private cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

.field private characterSet:Ljava/lang/String;

.field private copyToClipboard:Z

.field private decodeFormats:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;"
        }
    .end annotation
.end field

.field private decodeHints:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;"
        }
    .end annotation
.end field

.field private flipButton:Landroid/widget/Button;

.field private handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

.field private hasSurface:Z

.field private historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

.field private inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

.field private lastResult:Lcom/google/zxing/Result;

.field private resultView:Landroid/view/View;

.field private savedResultToShow:Lcom/google/zxing/Result;

.field private scanFromWebPageManager:Lcom/google/zxing/client/android/ScanFromWebPageManager;

.field private source:Lcom/google/zxing/client/android/IntentSource;

.field private sourceUrl:Ljava/lang/String;

.field private statusView:Landroid/widget/TextView;

.field stopReceiver:Landroid/content/BroadcastReceiver;

.field private torchButton:Landroid/widget/Button;

.field private viewfinderView:Lcom/google/zxing/client/android/ViewfinderView;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 93
    const-class v0, Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/CaptureActivity;->TAG:Ljava/lang/String;

    .line 98
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "http://zxing.appspot.com/scan"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "zxing://scan/"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/zxing/client/android/CaptureActivity;->ZXING_URLS:[Ljava/lang/String;

    .line 102
    sget-object v0, Lcom/google/zxing/ResultMetadataType;->ISSUE_NUMBER:Lcom/google/zxing/ResultMetadataType;

    sget-object v1, Lcom/google/zxing/ResultMetadataType;->SUGGESTED_PRICE:Lcom/google/zxing/ResultMetadataType;

    sget-object v2, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    sget-object v3, Lcom/google/zxing/ResultMetadataType;->POSSIBLE_COUNTRY:Lcom/google/zxing/ResultMetadataType;

    .line 103
    invoke-static {v0, v1, v2, v3}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/CaptureActivity;->DISPLAYABLE_METADATA_TYPES:Ljava/util/Collection;

    .line 102
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 91
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/google/zxing/client/android/CaptureActivity;)Lcom/google/zxing/client/android/camera/CameraManager;
    .locals 1
    .param p0, "x0"    # Lcom/google/zxing/client/android/CaptureActivity;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    return-object v0
.end method

.method private decodeOrStoreSavedBitmap(Landroid/graphics/Bitmap;Lcom/google/zxing/Result;)V
    .locals 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "result"    # Lcom/google/zxing/Result;

    .prologue
    .line 443
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    if-nez v1, :cond_0

    .line 444
    iput-object p2, p0, Lcom/google/zxing/client/android/CaptureActivity;->savedResultToShow:Lcom/google/zxing/Result;

    .line 455
    :goto_0
    return-void

    .line 446
    :cond_0
    if-eqz p2, :cond_1

    .line 447
    iput-object p2, p0, Lcom/google/zxing/client/android/CaptureActivity;->savedResultToShow:Lcom/google/zxing/Result;

    .line 449
    :cond_1
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->savedResultToShow:Lcom/google/zxing/Result;

    if-eqz v1, :cond_2

    .line 450
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->decode_succeeded:I

    iget-object v3, p0, Lcom/google/zxing/client/android/CaptureActivity;->savedResultToShow:Lcom/google/zxing/Result;

    invoke-static {v1, v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 451
    .local v0, "message":Landroid/os/Message;
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    invoke-virtual {v1, v0}, Lcom/google/zxing/client/android/CaptureActivityHandler;->sendMessage(Landroid/os/Message;)Z

    .line 453
    .end local v0    # "message":Landroid/os/Message;
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->savedResultToShow:Lcom/google/zxing/Result;

    goto :goto_0
.end method

.method private displayFrameworkBugMessageAndExit()V
    .locals 3

    .prologue
    .line 800
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 801
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->app_name:I

    invoke-virtual {p0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 802
    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_camera_framework_bug:I

    invoke-virtual {p0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 803
    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_ok:I

    new-instance v2, Lcom/google/zxing/client/android/FinishListener;

    invoke-direct {v2, p0}, Lcom/google/zxing/client/android/FinishListener;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 804
    new-instance v1, Lcom/google/zxing/client/android/FinishListener;

    invoke-direct {v1, p0}, Lcom/google/zxing/client/android/FinishListener;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 805
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 806
    return-void
.end method

.method private static drawLine(Landroid/graphics/Canvas;Landroid/graphics/Paint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;F)V
    .locals 6
    .param p0, "canvas"    # Landroid/graphics/Canvas;
    .param p1, "paint"    # Landroid/graphics/Paint;
    .param p2, "a"    # Lcom/google/zxing/ResultPoint;
    .param p3, "b"    # Lcom/google/zxing/ResultPoint;
    .param p4, "scaleFactor"    # F

    .prologue
    .line 571
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 572
    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    mul-float v1, p4, v0

    .line 573
    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    mul-float v2, p4, v0

    .line 574
    invoke-virtual {p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    mul-float v3, p4, v0

    .line 575
    invoke-virtual {p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    mul-float v4, p4, v0

    move-object v0, p0

    move-object v5, p1

    .line 572
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 578
    :cond_0
    return-void
.end method

.method private drawResultPoints(Landroid/graphics/Bitmap;FLcom/google/zxing/Result;)V
    .locals 9
    .param p1, "barcode"    # Landroid/graphics/Bitmap;
    .param p2, "scaleFactor"    # F
    .param p3, "rawResult"    # Lcom/google/zxing/Result;

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v4, 0x0

    .line 545
    invoke-virtual {p3}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v3

    .line 546
    .local v3, "points":[Lcom/google/zxing/ResultPoint;
    if-eqz v3, :cond_0

    array-length v5, v3

    if-lez v5, :cond_0

    .line 547
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 548
    .local v0, "canvas":Landroid/graphics/Canvas;
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 549
    .local v1, "paint":Landroid/graphics/Paint;
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lbarcodescanner/xservices/nl/barcodescanner/R$color;->result_points:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 550
    array-length v5, v3

    if-ne v5, v8, :cond_1

    .line 551
    const/high16 v5, 0x40800000    # 4.0f

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 552
    aget-object v4, v3, v4

    aget-object v5, v3, v7

    invoke-static {v0, v1, v4, v5, p2}, Lcom/google/zxing/client/android/CaptureActivity;->drawLine(Landroid/graphics/Canvas;Landroid/graphics/Paint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;F)V

    .line 568
    .end local v0    # "canvas":Landroid/graphics/Canvas;
    .end local v1    # "paint":Landroid/graphics/Paint;
    :cond_0
    :goto_0
    return-void

    .line 553
    .restart local v0    # "canvas":Landroid/graphics/Canvas;
    .restart local v1    # "paint":Landroid/graphics/Paint;
    :cond_1
    array-length v5, v3

    const/4 v6, 0x4

    if-ne v5, v6, :cond_3

    .line 554
    invoke-virtual {p3}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v5

    sget-object v6, Lcom/google/zxing/BarcodeFormat;->UPC_A:Lcom/google/zxing/BarcodeFormat;

    if-eq v5, v6, :cond_2

    .line 555
    invoke-virtual {p3}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v5

    sget-object v6, Lcom/google/zxing/BarcodeFormat;->EAN_13:Lcom/google/zxing/BarcodeFormat;

    if-ne v5, v6, :cond_3

    .line 557
    :cond_2
    aget-object v4, v3, v4

    aget-object v5, v3, v7

    invoke-static {v0, v1, v4, v5, p2}, Lcom/google/zxing/client/android/CaptureActivity;->drawLine(Landroid/graphics/Canvas;Landroid/graphics/Paint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;F)V

    .line 558
    aget-object v4, v3, v8

    const/4 v5, 0x3

    aget-object v5, v3, v5

    invoke-static {v0, v1, v4, v5, p2}, Lcom/google/zxing/client/android/CaptureActivity;->drawLine(Landroid/graphics/Canvas;Landroid/graphics/Paint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;F)V

    goto :goto_0

    .line 560
    :cond_3
    const/high16 v5, 0x41200000    # 10.0f

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 561
    array-length v5, v3

    :goto_1
    if-ge v4, v5, :cond_0

    aget-object v2, v3, v4

    .line 562
    .local v2, "point":Lcom/google/zxing/ResultPoint;
    if-eqz v2, :cond_4

    .line 563
    invoke-virtual {v2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    mul-float/2addr v6, p2

    invoke-virtual {v2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    mul-float/2addr v7, p2

    invoke-virtual {v0, v6, v7, v1}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    .line 561
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method private getCurrentOrientation()I
    .locals 3

    .prologue
    .line 315
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v0

    .line 316
    .local v0, "rotation":I
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 317
    packed-switch v0, :pswitch_data_0

    .line 322
    const/16 v1, 0x8

    .line 330
    :goto_0
    return v1

    .line 320
    :pswitch_0
    const/4 v1, 0x0

    goto :goto_0

    .line 325
    :cond_0
    packed-switch v0, :pswitch_data_1

    .line 330
    :pswitch_1
    const/16 v1, 0x9

    goto :goto_0

    .line 328
    :pswitch_2
    const/4 v1, 0x1

    goto :goto_0

    .line 317
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 325
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private handleDecodeExternally(Lcom/google/zxing/Result;Lcom/google/zxing/client/android/result/ResultHandler;Landroid/graphics/Bitmap;)V
    .locals 25
    .param p1, "rawResult"    # Lcom/google/zxing/Result;
    .param p2, "resultHandler"    # Lcom/google/zxing/client/android/result/ResultHandler;
    .param p3, "barcode"    # Landroid/graphics/Bitmap;

    .prologue
    .line 674
    if-eqz p3, :cond_0

    .line 675
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->viewfinderView:Lcom/google/zxing/client/android/ViewfinderView;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/ViewfinderView;->drawResultBitmap(Landroid/graphics/Bitmap;)V

    .line 678
    :cond_0
    const-wide/16 v20, 0x5dc

    .line 679
    .local v20, "resultDurationMS":J
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v22

    if-eqz v22, :cond_1

    .line 680
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v22

    const-string v23, "RESULT_DISPLAY_DURATION_MS"

    invoke-virtual/range {v22 .. v23}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_1

    .line 681
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v22

    const-string v23, "RESULT_DISPLAY_DURATION_MS"

    invoke-virtual/range {v22 .. v23}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 682
    .local v8, "durationStr":Ljava/lang/String;
    if-eqz v8, :cond_1

    .line 684
    :try_start_0
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v20

    .line 692
    .end local v8    # "durationStr":Ljava/lang/String;
    :cond_1
    :goto_0
    const-wide/16 v22, 0x0

    cmp-long v22, v20, v22

    if-lez v22, :cond_3

    .line 693
    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    .line 694
    .local v17, "rawResultString":Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v22

    const/16 v23, 0x20

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_2

    .line 695
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v23, 0x0

    const/16 v24, 0x20

    move-object/from16 v0, v17

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " ..."

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 697
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->statusView:Landroid/widget/TextView;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getDisplayTitle()I

    move-result v24

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->getString(I)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " : "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 700
    .end local v17    # "rawResultString":Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->copyToClipboard:Z

    move/from16 v22, v0

    if-eqz v22, :cond_4

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->areContentsSecure()Z

    move-result v22

    if-nez v22, :cond_4

    .line 701
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getDisplayContents()Ljava/lang/CharSequence;

    move-result-object v19

    .line 702
    .local v19, "text":Ljava/lang/CharSequence;
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lcom/google/zxing/client/android/clipboard/ClipboardInterface;->setText(Ljava/lang/CharSequence;Landroid/content/Context;)V

    .line 705
    .end local v19    # "text":Ljava/lang/CharSequence;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    move-object/from16 v22, v0

    sget-object v23, Lcom/google/zxing/client/android/IntentSource;->NATIVE_APP_INTENT:Lcom/google/zxing/client/android/IntentSource;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_b

    .line 709
    new-instance v13, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-direct {v13, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 710
    .local v13, "intent":Landroid/content/Intent;
    const/high16 v22, 0x80000

    move/from16 v0, v22

    invoke-virtual {v13, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 711
    const-string v22, "SCAN_RESULT"

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/Result;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 712
    const-string v22, "SCAN_RESULT_FORMAT"

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/google/zxing/BarcodeFormat;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 713
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v16

    .line 714
    .local v16, "rawBytes":[B
    if-eqz v16, :cond_5

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v22, v0

    if-lez v22, :cond_5

    .line 715
    const-string v22, "SCAN_RESULT_BYTES"

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 717
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v14

    .line 718
    .local v14, "metadata":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;*>;"
    if-eqz v14, :cond_9

    .line 719
    sget-object v22, Lcom/google/zxing/ResultMetadataType;->UPC_EAN_EXTENSION:Lcom/google/zxing/ResultMetadataType;

    move-object/from16 v0, v22

    invoke-interface {v14, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_6

    .line 720
    const-string v22, "SCAN_RESULT_UPC_EAN_EXTENSION"

    sget-object v23, Lcom/google/zxing/ResultMetadataType;->UPC_EAN_EXTENSION:Lcom/google/zxing/ResultMetadataType;

    .line 721
    move-object/from16 v0, v23

    invoke-interface {v14, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v23

    .line 720
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 723
    :cond_6
    sget-object v22, Lcom/google/zxing/ResultMetadataType;->ORIENTATION:Lcom/google/zxing/ResultMetadataType;

    move-object/from16 v0, v22

    invoke-interface {v14, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Number;

    .line 724
    .local v15, "orientation":Ljava/lang/Number;
    if-eqz v15, :cond_7

    .line 725
    const-string v22, "SCAN_RESULT_ORIENTATION"

    invoke-virtual {v15}, Ljava/lang/Number;->intValue()I

    move-result v23

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 727
    :cond_7
    sget-object v22, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    move-object/from16 v0, v22

    invoke-interface {v14, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 728
    .local v10, "ecLevel":Ljava/lang/String;
    if-eqz v10, :cond_8

    .line 729
    const-string v22, "SCAN_RESULT_ERROR_CORRECTION_LEVEL"

    move-object/from16 v0, v22

    invoke-virtual {v13, v0, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 732
    :cond_8
    sget-object v22, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    move-object/from16 v0, v22

    invoke-interface {v14, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    .line 733
    .local v7, "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    if-eqz v7, :cond_9

    .line 734
    const/4 v12, 0x0

    .line 735
    .local v12, "i":I
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :goto_1
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_9

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    .line 736
    .local v6, "byteSegment":[B
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "SCAN_RESULT_BYTE_SEGMENTS_"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v13, v0, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 737
    add-int/lit8 v12, v12, 0x1

    .line 738
    goto :goto_1

    .line 685
    .end local v6    # "byteSegment":[B
    .end local v7    # "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    .end local v10    # "ecLevel":Ljava/lang/String;
    .end local v12    # "i":I
    .end local v13    # "intent":Landroid/content/Intent;
    .end local v14    # "metadata":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;*>;"
    .end local v15    # "orientation":Ljava/lang/Number;
    .end local v16    # "rawBytes":[B
    .restart local v8    # "durationStr":Ljava/lang/String;
    :catch_0
    move-exception v9

    .line 686
    .local v9, "e":Ljava/lang/NumberFormatException;
    sget-object v22, Lcom/google/zxing/client/android/CaptureActivity;->TAG:Ljava/lang/String;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Could not parse "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " to Long"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-static {v0, v1, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 741
    .end local v8    # "durationStr":Ljava/lang/String;
    .end local v9    # "e":Ljava/lang/NumberFormatException;
    .restart local v13    # "intent":Landroid/content/Intent;
    .restart local v14    # "metadata":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;*>;"
    .restart local v16    # "rawBytes":[B
    :cond_9
    sget v22, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->return_scan_result:I

    move-object/from16 v0, p0

    move/from16 v1, v22

    move-wide/from16 v2, v20

    invoke-direct {v0, v1, v13, v2, v3}, Lcom/google/zxing/client/android/CaptureActivity;->sendReplyMessage(ILjava/lang/Object;J)V

    .line 760
    .end local v13    # "intent":Landroid/content/Intent;
    .end local v14    # "metadata":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;*>;"
    .end local v16    # "rawBytes":[B
    :cond_a
    :goto_2
    return-void

    .line 743
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    move-object/from16 v22, v0

    sget-object v23, Lcom/google/zxing/client/android/IntentSource;->PRODUCT_SEARCH_LINK:Lcom/google/zxing/client/android/IntentSource;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_c

    .line 747
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->sourceUrl:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string v23, "/scan"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v11

    .line 748
    .local v11, "end":I
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->sourceUrl:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v0, v1, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "?q="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getDisplayContents()Ljava/lang/CharSequence;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "&source=zxing"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 749
    .local v18, "replyURL":Ljava/lang/String;
    sget v22, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->launch_product_query:I

    move-object/from16 v0, p0

    move/from16 v1, v22

    move-object/from16 v2, v18

    move-wide/from16 v3, v20

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/zxing/client/android/CaptureActivity;->sendReplyMessage(ILjava/lang/Object;J)V

    goto :goto_2

    .line 751
    .end local v11    # "end":I
    .end local v18    # "replyURL":Ljava/lang/String;
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    move-object/from16 v22, v0

    sget-object v23, Lcom/google/zxing/client/android/IntentSource;->ZXING_LINK:Lcom/google/zxing/client/android/IntentSource;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_a

    .line 753
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->scanFromWebPageManager:Lcom/google/zxing/client/android/ScanFromWebPageManager;

    move-object/from16 v22, v0

    if-eqz v22, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->scanFromWebPageManager:Lcom/google/zxing/client/android/ScanFromWebPageManager;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/google/zxing/client/android/ScanFromWebPageManager;->isScanFromWebPage()Z

    move-result v22

    if-eqz v22, :cond_a

    .line 754
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->scanFromWebPageManager:Lcom/google/zxing/client/android/ScanFromWebPageManager;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/google/zxing/client/android/ScanFromWebPageManager;->buildReplyURL(Lcom/google/zxing/Result;Lcom/google/zxing/client/android/result/ResultHandler;)Ljava/lang/String;

    move-result-object v18

    .line 755
    .restart local v18    # "replyURL":Ljava/lang/String;
    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/zxing/client/android/CaptureActivity;->scanFromWebPageManager:Lcom/google/zxing/client/android/ScanFromWebPageManager;

    .line 756
    sget v22, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->launch_product_query:I

    move-object/from16 v0, p0

    move/from16 v1, v22

    move-object/from16 v2, v18

    move-wide/from16 v3, v20

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/zxing/client/android/CaptureActivity;->sendReplyMessage(ILjava/lang/Object;J)V

    goto/16 :goto_2
.end method

.method private handleDecodeInternally(Lcom/google/zxing/Result;Lcom/google/zxing/client/android/result/ResultHandler;Landroid/graphics/Bitmap;)V
    .locals 26
    .param p1, "rawResult"    # Lcom/google/zxing/Result;
    .param p2, "resultHandler"    # Lcom/google/zxing/client/android/result/ResultHandler;
    .param p3, "barcode"    # Landroid/graphics/Bitmap;

    .prologue
    .line 583
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getDisplayContents()Ljava/lang/CharSequence;

    move-result-object v9

    .line 585
    .local v9, "displayContents":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->copyToClipboard:Z

    move/from16 v23, v0

    if-eqz v23, :cond_0

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->areContentsSecure()Z

    move-result v23

    if-nez v23, :cond_0

    .line 586
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/google/zxing/client/android/clipboard/ClipboardInterface;->setText(Ljava/lang/CharSequence;Landroid/content/Context;)V

    .line 589
    :cond_0
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 591
    .local v17, "prefs":Landroid/content/SharedPreferences;
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getDefaultButtonID()Ljava/lang/Integer;

    move-result-object v23

    if-eqz v23, :cond_2

    const-string v23, "preferences_auto_open_web"

    const/16 v24, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v23

    if-eqz v23, :cond_2

    .line 592
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getDefaultButtonID()Ljava/lang/Integer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Integer;->intValue()I

    move-result v23

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/result/ResultHandler;->handleButtonPress(I)V

    .line 669
    :cond_1
    return-void

    .line 596
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->statusView:Landroid/widget/TextView;

    move-object/from16 v23, v0

    const/16 v24, 0x8

    invoke-virtual/range {v23 .. v24}, Landroid/widget/TextView;->setVisibility(I)V

    .line 597
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->viewfinderView:Lcom/google/zxing/client/android/ViewfinderView;

    move-object/from16 v23, v0

    const/16 v24, 0x8

    invoke-virtual/range {v23 .. v24}, Lcom/google/zxing/client/android/ViewfinderView;->setVisibility(I)V

    .line 598
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->resultView:Landroid/view/View;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual/range {v23 .. v24}, Landroid/view/View;->setVisibility(I)V

    .line 600
    sget v23, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->barcode_image_view:I

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 601
    .local v4, "barcodeImageView":Landroid/widget/ImageView;
    if-nez p3, :cond_4

    .line 602
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/client/android/CaptureActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    sget v24, Lbarcodescanner/xservices/nl/barcodescanner/R$drawable;->launcher_icon:I

    invoke-static/range {v23 .. v24}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 608
    :goto_0
    sget v23, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->format_text_view:I

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 609
    .local v11, "formatTextView":Landroid/widget/TextView;
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/google/zxing/BarcodeFormat;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 611
    sget v23, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->type_text_view:I

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/TextView;

    .line 612
    .local v21, "typeTextView":Landroid/widget/TextView;
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getType()Lcom/google/zxing/client/result/ParsedResultType;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/google/zxing/client/result/ParsedResultType;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 614
    const/16 v23, 0x3

    const/16 v24, 0x3

    invoke-static/range {v23 .. v24}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v12

    .line 615
    .local v12, "formatter":Ljava/text/DateFormat;
    sget v23, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->time_text_view:I

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/TextView;

    .line 616
    .local v20, "timeTextView":Landroid/widget/TextView;
    new-instance v23, Ljava/util/Date;

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/Result;->getTimestamp()J

    move-result-wide v24

    invoke-direct/range {v23 .. v25}, Ljava/util/Date;-><init>(J)V

    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 619
    sget v23, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->meta_text_view:I

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    .line 620
    .local v13, "metaTextView":Landroid/widget/TextView;
    sget v23, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->meta_text_view_label:I

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v14

    .line 621
    .local v14, "metaTextViewLabel":Landroid/view/View;
    const/16 v23, 0x8

    move/from16 v0, v23

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 622
    const/16 v23, 0x8

    move/from16 v0, v23

    invoke-virtual {v14, v0}, Landroid/view/View;->setVisibility(I)V

    .line 623
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v15

    .line 624
    .local v15, "metadata":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;>;"
    if-eqz v15, :cond_6

    .line 625
    new-instance v16, Ljava/lang/StringBuilder;

    const/16 v23, 0x14

    move-object/from16 v0, v16

    move/from16 v1, v23

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 626
    .local v16, "metadataText":Ljava/lang/StringBuilder;
    invoke-interface {v15}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_3
    :goto_1
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_5

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 627
    .local v10, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;>;"
    sget-object v24, Lcom/google/zxing/client/android/CaptureActivity;->DISPLAYABLE_METADATA_TYPES:Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v25

    invoke-interface/range {v24 .. v25}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_3

    .line 628
    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const/16 v25, 0xa

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 605
    .end local v10    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;>;"
    .end local v11    # "formatTextView":Landroid/widget/TextView;
    .end local v12    # "formatter":Ljava/text/DateFormat;
    .end local v13    # "metaTextView":Landroid/widget/TextView;
    .end local v14    # "metaTextViewLabel":Landroid/view/View;
    .end local v15    # "metadata":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;>;"
    .end local v16    # "metadataText":Ljava/lang/StringBuilder;
    .end local v20    # "timeTextView":Landroid/widget/TextView;
    .end local v21    # "typeTextView":Landroid/widget/TextView;
    :cond_4
    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 631
    .restart local v11    # "formatTextView":Landroid/widget/TextView;
    .restart local v12    # "formatter":Ljava/text/DateFormat;
    .restart local v13    # "metaTextView":Landroid/widget/TextView;
    .restart local v14    # "metaTextViewLabel":Landroid/view/View;
    .restart local v15    # "metadata":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;>;"
    .restart local v16    # "metadataText":Ljava/lang/StringBuilder;
    .restart local v20    # "timeTextView":Landroid/widget/TextView;
    .restart local v21    # "typeTextView":Landroid/widget/TextView;
    :cond_5
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->length()I

    move-result v23

    if-lez v23, :cond_6

    .line 632
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->length()I

    move-result v23

    add-int/lit8 v23, v23, -0x1

    move-object/from16 v0, v16

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 633
    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 634
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 635
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v14, v0}, Landroid/view/View;->setVisibility(I)V

    .line 639
    .end local v16    # "metadataText":Ljava/lang/StringBuilder;
    :cond_6
    sget v23, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->contents_text_view:I

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 640
    .local v8, "contentsTextView":Landroid/widget/TextView;
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 641
    const/16 v23, 0x16

    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    move-result v24

    div-int/lit8 v24, v24, 0x4

    rsub-int/lit8 v24, v24, 0x20

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->max(II)I

    move-result v18

    .line 642
    .local v18, "scaledSize":I
    const/16 v23, 0x2

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v8, v0, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 644
    sget v23, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->contents_supplement_text_view:I

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v19

    check-cast v19, Landroid/widget/TextView;

    .line 645
    .local v19, "supplementTextView":Landroid/widget/TextView;
    const-string v23, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 646
    const/16 v23, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 647
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v23

    const-string v24, "preferences_supplemental"

    const/16 v25, 0x1

    invoke-interface/range {v23 .. v25}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v23

    if-eqz v23, :cond_7

    .line 650
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/CaptureActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    move-object/from16 v24, v0

    .line 649
    move-object/from16 v0, v19

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, p0

    invoke-static {v0, v1, v2, v3}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->maybeInvokeRetrieval(Landroid/widget/TextView;Lcom/google/zxing/client/result/ParsedResult;Lcom/google/zxing/client/android/history/HistoryManager;Landroid/content/Context;)V

    .line 655
    :cond_7
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getButtonCount()I

    move-result v6

    .line 656
    .local v6, "buttonCount":I
    sget v23, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->result_button_view:I

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup;

    .line 657
    .local v7, "buttonView":Landroid/view/ViewGroup;
    invoke-virtual {v7}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 658
    const/16 v22, 0x0

    .local v22, "x":I
    :goto_2
    const/16 v23, 0x4

    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_1

    .line 659
    move/from16 v0, v22

    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 660
    .local v5, "button":Landroid/widget/TextView;
    move/from16 v0, v22

    if-ge v0, v6, :cond_8

    .line 661
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 662
    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/result/ResultHandler;->getButtonText(I)I

    move-result v23

    move/from16 v0, v23

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(I)V

    .line 663
    new-instance v23, Lcom/google/zxing/client/android/result/ResultButtonListener;

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/client/android/result/ResultButtonListener;-><init>(Lcom/google/zxing/client/android/result/ResultHandler;I)V

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 658
    :goto_3
    add-int/lit8 v22, v22, 0x1

    goto :goto_2

    .line 665
    :cond_8
    const/16 v23, 0x8

    move/from16 v0, v23

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3
.end method

.method private initCamera(Landroid/view/SurfaceHolder;)V
    .locals 8
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 774
    if-nez p1, :cond_0

    .line 775
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No SurfaceHolder provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 777
    :cond_0
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/CameraManager;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 778
    sget-object v0, Lcom/google/zxing/client/android/CaptureActivity;->TAG:Ljava/lang/String;

    const-string v1, "initCamera() while already open -- late SurfaceView callback?"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 797
    :goto_0
    return-void

    .line 782
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {v0, p1}, Lcom/google/zxing/client/android/camera/CameraManager;->openDriver(Landroid/view/SurfaceHolder;)V

    .line 784
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    if-nez v0, :cond_2

    .line 785
    new-instance v0, Lcom/google/zxing/client/android/CaptureActivityHandler;

    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->decodeFormats:Ljava/util/Collection;

    iget-object v3, p0, Lcom/google/zxing/client/android/CaptureActivity;->decodeHints:Ljava/util/Map;

    iget-object v4, p0, Lcom/google/zxing/client/android/CaptureActivity;->characterSet:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/client/android/CaptureActivityHandler;-><init>(Lcom/google/zxing/client/android/CaptureActivity;Ljava/util/Collection;Ljava/util/Map;Ljava/lang/String;Lcom/google/zxing/client/android/camera/CameraManager;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    .line 787
    :cond_2
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->decodeOrStoreSavedBitmap(Landroid/graphics/Bitmap;Lcom/google/zxing/Result;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 788
    :catch_0
    move-exception v7

    .line 789
    .local v7, "ioe":Ljava/io/IOException;
    sget-object v0, Lcom/google/zxing/client/android/CaptureActivity;->TAG:Ljava/lang/String;

    invoke-static {v0, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 790
    invoke-direct {p0}, Lcom/google/zxing/client/android/CaptureActivity;->displayFrameworkBugMessageAndExit()V

    goto :goto_0

    .line 791
    .end local v7    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v6

    .line 794
    .local v6, "e":Ljava/lang/RuntimeException;
    sget-object v0, Lcom/google/zxing/client/android/CaptureActivity;->TAG:Ljava/lang/String;

    const-string v1, "Unexpected error initializing camera"

    invoke-static {v0, v1, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 795
    invoke-direct {p0}, Lcom/google/zxing/client/android/CaptureActivity;->displayFrameworkBugMessageAndExit()V

    goto :goto_0
.end method

.method private static isZXingURL(Ljava/lang/String;)Z
    .locals 6
    .param p0, "dataString"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 336
    if-nez p0, :cond_1

    .line 344
    :cond_0
    :goto_0
    return v1

    .line 339
    :cond_1
    sget-object v3, Lcom/google/zxing/client/android/CaptureActivity;->ZXING_URLS:[Ljava/lang/String;

    array-length v4, v3

    move v2, v1

    :goto_1
    if-ge v2, v4, :cond_0

    aget-object v0, v3, v2

    .line 340
    .local v0, "url":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 341
    const/4 v1, 0x1

    goto :goto_0

    .line 339
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private resetStatusView()V
    .locals 8

    .prologue
    const/4 v6, 0x1

    const/4 v3, 0x0

    .line 816
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->resultView:Landroid/view/View;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 817
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->statusView:Landroid/widget/TextView;

    sget v4, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_default_status:I

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 818
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->statusView:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 819
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->viewfinderView:Lcom/google/zxing/client/android/ViewfinderView;

    invoke-virtual {v2, v3}, Lcom/google/zxing/client/android/ViewfinderView;->setVisibility(I)V

    .line 820
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->lastResult:Lcom/google/zxing/Result;

    .line 823
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v4, "SHOW_FLIP_CAMERA_BUTTON"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 824
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v2

    if-le v2, v6, :cond_0

    .line 825
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->flipButton:Landroid/widget/Button;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 826
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->flipButton:Landroid/widget/Button;

    new-instance v4, Lcom/google/zxing/client/android/CaptureActivity$2;

    invoke-direct {v4, p0}, Lcom/google/zxing/client/android/CaptureActivity$2;-><init>(Lcom/google/zxing/client/android/CaptureActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 838
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v4, "SHOW_TORCH_BUTTON"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 840
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v4, "SCAN_CAMERA_ID"

    const/4 v5, -0x1

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 841
    .local v1, "reqCamId":I
    if-eq v1, v6, :cond_1

    .line 842
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/pm/PackageManager;->getSystemAvailableFeatures()[Landroid/content/pm/FeatureInfo;

    move-result-object v4

    array-length v5, v4

    move v2, v3

    :goto_0
    if-ge v2, v5, :cond_1

    aget-object v0, v4, v2

    .line 843
    .local v0, "feature":Landroid/content/pm/FeatureInfo;
    const-string v6, "android.hardware.camera.flash"

    iget-object v7, v0, Landroid/content/pm/FeatureInfo;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 844
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->torchButton:Landroid/widget/Button;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 845
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->torchButton:Landroid/widget/Button;

    new-instance v3, Lcom/google/zxing/client/android/CaptureActivity$3;

    invoke-direct {v3, p0}, Lcom/google/zxing/client/android/CaptureActivity$3;-><init>(Lcom/google/zxing/client/android/CaptureActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 856
    .end local v0    # "feature":Landroid/content/pm/FeatureInfo;
    .end local v1    # "reqCamId":I
    :cond_1
    return-void

    .line 842
    .restart local v0    # "feature":Landroid/content/pm/FeatureInfo;
    .restart local v1    # "reqCamId":I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private sendReplyMessage(ILjava/lang/Object;J)V
    .locals 5
    .param p1, "id"    # I
    .param p2, "arg"    # Ljava/lang/Object;
    .param p3, "delayMS"    # J

    .prologue
    .line 763
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    if-eqz v1, :cond_0

    .line 764
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    invoke-static {v1, p1, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 765
    .local v0, "message":Landroid/os/Message;
    const-wide/16 v2, 0x0

    cmp-long v1, p3, v2

    if-lez v1, :cond_1

    .line 766
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    invoke-virtual {v1, v0, p3, p4}, Lcom/google/zxing/client/android/CaptureActivityHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 771
    .end local v0    # "message":Landroid/os/Message;
    :cond_0
    :goto_0
    return-void

    .line 768
    .restart local v0    # "message":Landroid/os/Message;
    :cond_1
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    invoke-virtual {v1, v0}, Lcom/google/zxing/client/android/CaptureActivityHandler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method


# virtual methods
.method public drawViewfinder()V
    .locals 1

    .prologue
    .line 859
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->viewfinderView:Lcom/google/zxing/client/android/ViewfinderView;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/ViewfinderView;->drawViewfinder()V

    .line 860
    return-void
.end method

.method getCameraManager()Lcom/google/zxing/client/android/camera/CameraManager;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    return-object v0
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    return-object v0
.end method

.method getViewfinderView()Lcom/google/zxing/client/android/ViewfinderView;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->viewfinderView:Lcom/google/zxing/client/android/ViewfinderView;

    return-object v0
.end method

.method public handleDecode(Lcom/google/zxing/Result;Landroid/graphics/Bitmap;F)V
    .locals 12
    .param p1, "rawResult"    # Lcom/google/zxing/Result;
    .param p2, "barcode"    # Landroid/graphics/Bitmap;
    .param p3, "scaleFactor"    # F

    .prologue
    const-wide/16 v10, 0x3e8

    const/4 v4, 0x0

    .line 486
    iget-object v5, p0, Lcom/google/zxing/client/android/CaptureActivity;->inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

    invoke-virtual {v5}, Lcom/google/zxing/client/android/InactivityTimer;->onActivity()V

    .line 487
    iput-object p1, p0, Lcom/google/zxing/client/android/CaptureActivity;->lastResult:Lcom/google/zxing/Result;

    .line 488
    invoke-static {p0, p1}, Lcom/google/zxing/client/android/result/ResultHandlerFactory;->makeResultHandler(Lcom/google/zxing/client/android/CaptureActivity;Lcom/google/zxing/Result;)Lcom/google/zxing/client/android/result/ResultHandler;

    move-result-object v3

    .line 490
    .local v3, "resultHandler":Lcom/google/zxing/client/android/result/ResultHandler;
    if-eqz p2, :cond_2

    const/4 v0, 0x1

    .line 491
    .local v0, "fromLiveScan":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 492
    iget-object v5, p0, Lcom/google/zxing/client/android/CaptureActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v5, p1, v3}, Lcom/google/zxing/client/android/history/HistoryManager;->addHistoryItem(Lcom/google/zxing/Result;Lcom/google/zxing/client/android/result/ResultHandler;)V

    .line 494
    iget-boolean v5, p0, Lcom/google/zxing/client/android/CaptureActivity;->beepOnScan:Z

    if-eqz v5, :cond_0

    .line 495
    iget-object v5, p0, Lcom/google/zxing/client/android/CaptureActivity;->beepManager:Lcom/google/zxing/client/android/BeepManager;

    invoke-virtual {v5}, Lcom/google/zxing/client/android/BeepManager;->playBeepSoundAndVibrate()V

    .line 497
    :cond_0
    invoke-direct {p0, p2, p3, p1}, Lcom/google/zxing/client/android/CaptureActivity;->drawResultPoints(Landroid/graphics/Bitmap;FLcom/google/zxing/Result;)V

    .line 500
    :cond_1
    sget-object v5, Lcom/google/zxing/client/android/CaptureActivity$4;->$SwitchMap$com$google$zxing$client$android$IntentSource:[I

    iget-object v6, p0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    invoke-virtual {v6}, Lcom/google/zxing/client/android/IntentSource;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 535
    :goto_1
    return-void

    .end local v0    # "fromLiveScan":Z
    :cond_2
    move v0, v4

    .line 490
    goto :goto_0

    .line 503
    .restart local v0    # "fromLiveScan":Z
    :pswitch_0
    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "BULK_SCAN"

    invoke-virtual {v5, v6, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 505
    new-instance v1, Landroid/content/Intent;

    const-string v4, "bulk-barcode-result"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 506
    .local v1, "intermediateResult":Landroid/content/Intent;
    const-string v4, "SCAN_RESULT"

    invoke-virtual {p1}, Lcom/google/zxing/Result;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 507
    const-string v4, "SCAN_RESULT_FORMAT"

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/BarcodeFormat;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 508
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 510
    invoke-virtual {p0, v10, v11}, Lcom/google/zxing/client/android/CaptureActivity;->restartPreviewAfterDelay(J)V

    goto :goto_1

    .line 512
    .end local v1    # "intermediateResult":Landroid/content/Intent;
    :cond_3
    invoke-direct {p0, p1, v3, p2}, Lcom/google/zxing/client/android/CaptureActivity;->handleDecodeExternally(Lcom/google/zxing/Result;Lcom/google/zxing/client/android/result/ResultHandler;Landroid/graphics/Bitmap;)V

    goto :goto_1

    .line 516
    :pswitch_1
    iget-object v4, p0, Lcom/google/zxing/client/android/CaptureActivity;->scanFromWebPageManager:Lcom/google/zxing/client/android/ScanFromWebPageManager;

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/google/zxing/client/android/CaptureActivity;->scanFromWebPageManager:Lcom/google/zxing/client/android/ScanFromWebPageManager;

    invoke-virtual {v4}, Lcom/google/zxing/client/android/ScanFromWebPageManager;->isScanFromWebPage()Z

    move-result v4

    if-nez v4, :cond_5

    .line 517
    :cond_4
    invoke-direct {p0, p1, v3, p2}, Lcom/google/zxing/client/android/CaptureActivity;->handleDecodeInternally(Lcom/google/zxing/Result;Lcom/google/zxing/client/android/result/ResultHandler;Landroid/graphics/Bitmap;)V

    goto :goto_1

    .line 519
    :cond_5
    invoke-direct {p0, p1, v3, p2}, Lcom/google/zxing/client/android/CaptureActivity;->handleDecodeExternally(Lcom/google/zxing/Result;Lcom/google/zxing/client/android/result/ResultHandler;Landroid/graphics/Bitmap;)V

    goto :goto_1

    .line 523
    :pswitch_2
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 524
    .local v2, "prefs":Landroid/content/SharedPreferences;
    if-eqz v0, :cond_6

    const-string v5, "preferences_bulk_mode"

    invoke-interface {v2, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 525
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 526
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_bulk_mode_scanned:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x29

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 525
    invoke-static {v5, v6, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 527
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 529
    invoke-virtual {p0, v10, v11}, Lcom/google/zxing/client/android/CaptureActivity;->restartPreviewAfterDelay(J)V

    goto/16 :goto_1

    .line 531
    :cond_6
    invoke-direct {p0, p1, v3, p2}, Lcom/google/zxing/client/android/CaptureActivity;->handleDecodeInternally(Lcom/google/zxing/Result;Lcom/google/zxing/client/android/result/ResultHandler;Landroid/graphics/Bitmap;)V

    goto/16 :goto_1

    .line 500
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, -0x1

    .line 432
    if-ne p2, v3, :cond_0

    const v2, 0xbacc

    if-ne p1, v2, :cond_0

    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    if-eqz v2, :cond_0

    .line 433
    const-string v2, "ITEM_NUMBER"

    invoke-virtual {p3, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 434
    .local v1, "itemNumber":I
    if-ltz v1, :cond_0

    .line 435
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v2, v1}, Lcom/google/zxing/client/android/history/HistoryManager;->buildHistoryItem(I)Lcom/google/zxing/client/android/history/HistoryItem;

    move-result-object v0

    .line 436
    .local v0, "historyItem":Lcom/google/zxing/client/android/history/HistoryItem;
    const/4 v2, 0x0

    invoke-virtual {v0}, Lcom/google/zxing/client/android/history/HistoryItem;->getResult()Lcom/google/zxing/Result;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/google/zxing/client/android/CaptureActivity;->decodeOrStoreSavedBitmap(Landroid/graphics/Bitmap;Lcom/google/zxing/Result;)V

    .line 439
    .end local v0    # "historyItem":Lcom/google/zxing/client/android/history/HistoryItem;
    .end local v1    # "itemNumber":I
    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 171
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 174
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->recreate()V

    .line 175
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 147
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 149
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 150
    .local v0, "window":Landroid/view/Window;
    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 151
    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$layout;->capture:I

    invoke-virtual {p0, v1}, Lcom/google/zxing/client/android/CaptureActivity;->setContentView(I)V

    .line 153
    iput-boolean v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->hasSurface:Z

    .line 154
    new-instance v1, Lcom/google/zxing/client/android/InactivityTimer;

    invoke-direct {v1, p0}, Lcom/google/zxing/client/android/InactivityTimer;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

    .line 155
    new-instance v1, Lcom/google/zxing/client/android/BeepManager;

    invoke-direct {v1, p0}, Lcom/google/zxing/client/android/BeepManager;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->beepManager:Lcom/google/zxing/client/android/BeepManager;

    .line 156
    new-instance v1, Lcom/google/zxing/client/android/AmbientLightManager;

    invoke-direct {v1, p0}, Lcom/google/zxing/client/android/AmbientLightManager;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->ambientLightManager:Lcom/google/zxing/client/android/AmbientLightManager;

    .line 158
    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$xml;->preferences:I

    invoke-static {p0, v1, v2}, Landroid/preference/PreferenceManager;->setDefaultValues(Landroid/content/Context;IZ)V

    .line 160
    new-instance v1, Lcom/google/zxing/client/android/CaptureActivity$1;

    invoke-direct {v1, p0}, Lcom/google/zxing/client/android/CaptureActivity$1;-><init>(Lcom/google/zxing/client/android/CaptureActivity;)V

    iput-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->stopReceiver:Landroid/content/BroadcastReceiver;

    .line 166
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->stopReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "barcode-scanner-stop"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 167
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 368
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/InactivityTimer;->shutdown()V

    .line 369
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->stopReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 370
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 371
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x0

    const/4 v0, 0x1

    .line 375
    sparse-switch p1, :sswitch_data_0

    .line 399
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    :goto_0
    :sswitch_0
    return v0

    .line 377
    :sswitch_1
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    sget-object v2, Lcom/google/zxing/client/android/IntentSource;->NATIVE_APP_INTENT:Lcom/google/zxing/client/android/IntentSource;

    if-ne v1, v2, :cond_1

    .line 378
    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/CaptureActivity;->setResult(I)V

    .line 379
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->finish()V

    goto :goto_0

    .line 382
    :cond_1
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    sget-object v2, Lcom/google/zxing/client/android/IntentSource;->NONE:Lcom/google/zxing/client/android/IntentSource;

    if-eq v1, v2, :cond_2

    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    sget-object v2, Lcom/google/zxing/client/android/IntentSource;->ZXING_LINK:Lcom/google/zxing/client/android/IntentSource;

    if-ne v1, v2, :cond_0

    :cond_2
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->lastResult:Lcom/google/zxing/Result;

    if-eqz v1, :cond_0

    .line 383
    const-wide/16 v2, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/google/zxing/client/android/CaptureActivity;->restartPreviewAfterDelay(J)V

    goto :goto_0

    .line 393
    :sswitch_2
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {v1, v3}, Lcom/google/zxing/client/android/camera/CameraManager;->setTorch(Z)V

    goto :goto_0

    .line 396
    :sswitch_3
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {v1, v0}, Lcom/google/zxing/client/android/camera/CameraManager;->setTorch(Z)V

    goto :goto_0

    .line 375
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_1
        0x18 -> :sswitch_3
        0x19 -> :sswitch_2
        0x1b -> :sswitch_0
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 412
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 413
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v2, 0x80000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 414
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    .line 415
    .local v1, "itemId":I
    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->menu_history:I

    if-ne v1, v2, :cond_0

    .line 416
    const-class v2, Lcom/google/zxing/client/android/history/HistoryActivity;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 417
    const v2, 0xbacc

    invoke-virtual {p0, v0, v2}, Lcom/google/zxing/client/android/CaptureActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 427
    :goto_0
    const/4 v2, 0x1

    :goto_1
    return v2

    .line 418
    :cond_0
    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->menu_settings:I

    if-ne v1, v2, :cond_1

    .line 419
    const-class v2, Lcom/google/zxing/client/android/PreferencesActivity;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 420
    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/CaptureActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 421
    :cond_1
    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->menu_help:I

    if-ne v1, v2, :cond_2

    .line 422
    const-class v2, Lcom/google/zxing/client/android/HelpActivity;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 423
    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/CaptureActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 425
    :cond_2
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    goto :goto_1
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 349
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    if-eqz v2, :cond_0

    .line 350
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    invoke-virtual {v2}, Lcom/google/zxing/client/android/CaptureActivityHandler;->quitSynchronously()V

    .line 351
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    .line 353
    :cond_0
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

    invoke-virtual {v2}, Lcom/google/zxing/client/android/InactivityTimer;->onPause()V

    .line 354
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->ambientLightManager:Lcom/google/zxing/client/android/AmbientLightManager;

    invoke-virtual {v2}, Lcom/google/zxing/client/android/AmbientLightManager;->stop()V

    .line 355
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->beepManager:Lcom/google/zxing/client/android/BeepManager;

    invoke-virtual {v2}, Lcom/google/zxing/client/android/BeepManager;->close()V

    .line 356
    iget-object v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {v2}, Lcom/google/zxing/client/android/camera/CameraManager;->closeDriver()V

    .line 358
    iget-boolean v2, p0, Lcom/google/zxing/client/android/CaptureActivity;->hasSurface:Z

    if-nez v2, :cond_1

    .line 359
    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->preview_view:I

    invoke-virtual {p0, v2}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/SurfaceView;

    .line 360
    .local v1, "surfaceView":Landroid/view/SurfaceView;
    invoke-virtual {v1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 361
    .local v0, "surfaceHolder":Landroid/view/SurfaceHolder;
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 363
    .end local v0    # "surfaceHolder":Landroid/view/SurfaceHolder;
    .end local v1    # "surfaceView":Landroid/view/SurfaceView;
    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 364
    return-void
.end method

.method protected onResume()V
    .locals 14

    .prologue
    .line 179
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 182
    new-instance v12, Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-direct {v12, p0}, Lcom/google/zxing/client/android/history/HistoryManager;-><init>(Landroid/app/Activity;)V

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    .line 183
    iget-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v12}, Lcom/google/zxing/client/android/history/HistoryManager;->trimHistory()V

    .line 189
    new-instance v12, Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getApplication()Landroid/app/Application;

    move-result-object v13

    invoke-direct {v12, v13}, Lcom/google/zxing/client/android/camera/CameraManager;-><init>(Landroid/content/Context;)V

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    .line 191
    sget v12, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->viewfinder_view:I

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Lcom/google/zxing/client/android/ViewfinderView;

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->viewfinderView:Lcom/google/zxing/client/android/ViewfinderView;

    .line 192
    iget-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->viewfinderView:Lcom/google/zxing/client/android/ViewfinderView;

    iget-object v13, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {v12, v13}, Lcom/google/zxing/client/android/ViewfinderView;->setCameraManager(Lcom/google/zxing/client/android/camera/CameraManager;)V

    .line 194
    sget v12, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->result_view:I

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->resultView:Landroid/view/View;

    .line 195
    sget v12, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->status_view:I

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->statusView:Landroid/widget/TextView;

    .line 196
    sget v12, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->flip_button:I

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/Button;

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->flipButton:Landroid/widget/Button;

    .line 197
    sget v12, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->torch_button:I

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/Button;

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->torchButton:Landroid/widget/Button;

    .line 199
    const/4 v12, 0x0

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    .line 200
    const/4 v12, 0x0

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->lastResult:Lcom/google/zxing/Result;

    .line 202
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 212
    .local v7, "prefs":Landroid/content/SharedPreferences;
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v12

    const-string v13, "ORIENTATION_LOCK"

    invoke-virtual {v12, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 213
    .local v8, "scanOrientationLock":Ljava/lang/String;
    const-string v12, "landscape"

    invoke-virtual {v12, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 214
    const/4 v12, 0x0

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/CaptureActivity;->setRequestedOrientation(I)V

    .line 219
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/google/zxing/client/android/CaptureActivity;->resetStatusView()V

    .line 221
    iget-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->beepManager:Lcom/google/zxing/client/android/BeepManager;

    invoke-virtual {v12}, Lcom/google/zxing/client/android/BeepManager;->updatePrefs()V

    .line 222
    iget-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->ambientLightManager:Lcom/google/zxing/client/android/AmbientLightManager;

    iget-object v13, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {v12, v13}, Lcom/google/zxing/client/android/AmbientLightManager;->start(Lcom/google/zxing/client/android/camera/CameraManager;)V

    .line 224
    iget-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

    invoke-virtual {v12}, Lcom/google/zxing/client/android/InactivityTimer;->onResume()V

    .line 226
    invoke-virtual {p0}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 228
    .local v6, "intent":Landroid/content/Intent;
    const-string v12, "preferences_copy_to_clipboard"

    const/4 v13, 0x1

    invoke-interface {v7, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_9

    if-eqz v6, :cond_1

    const-string v12, "SAVE_HISTORY"

    const/4 v13, 0x1

    .line 229
    invoke-virtual {v6, v12, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_9

    :cond_1
    const/4 v12, 0x1

    :goto_1
    iput-boolean v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->copyToClipboard:Z

    .line 231
    if-eqz v6, :cond_2

    const-string v12, "BEEP_ON_SCAN"

    const/4 v13, 0x1

    invoke-virtual {v6, v12, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_a

    :cond_2
    const/4 v12, 0x1

    :goto_2
    iput-boolean v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->beepOnScan:Z

    .line 233
    sget-object v12, Lcom/google/zxing/client/android/IntentSource;->NONE:Lcom/google/zxing/client/android/IntentSource;

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    .line 234
    const/4 v12, 0x0

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->sourceUrl:Ljava/lang/String;

    .line 235
    const/4 v12, 0x0

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->scanFromWebPageManager:Lcom/google/zxing/client/android/ScanFromWebPageManager;

    .line 236
    const/4 v12, 0x0

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->decodeFormats:Ljava/util/Collection;

    .line 237
    const/4 v12, 0x0

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->characterSet:Ljava/lang/String;

    .line 239
    if-eqz v6, :cond_7

    .line 241
    invoke-virtual {v6}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 242
    .local v0, "action":Ljava/lang/String;
    invoke-virtual {v6}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v3

    .line 244
    .local v3, "dataString":Ljava/lang/String;
    const-string v12, "com.google.zxing.client.android.SCAN"

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_b

    .line 247
    sget-object v12, Lcom/google/zxing/client/android/IntentSource;->NATIVE_APP_INTENT:Lcom/google/zxing/client/android/IntentSource;

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    .line 248
    invoke-static {v6}, Lcom/google/zxing/client/android/DecodeFormatManager;->parseDecodeFormats(Landroid/content/Intent;)Ljava/util/Set;

    move-result-object v12

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->decodeFormats:Ljava/util/Collection;

    .line 249
    invoke-static {v6}, Lcom/google/zxing/client/android/DecodeHintManager;->parseDecodeHints(Landroid/content/Intent;)Ljava/util/Map;

    move-result-object v12

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->decodeHints:Ljava/util/Map;

    .line 251
    const-string v12, "SCAN_WIDTH"

    invoke-virtual {v6, v12}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_3

    const-string v12, "SCAN_HEIGHT"

    invoke-virtual {v6, v12}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 252
    const-string v12, "SCAN_WIDTH"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    .line 253
    .local v11, "width":I
    const-string v12, "SCAN_HEIGHT"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 254
    .local v4, "height":I
    if-lez v11, :cond_3

    if-lez v4, :cond_3

    .line 255
    iget-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {v12, v11, v4}, Lcom/google/zxing/client/android/camera/CameraManager;->setManualFramingRect(II)V

    .line 259
    .end local v4    # "height":I
    .end local v11    # "width":I
    :cond_3
    const-string v12, "SCAN_CAMERA_ID"

    invoke-virtual {v6, v12}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 260
    const-string v12, "SCAN_CAMERA_ID"

    const/4 v13, -0x1

    invoke-virtual {v6, v12, v13}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 261
    .local v1, "cameraId":I
    if-ltz v1, :cond_4

    .line 262
    iget-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    invoke-virtual {v12, v1}, Lcom/google/zxing/client/android/camera/CameraManager;->setManualCameraId(I)V

    .line 266
    .end local v1    # "cameraId":I
    :cond_4
    const-string v12, "TORCH_ON"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 267
    iget-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->cameraManager:Lcom/google/zxing/client/android/camera/CameraManager;

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Lcom/google/zxing/client/android/camera/CameraManager;->setTorchInitiallyOn(Z)V

    .line 270
    :cond_5
    const-string v12, "PROMPT_MESSAGE"

    invoke-virtual {v6, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 271
    .local v2, "customPromptMessage":Ljava/lang/String;
    if-eqz v2, :cond_6

    .line 272
    iget-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->statusView:Landroid/widget/TextView;

    invoke-virtual {v12, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 298
    .end local v2    # "customPromptMessage":Ljava/lang/String;
    :cond_6
    :goto_3
    const-string v12, "CHARACTER_SET"

    invoke-virtual {v6, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->characterSet:Ljava/lang/String;

    .line 302
    .end local v0    # "action":Ljava/lang/String;
    .end local v3    # "dataString":Ljava/lang/String;
    :cond_7
    sget v12, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->preview_view:I

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/view/SurfaceView;

    .line 303
    .local v10, "surfaceView":Landroid/view/SurfaceView;
    invoke-virtual {v10}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v9

    .line 304
    .local v9, "surfaceHolder":Landroid/view/SurfaceHolder;
    iget-boolean v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->hasSurface:Z

    if-eqz v12, :cond_d

    .line 307
    invoke-direct {p0, v9}, Lcom/google/zxing/client/android/CaptureActivity;->initCamera(Landroid/view/SurfaceHolder;)V

    .line 312
    :goto_4
    return-void

    .line 215
    .end local v6    # "intent":Landroid/content/Intent;
    .end local v9    # "surfaceHolder":Landroid/view/SurfaceHolder;
    .end local v10    # "surfaceView":Landroid/view/SurfaceView;
    :cond_8
    const-string v12, "portrait"

    invoke-virtual {v12, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 216
    const/4 v12, 0x1

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/CaptureActivity;->setRequestedOrientation(I)V

    goto/16 :goto_0

    .line 229
    .restart local v6    # "intent":Landroid/content/Intent;
    :cond_9
    const/4 v12, 0x0

    goto/16 :goto_1

    .line 231
    :cond_a
    const/4 v12, 0x0

    goto/16 :goto_2

    .line 275
    .restart local v0    # "action":Ljava/lang/String;
    .restart local v3    # "dataString":Ljava/lang/String;
    :cond_b
    if-eqz v3, :cond_c

    const-string v12, "http://www.google"

    .line 276
    invoke-virtual {v3, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_c

    const-string v12, "/m/products/scan"

    .line 277
    invoke-virtual {v3, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_c

    .line 280
    sget-object v12, Lcom/google/zxing/client/android/IntentSource;->PRODUCT_SEARCH_LINK:Lcom/google/zxing/client/android/IntentSource;

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    .line 281
    iput-object v3, p0, Lcom/google/zxing/client/android/CaptureActivity;->sourceUrl:Ljava/lang/String;

    .line 282
    sget-object v12, Lcom/google/zxing/client/android/DecodeFormatManager;->PRODUCT_FORMATS:Ljava/util/Set;

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->decodeFormats:Ljava/util/Collection;

    goto :goto_3

    .line 284
    :cond_c
    invoke-static {v3}, Lcom/google/zxing/client/android/CaptureActivity;->isZXingURL(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 288
    sget-object v12, Lcom/google/zxing/client/android/IntentSource;->ZXING_LINK:Lcom/google/zxing/client/android/IntentSource;

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->source:Lcom/google/zxing/client/android/IntentSource;

    .line 289
    iput-object v3, p0, Lcom/google/zxing/client/android/CaptureActivity;->sourceUrl:Ljava/lang/String;

    .line 290
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 291
    .local v5, "inputUri":Landroid/net/Uri;
    new-instance v12, Lcom/google/zxing/client/android/ScanFromWebPageManager;

    invoke-direct {v12, v5}, Lcom/google/zxing/client/android/ScanFromWebPageManager;-><init>(Landroid/net/Uri;)V

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->scanFromWebPageManager:Lcom/google/zxing/client/android/ScanFromWebPageManager;

    .line 292
    invoke-static {v5}, Lcom/google/zxing/client/android/DecodeFormatManager;->parseDecodeFormats(Landroid/net/Uri;)Ljava/util/Set;

    move-result-object v12

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->decodeFormats:Ljava/util/Collection;

    .line 294
    invoke-static {v5}, Lcom/google/zxing/client/android/DecodeHintManager;->parseDecodeHints(Landroid/net/Uri;)Ljava/util/Map;

    move-result-object v12

    iput-object v12, p0, Lcom/google/zxing/client/android/CaptureActivity;->decodeHints:Ljava/util/Map;

    goto :goto_3

    .line 310
    .end local v0    # "action":Ljava/lang/String;
    .end local v3    # "dataString":Ljava/lang/String;
    .end local v5    # "inputUri":Landroid/net/Uri;
    .restart local v9    # "surfaceHolder":Landroid/view/SurfaceHolder;
    .restart local v10    # "surfaceView":Landroid/view/SurfaceView;
    :cond_d
    invoke-interface {v9, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    goto :goto_4
.end method

.method public restartPreviewAfterDelay(J)V
    .locals 3
    .param p1, "delayMS"    # J

    .prologue
    .line 809
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    if-eqz v0, :cond_0

    .line 810
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->handler:Lcom/google/zxing/client/android/CaptureActivityHandler;

    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->restart_preview:I

    invoke-virtual {v0, v1, p1, p2}, Lcom/google/zxing/client/android/CaptureActivityHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 812
    :cond_0
    invoke-direct {p0}, Lcom/google/zxing/client/android/CaptureActivity;->resetStatusView()V

    .line 813
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 476
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 459
    if-nez p1, :cond_0

    .line 460
    sget-object v0, Lcom/google/zxing/client/android/CaptureActivity;->TAG:Ljava/lang/String;

    const-string v1, "*** WARNING *** surfaceCreated() gave us a null surface!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    :cond_0
    iget-boolean v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->hasSurface:Z

    if-nez v0, :cond_1

    .line 463
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->hasSurface:Z

    .line 464
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/CaptureActivity;->initCamera(Landroid/view/SurfaceHolder;)V

    .line 466
    :cond_1
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 470
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/client/android/CaptureActivity;->hasSurface:Z

    .line 471
    return-void
.end method

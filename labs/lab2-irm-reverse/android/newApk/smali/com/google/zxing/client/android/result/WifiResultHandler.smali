.class public final Lcom/google/zxing/client/android/result/WifiResultHandler;
.super Lcom/google/zxing/client/android/result/ResultHandler;
.source "WifiResultHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final parent:Lcom/google/zxing/client/android/CaptureActivity;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lcom/google/zxing/client/android/result/WifiResultHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/result/WifiResultHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/client/android/CaptureActivity;Lcom/google/zxing/client/result/ParsedResult;)V
    .locals 0
    .param p1, "activity"    # Lcom/google/zxing/client/android/CaptureActivity;
    .param p2, "result"    # Lcom/google/zxing/client/result/ParsedResult;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/client/android/result/ResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    .line 47
    iput-object p1, p0, Lcom/google/zxing/client/android/result/WifiResultHandler;->parent:Lcom/google/zxing/client/android/CaptureActivity;

    .line 48
    return-void
.end method


# virtual methods
.method public getButtonCount()I
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x1

    return v0
.end method

.method public getButtonText(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 58
    sget v0, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_wifi:I

    return v0
.end method

.method public getDisplayContents()Ljava/lang/CharSequence;
    .locals 3

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/WifiResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/client/result/WifiParsedResult;

    .line 86
    .local v0, "wifiResult":Lcom/google/zxing/client/result/WifiParsedResult;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/google/zxing/client/result/WifiParsedResult;->getSsid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/zxing/client/result/WifiParsedResult;->getNetworkEncryption()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getDisplayTitle()I
    .locals 1

    .prologue
    .line 91
    sget v0, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->result_wifi:I

    return v0
.end method

.method public handleButtonPress(I)V
    .locals 7
    .param p1, "index"    # I

    .prologue
    .line 63
    if-nez p1, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/WifiResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/client/result/WifiParsedResult;

    .line 65
    .local v2, "wifiResult":Lcom/google/zxing/client/result/WifiParsedResult;
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/WifiResultHandler;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "wifi"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 66
    .local v1, "wifiManager":Landroid/net/wifi/WifiManager;
    if-nez v1, :cond_1

    .line 67
    sget-object v3, Lcom/google/zxing/client/android/result/WifiResultHandler;->TAG:Ljava/lang/String;

    const-string v4, "No WifiManager available from device"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .end local v1    # "wifiManager":Landroid/net/wifi/WifiManager;
    .end local v2    # "wifiResult":Lcom/google/zxing/client/result/WifiParsedResult;
    :cond_0
    :goto_0
    return-void

    .line 70
    .restart local v1    # "wifiManager":Landroid/net/wifi/WifiManager;
    .restart local v2    # "wifiResult":Lcom/google/zxing/client/result/WifiParsedResult;
    :cond_1
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/WifiResultHandler;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 71
    .local v0, "activity":Landroid/app/Activity;
    new-instance v3, Lcom/google/zxing/client/android/result/WifiResultHandler$1;

    invoke-direct {v3, p0, v0}, Lcom/google/zxing/client/android/result/WifiResultHandler$1;-><init>(Lcom/google/zxing/client/android/result/WifiResultHandler;Landroid/app/Activity;)V

    invoke-virtual {v0, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 77
    new-instance v3, Lcom/google/zxing/client/android/wifi/WifiConfigManager;

    invoke-direct {v3, v1}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;-><init>(Landroid/net/wifi/WifiManager;)V

    sget-object v4, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v5, 0x1

    new-array v5, v5, [Lcom/google/zxing/client/result/WifiParsedResult;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    invoke-virtual {v3, v4, v5}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 78
    iget-object v3, p0, Lcom/google/zxing/client/android/result/WifiResultHandler;->parent:Lcom/google/zxing/client/android/CaptureActivity;

    const-wide/16 v4, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/google/zxing/client/android/CaptureActivity;->restartPreviewAfterDelay(J)V

    goto :goto_0
.end method

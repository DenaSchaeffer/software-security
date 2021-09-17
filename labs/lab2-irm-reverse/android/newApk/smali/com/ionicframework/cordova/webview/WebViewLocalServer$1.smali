.class Lcom/ionicframework/cordova/webview/WebViewLocalServer$1;
.super Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;
.source "WebViewLocalServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ionicframework/cordova/webview/WebViewLocalServer;->hostAssets(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

.field final synthetic val$assetPath:Ljava/lang/String;

.field final synthetic val$virtualAssetPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/ionicframework/cordova/webview/WebViewLocalServer;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    .prologue
    .line 429
    iput-object p1, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$1;->this$0:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    iput-object p2, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$1;->val$virtualAssetPath:Ljava/lang/String;

    iput-object p3, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$1;->val$assetPath:Ljava/lang/String;

    invoke-direct {p0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 6
    .param p1, "url"    # Landroid/net/Uri;

    .prologue
    .line 433
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$1;->val$virtualAssetPath:Ljava/lang/String;

    iget-object v5, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$1;->val$assetPath:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 435
    .local v1, "path":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$1;->this$0:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    invoke-static {v3}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->access$000(Lcom/ionicframework/cordova/webview/WebViewLocalServer;)Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;

    move-result-object v3

    iget-object v4, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$1;->val$assetPath:Ljava/lang/String;

    invoke-virtual {v3, v1, v4}, Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;->openAsset(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 441
    :goto_0
    return-object v2

    .line 436
    :catch_0
    move-exception v0

    .line 437
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->access$100()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to open asset URL: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    const/4 v2, 0x0

    goto :goto_0
.end method

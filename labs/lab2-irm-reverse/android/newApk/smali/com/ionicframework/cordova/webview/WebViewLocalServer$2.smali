.class Lcom/ionicframework/cordova/webview/WebViewLocalServer$2;
.super Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;
.source "WebViewLocalServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ionicframework/cordova/webview/WebViewLocalServer;->hostResources(Ljava/lang/String;Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ionicframework/cordova/webview/WebViewLocalServer;


# direct methods
.method constructor <init>(Lcom/ionicframework/cordova/webview/WebViewLocalServer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    .prologue
    .line 513
    iput-object p1, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$2;->this$0:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    invoke-direct {p0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 6
    .param p1, "url"    # Landroid/net/Uri;

    .prologue
    .line 516
    iget-object v3, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$2;->this$0:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    invoke-static {v3}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->access$000(Lcom/ionicframework/cordova/webview/WebViewLocalServer;)Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;->openResource(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 517
    .local v2, "stream":Ljava/io/InputStream;
    const/4 v1, 0x0

    .line 519
    .local v1, "mimeType":Ljava/lang/String;
    :try_start_0
    invoke-static {v2}, Ljava/net/URLConnection;->guessContentTypeFromStream(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 524
    :goto_0
    return-object v2

    .line 520
    :catch_0
    move-exception v0

    .line 521
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->access$100()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to get mime type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

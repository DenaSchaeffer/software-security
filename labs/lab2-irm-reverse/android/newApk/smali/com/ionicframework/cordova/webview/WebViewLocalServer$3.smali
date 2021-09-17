.class Lcom/ionicframework/cordova/webview/WebViewLocalServer$3;
.super Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;
.source "WebViewLocalServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ionicframework/cordova/webview/WebViewLocalServer;->hostFiles(Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

.field final synthetic val$basePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/ionicframework/cordova/webview/WebViewLocalServer;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    .prologue
    .line 566
    iput-object p1, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$3;->this$0:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    iput-object p2, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$3;->val$basePath:Ljava/lang/String;

    invoke-direct {p0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 8
    .param p1, "url"    # Landroid/net/Uri;

    .prologue
    .line 571
    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    const-string v5, "/_file_/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 572
    iget-object v4, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$3;->this$0:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    invoke-static {v4}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->access$000(Lcom/ionicframework/cordova/webview/WebViewLocalServer;)Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;

    move-result-object v4

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v5

    const-string v6, "/_file_/"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;->openFile(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 581
    .local v3, "stream":Ljava/io/InputStream;
    :goto_0
    const/4 v2, 0x0

    .line 583
    .local v2, "mimeType":Ljava/lang/String;
    :try_start_1
    invoke-static {v3}, Ljava/net/URLConnection;->guessContentTypeFromStream(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .line 588
    .end local v2    # "mimeType":Ljava/lang/String;
    .end local v3    # "stream":Ljava/io/InputStream;
    :goto_1
    return-object v3

    .line 574
    :cond_0
    :try_start_2
    iget-object v4, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$3;->this$0:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    invoke-static {v4}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->access$000(Lcom/ionicframework/cordova/webview/WebViewLocalServer;)Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$3;->val$basePath:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;->openFile(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v3

    .restart local v3    # "stream":Ljava/io/InputStream;
    goto :goto_0

    .line 576
    .end local v3    # "stream":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 577
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->access$100()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to open asset URL: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 578
    const/4 v3, 0x0

    goto :goto_1

    .line 584
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "mimeType":Ljava/lang/String;
    .restart local v3    # "stream":Ljava/io/InputStream;
    :catch_1
    move-exception v1

    .line 585
    .local v1, "ex":Ljava/lang/Exception;
    invoke-static {}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->access$100()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to get mime type"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

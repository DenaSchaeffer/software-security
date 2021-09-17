.class Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;
.super Lorg/apache/cordova/engine/SystemWebViewClient;
.source "IonicWebViewEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ionicframework/cordova/webview/IonicWebViewEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ServerClient"
.end annotation


# instance fields
.field private parser:Lorg/apache/cordova/ConfigXmlParser;

.field final synthetic this$0:Lcom/ionicframework/cordova/webview/IonicWebViewEngine;


# direct methods
.method public constructor <init>(Lcom/ionicframework/cordova/webview/IonicWebViewEngine;Lorg/apache/cordova/engine/SystemWebViewEngine;Lorg/apache/cordova/ConfigXmlParser;)V
    .locals 0
    .param p2, "parentEngine"    # Lorg/apache/cordova/engine/SystemWebViewEngine;
    .param p3, "parser"    # Lorg/apache/cordova/ConfigXmlParser;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;->this$0:Lcom/ionicframework/cordova/webview/IonicWebViewEngine;

    .line 110
    invoke-direct {p0, p2}, Lorg/apache/cordova/engine/SystemWebViewClient;-><init>(Lorg/apache/cordova/engine/SystemWebViewEngine;)V

    .line 111
    iput-object p3, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;->parser:Lorg/apache/cordova/ConfigXmlParser;

    .line 112
    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 138
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/engine/SystemWebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:(function() { window.WEBVIEW_SERVER_URL = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;->this$0:Lcom/ionicframework/cordova/webview/IonicWebViewEngine;

    .line 140
    invoke-static {v1}, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->access$100(Lcom/ionicframework/cordova/webview/IonicWebViewEngine;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'})()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 139
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 128
    invoke-super {p0, p1, p2, p3}, Lorg/apache/cordova/engine/SystemWebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 129
    iget-object v1, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;->parser:Lorg/apache/cordova/ConfigXmlParser;

    invoke-virtual {v1}, Lorg/apache/cordova/ConfigXmlParser;->getLaunchUrl()Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "launchUrl":Ljava/lang/String;
    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 131
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 132
    iget-object v1, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;->this$0:Lcom/ionicframework/cordova/webview/IonicWebViewEngine;

    invoke-static {v1}, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->access$100(Lcom/ionicframework/cordova/webview/IonicWebViewEngine;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 134
    :cond_0
    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "request"    # Landroid/webkit/WebResourceRequest;
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;->this$0:Lcom/ionicframework/cordova/webview/IonicWebViewEngine;

    invoke-static {v0}, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->access$000(Lcom/ionicframework/cordova/webview/IonicWebViewEngine;)Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    move-result-object v0

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->shouldInterceptRequest(Landroid/net/Uri;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    return-object v0
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 123
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;->this$0:Lcom/ionicframework/cordova/webview/IonicWebViewEngine;

    invoke-static {v0}, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->access$000(Lcom/ionicframework/cordova/webview/IonicWebViewEngine;)Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    move-result-object v0

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->shouldInterceptRequest(Landroid/net/Uri;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    return-object v0
.end method

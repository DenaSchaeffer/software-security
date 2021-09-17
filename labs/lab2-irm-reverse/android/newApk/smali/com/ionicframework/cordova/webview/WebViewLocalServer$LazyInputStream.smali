.class abstract Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;
.super Ljava/io/InputStream;
.source "WebViewLocalServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ionicframework/cordova/webview/WebViewLocalServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "LazyInputStream"
.end annotation


# instance fields
.field protected final handler:Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;

.field private is:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V
    .locals 1
    .param p1, "handler"    # Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;

    .prologue
    .line 614
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 612
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->is:Ljava/io/InputStream;

    .line 615
    iput-object p1, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->handler:Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;

    .line 616
    return-void
.end method

.method private getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 619
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->is:Ljava/io/InputStream;

    if-nez v0, :cond_0

    .line 620
    invoke-virtual {p0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->handle()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->is:Ljava/io/InputStream;

    .line 622
    :cond_0
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->is:Ljava/io/InputStream;

    return-object v0
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 629
    invoke-direct {p0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 630
    .local v0, "is":Ljava/io/InputStream;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected abstract handle()Ljava/io/InputStream;
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 635
    invoke-direct {p0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 636
    .local v0, "is":Ljava/io/InputStream;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v1

    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 641
    invoke-direct {p0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 642
    .local v0, "is":Ljava/io/InputStream;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v1

    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public read([BII)I
    .locals 2
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 647
    invoke-direct {p0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 648
    .local v0, "is":Ljava/io/InputStream;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public skip(J)J
    .locals 5
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 653
    invoke-direct {p0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 654
    .local v0, "is":Ljava/io/InputStream;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v2

    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.class public Lcom/ionicframework/cordova/webview/WebViewLocalServer;
.super Ljava/lang/Object;
.source "WebViewLocalServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ionicframework/cordova/webview/WebViewLocalServer$LollipopLazyInputStream;,
        Lcom/ionicframework/cordova/webview/WebViewLocalServer$LazyInputStream;,
        Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;,
        Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = null

.field private static final httpScheme:Ljava/lang/String; = "http"

.field private static final httpsScheme:Ljava/lang/String; = "https"

.field public static final knownUnusedAuthority:Ljava/lang/String; = "capacitorapp.net"


# instance fields
.field private final authority:Ljava/lang/String;

.field private basePath:Ljava/lang/String;

.field private final html5mode:Z

.field private isAsset:Z

.field private final isLocal:Z

.field private parser:Lorg/apache/cordova/ConfigXmlParser;

.field private final protocolHandler:Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;

.field private final uriMatcher:Lcom/ionicframework/cordova/webview/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const-string v0, "WebViewAssetServer"

    sput-object v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;ZLorg/apache/cordova/ConfigXmlParser;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "authority"    # Ljava/lang/String;
    .param p3, "html5mode"    # Z
    .param p4, "parser"    # Lorg/apache/cordova/ConfigXmlParser;

    .prologue
    const/4 v2, 0x1

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    new-instance v0, Lcom/ionicframework/cordova/webview/UriMatcher;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/ionicframework/cordova/webview/UriMatcher;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->uriMatcher:Lcom/ionicframework/cordova/webview/UriMatcher;

    .line 169
    iput-boolean p3, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->html5mode:Z

    .line 170
    iput-object p4, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->parser:Lorg/apache/cordova/ConfigXmlParser;

    .line 171
    new-instance v0, Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->protocolHandler:Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;

    .line 172
    if-eqz p2, :cond_1

    .line 173
    iput-object p2, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->authority:Ljava/lang/String;

    .line 174
    const-string v0, "localhost"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 175
    iput-boolean v2, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->isLocal:Z

    .line 184
    :goto_0
    return-void

    .line 177
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->isLocal:Z

    goto :goto_0

    .line 181
    :cond_1
    iput-boolean v2, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->isLocal:Z

    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "capacitorapp.net"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->authority:Ljava/lang/String;

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/ionicframework/cordova/webview/WebViewLocalServer;)Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;
    .locals 1
    .param p0, "x0"    # Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->protocolHandler:Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private static createWebResourceResponse(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)Landroid/webkit/WebResourceResponse;
    .locals 7
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "statusCode"    # I
    .param p3, "reasonPhrase"    # Ljava/lang/String;
    .param p5, "data"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/InputStream;",
            ")",
            "Landroid/webkit/WebResourceResponse;"
        }
    .end annotation

    .prologue
    .line 204
    .local p4, "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 205
    new-instance v0, Landroid/webkit/WebResourceResponse;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V

    .line 207
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Landroid/webkit/WebResourceResponse;

    invoke-direct {v0, p0, p1, p5}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    goto :goto_0
.end method

.method private getMimeType(Ljava/lang/String;Ljava/io/InputStream;)Ljava/lang/String;
    .locals 5
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 325
    const/4 v1, 0x0

    .line 327
    .local v1, "mimeType":Ljava/lang/String;
    :try_start_0
    invoke-static {p1}, Ljava/net/URLConnection;->guessContentTypeFromName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 328
    if-eqz v1, :cond_0

    const-string v2, ".js"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "image/x-icon"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 329
    const-string v2, "IonicWebViewEngine"

    const-string v3, "We shouldn\'t be here"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    :cond_0
    if-nez v1, :cond_1

    .line 332
    const-string v2, ".js"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 334
    const-string v1, "application/javascript"

    .line 342
    :cond_1
    :goto_0
    return-object v1

    .line 336
    :cond_2
    invoke-static {p2}, Ljava/net/URLConnection;->guessContentTypeFromStream(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 339
    :catch_0
    move-exception v0

    .line 340
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v2, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to get mime type"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private handleLocalRequest(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)Landroid/webkit/WebResourceResponse;
    .locals 16
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "handler"    # Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;

    .prologue
    .line 238
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v12

    .line 239
    .local v12, "path":Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->html5mode:Z

    if-eqz v3, :cond_2

    .line 241
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->parser:Lorg/apache/cordova/ConfigXmlParser;

    invoke-virtual {v3}, Lorg/apache/cordova/ConfigXmlParser;->getLaunchUrl()Ljava/lang/String;

    move-result-object v11

    .line 242
    .local v11, "launchURL":Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v11, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v11, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 244
    .local v10, "launchFile":Ljava/lang/String;
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->basePath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 245
    .local v15, "startPath":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->isAsset:Z

    if-eqz v3, :cond_1

    .line 246
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->protocolHandler:Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;

    const-string v4, ""

    invoke-virtual {v3, v15, v4}, Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;->openAsset(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 256
    .local v7, "stream":Ljava/io/InputStream;
    :goto_0
    const-string v2, "text/html"

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getEncoding()Ljava/lang/String;

    move-result-object v3

    .line 257
    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getStatusCode()I

    move-result v4

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getResponseHeaders()Ljava/util/Map;

    move-result-object v6

    .line 256
    invoke-static/range {v2 .. v7}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->createWebResourceResponse(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)Landroid/webkit/WebResourceResponse;

    move-result-object v3

    .line 273
    .end local v7    # "stream":Ljava/io/InputStream;
    .end local v10    # "launchFile":Ljava/lang/String;
    .end local v11    # "launchURL":Ljava/lang/String;
    .end local v15    # "startPath":Ljava/lang/String;
    :goto_1
    return-object v3

    .line 248
    .restart local v10    # "launchFile":Ljava/lang/String;
    .restart local v11    # "launchURL":Ljava/lang/String;
    .restart local v15    # "startPath":Ljava/lang/String;
    :cond_1
    :try_start_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->protocolHandler:Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;

    invoke-virtual {v3, v15}, Lcom/ionicframework/cordova/webview/AndroidProtocolHandler;->openFile(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v7

    .restart local v7    # "stream":Ljava/io/InputStream;
    goto :goto_0

    .line 251
    .end local v7    # "stream":Ljava/io/InputStream;
    .end local v15    # "startPath":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 252
    .local v8, "e":Ljava/io/IOException;
    sget-object v3, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to open "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 253
    const/4 v3, 0x0

    goto :goto_1

    .line 260
    .end local v8    # "e":Ljava/io/IOException;
    .end local v10    # "launchFile":Ljava/lang/String;
    .end local v11    # "launchURL":Ljava/lang/String;
    :cond_2
    const-string v3, "."

    invoke-virtual {v12, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v13

    .line 261
    .local v13, "periodIndex":I
    if-ltz v13, :cond_3

    .line 262
    const-string v3, "."

    invoke-virtual {v12, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v12, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 264
    .local v9, "ext":Ljava/lang/String;
    new-instance v14, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LollipopLazyInputStream;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-direct {v14, v0, v1}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$LollipopLazyInputStream;-><init>(Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;Landroid/net/Uri;)V

    .line 265
    .local v14, "responseStream":Ljava/io/InputStream;
    move-object v7, v14

    .line 267
    .restart local v7    # "stream":Ljava/io/InputStream;
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v7}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->getMimeType(Ljava/lang/String;Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    .line 269
    .local v2, "mimeType":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getEncoding()Ljava/lang/String;

    move-result-object v3

    .line 270
    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getStatusCode()I

    move-result v4

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getResponseHeaders()Ljava/util/Map;

    move-result-object v6

    .line 269
    invoke-static/range {v2 .. v7}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->createWebResourceResponse(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)Landroid/webkit/WebResourceResponse;

    move-result-object v3

    goto :goto_1

    .line 273
    .end local v2    # "mimeType":Ljava/lang/String;
    .end local v7    # "stream":Ljava/io/InputStream;
    .end local v9    # "ext":Ljava/lang/String;
    .end local v14    # "responseStream":Ljava/io/InputStream;
    :cond_3
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private handleProxyRequest(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)Landroid/webkit/WebResourceResponse;
    .locals 18
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "handler"    # Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;

    .prologue
    .line 285
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v15

    .line 286
    .local v15, "path":Ljava/lang/String;
    new-instance v17, Ljava/net/URL;

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 287
    .local v17, "url":Ljava/net/URL;
    invoke-virtual/range {v17 .. v17}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v13

    check-cast v13, Ljava/net/HttpURLConnection;

    .line 288
    .local v13, "conn":Ljava/net/HttpURLConnection;
    const-string v2, "GET"

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 289
    const/16 v2, 0x7530

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 290
    const/16 v2, 0x7530

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 292
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    .line 294
    .local v6, "stream":Ljava/io/InputStream;
    const-string v2, "/"

    invoke-virtual {v15, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->html5mode:Z

    if-eqz v2, :cond_1

    .line 295
    :cond_0
    const-string v1, "text/html"

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getEncoding()Ljava/lang/String;

    move-result-object v2

    .line 296
    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getStatusCode()I

    move-result v3

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getReasonPhrase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getResponseHeaders()Ljava/util/Map;

    move-result-object v5

    .line 295
    invoke-static/range {v1 .. v6}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->createWebResourceResponse(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)Landroid/webkit/WebResourceResponse;

    move-result-object v2

    .line 321
    .end local v6    # "stream":Ljava/io/InputStream;
    .end local v13    # "conn":Ljava/net/HttpURLConnection;
    .end local v15    # "path":Ljava/lang/String;
    .end local v17    # "url":Ljava/net/URL;
    :goto_0
    return-object v2

    .line 299
    .restart local v6    # "stream":Ljava/io/InputStream;
    .restart local v13    # "conn":Ljava/net/HttpURLConnection;
    .restart local v15    # "path":Ljava/lang/String;
    .restart local v17    # "url":Ljava/net/URL;
    :cond_1
    const-string v2, "."

    invoke-virtual {v15, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v16

    .line 300
    .local v16, "periodIndex":I
    if-ltz v16, :cond_3

    .line 301
    const-string v2, "."

    invoke-virtual {v15, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v15, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    .line 304
    .local v14, "ext":Ljava/lang/String;
    const-string v2, ".html"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 307
    :cond_2
    move-object/from16 v0, p0

    invoke-direct {v0, v15, v6}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->getMimeType(Ljava/lang/String;Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    .line 309
    .local v1, "mimeType":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getEncoding()Ljava/lang/String;

    move-result-object v2

    .line 310
    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getStatusCode()I

    move-result v3

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getReasonPhrase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getResponseHeaders()Ljava/util/Map;

    move-result-object v5

    .line 309
    invoke-static/range {v1 .. v6}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->createWebResourceResponse(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)Landroid/webkit/WebResourceResponse;

    move-result-object v2

    goto :goto_0

    .line 313
    .end local v1    # "mimeType":Ljava/lang/String;
    .end local v14    # "ext":Ljava/lang/String;
    :cond_3
    const-string v7, ""

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getEncoding()Ljava/lang/String;

    move-result-object v8

    .line 314
    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getStatusCode()I

    move-result v9

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getReasonPhrase()Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {p2 .. p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;->getResponseHeaders()Ljava/util/Map;

    move-result-object v11

    move-object v12, v6

    .line 313
    invoke-static/range {v7 .. v12}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->createWebResourceResponse(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)Landroid/webkit/WebResourceResponse;
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 318
    .end local v6    # "stream":Ljava/io/InputStream;
    .end local v13    # "conn":Ljava/net/HttpURLConnection;
    .end local v15    # "path":Ljava/lang/String;
    .end local v16    # "periodIndex":I
    .end local v17    # "url":Ljava/net/URL;
    :catch_0
    move-exception v2

    .line 321
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 316
    :catch_1
    move-exception v2

    goto :goto_1
.end method

.method private static parseAndVerifyUrl(Ljava/lang/String;)Landroid/net/Uri;
    .locals 6
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 187
    if-nez p0, :cond_1

    move-object v1, v2

    .line 200
    :cond_0
    :goto_0
    return-object v1

    .line 190
    :cond_1
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 191
    .local v1, "uri":Landroid/net/Uri;
    if-nez v1, :cond_2

    .line 192
    sget-object v3, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Malformed URL: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v2

    .line 193
    goto :goto_0

    .line 195
    :cond_2
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 196
    .local v0, "path":Ljava/lang/String;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    .line 197
    :cond_3
    sget-object v3, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "URL does not have a path: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v2

    .line 198
    goto :goto_0
.end method


# virtual methods
.method public getAuthority()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->authority:Ljava/lang/String;

    return-object v0
.end method

.method public getBasePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 675
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->basePath:Ljava/lang/String;

    return-object v0
.end method

.method public hostAssets(Ljava/lang/String;)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
    .locals 6
    .param p1, "assetPath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 373
    iget-object v1, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->authority:Ljava/lang/String;

    const-string v3, ""

    move-object v0, p0

    move-object v2, p1

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->hostAssets(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;

    move-result-object v0

    return-object v0
.end method

.method public hostAssets(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
    .locals 7
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "assetPath"    # Ljava/lang/String;
    .param p3, "virtualAssetPath"    # Ljava/lang/String;
    .param p4, "enableHttp"    # Z
    .param p5, "enableHttps"    # Z

    .prologue
    const/16 v6, 0x2a

    const/4 v5, -0x1

    .line 411
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->isAsset:Z

    .line 412
    iput-object p2, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->basePath:Ljava/lang/String;

    .line 413
    new-instance v3, Landroid/net/Uri$Builder;

    invoke-direct {v3}, Landroid/net/Uri$Builder;-><init>()V

    .line 414
    .local v3, "uriBuilder":Landroid/net/Uri$Builder;
    const-string v4, "http"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 415
    invoke-virtual {v3, p1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 416
    invoke-virtual {v3, p3}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 418
    invoke-virtual {p2, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-eq v4, v5, :cond_0

    .line 419
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "assetPath cannot contain the \'*\' character."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 421
    :cond_0
    invoke-virtual {p3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-eq v4, v5, :cond_1

    .line 422
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "virtualAssetPath cannot contain the \'*\' character."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 426
    :cond_1
    const/4 v1, 0x0

    .line 427
    .local v1, "httpPrefix":Landroid/net/Uri;
    const/4 v2, 0x0

    .line 429
    .local v2, "httpsPrefix":Landroid/net/Uri;
    new-instance v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$1;

    invoke-direct {v0, p0, p3, p2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$1;-><init>(Lcom/ionicframework/cordova/webview/WebViewLocalServer;Ljava/lang/String;Ljava/lang/String;)V

    .line 445
    .local v0, "handler":Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;
    if-eqz p4, :cond_2

    .line 446
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 447
    const-string v4, "/"

    invoke-static {v1, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V

    .line 448
    const-string v4, "**"

    invoke-static {v1, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V

    .line 450
    :cond_2
    if-eqz p5, :cond_3

    .line 451
    const-string v4, "https"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 452
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 453
    const-string v4, "/"

    invoke-static {v2, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V

    .line 454
    const-string v4, "**"

    invoke-static {v2, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V

    .line 456
    :cond_3
    new-instance v4, Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;

    invoke-direct {v4, v1, v2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;-><init>(Landroid/net/Uri;Landroid/net/Uri;)V

    return-object v4
.end method

.method public hostAssets(Ljava/lang/String;Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
    .locals 6
    .param p1, "assetPath"    # Ljava/lang/String;
    .param p2, "virtualAssetPath"    # Ljava/lang/String;
    .param p3, "enableHttp"    # Z
    .param p4, "enableHttps"    # Z

    .prologue
    .line 391
    iget-object v1, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->authority:Ljava/lang/String;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->hostAssets(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;

    move-result-object v0

    return-object v0
.end method

.method public hostFiles(Ljava/lang/String;)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
    .locals 1
    .param p1, "basePath"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 551
    invoke-virtual {p0, p1, v0, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->hostFiles(Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;

    move-result-object v0

    return-object v0
.end method

.method public hostFiles(Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
    .locals 5
    .param p1, "basePath"    # Ljava/lang/String;
    .param p2, "enableHttp"    # Z
    .param p3, "enableHttps"    # Z

    .prologue
    .line 556
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->isAsset:Z

    .line 557
    iput-object p1, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->basePath:Ljava/lang/String;

    .line 558
    new-instance v3, Landroid/net/Uri$Builder;

    invoke-direct {v3}, Landroid/net/Uri$Builder;-><init>()V

    .line 559
    .local v3, "uriBuilder":Landroid/net/Uri$Builder;
    const-string v4, "http"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 560
    iget-object v4, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->authority:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 561
    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 563
    const/4 v1, 0x0

    .line 564
    .local v1, "httpPrefix":Landroid/net/Uri;
    const/4 v2, 0x0

    .line 566
    .local v2, "httpsPrefix":Landroid/net/Uri;
    new-instance v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$3;

    invoke-direct {v0, p0, p1}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$3;-><init>(Lcom/ionicframework/cordova/webview/WebViewLocalServer;Ljava/lang/String;)V

    .line 592
    .local v0, "handler":Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;
    if-eqz p2, :cond_0

    .line 593
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 594
    const-string v4, "/"

    invoke-static {v1, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V

    .line 595
    const-string v4, "**"

    invoke-static {v1, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V

    .line 597
    :cond_0
    if-eqz p3, :cond_1

    .line 598
    const-string v4, "https"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 599
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 600
    const-string v4, "/"

    invoke-static {v2, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V

    .line 601
    const-string v4, "**"

    invoke-static {v2, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V

    .line 603
    :cond_1
    new-instance v4, Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;

    invoke-direct {v4, v1, v2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;-><init>(Landroid/net/Uri;Landroid/net/Uri;)V

    return-object v4
.end method

.method public hostResources()Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 466
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->authority:Ljava/lang/String;

    const-string v1, "/res"

    invoke-virtual {p0, v0, v1, v2, v2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->hostResources(Ljava/lang/String;Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;

    move-result-object v0

    return-object v0
.end method

.method public hostResources(Ljava/lang/String;Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
    .locals 6
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "virtualResourcesPath"    # Ljava/lang/String;
    .param p3, "enableHttp"    # Z
    .param p4, "enableHttps"    # Z

    .prologue
    .line 500
    const/16 v4, 0x2a

    invoke-virtual {p2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 501
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "virtualResourcesPath cannot contain the \'*\' character."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 505
    :cond_0
    new-instance v3, Landroid/net/Uri$Builder;

    invoke-direct {v3}, Landroid/net/Uri$Builder;-><init>()V

    .line 506
    .local v3, "uriBuilder":Landroid/net/Uri$Builder;
    const-string v4, "http"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 507
    invoke-virtual {v3, p1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 508
    invoke-virtual {v3, p2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 510
    const/4 v1, 0x0

    .line 511
    .local v1, "httpPrefix":Landroid/net/Uri;
    const/4 v2, 0x0

    .line 513
    .local v2, "httpsPrefix":Landroid/net/Uri;
    new-instance v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$2;

    invoke-direct {v0, p0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$2;-><init>(Lcom/ionicframework/cordova/webview/WebViewLocalServer;)V

    .line 528
    .local v0, "handler":Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;
    if-eqz p3, :cond_1

    .line 529
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 530
    const-string v4, "**"

    invoke-static {v1, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V

    .line 532
    :cond_1
    if-eqz p4, :cond_2

    .line 533
    const-string v4, "https"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 534
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 535
    const-string v4, "**"

    invoke-static {v2, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V

    .line 537
    :cond_2
    new-instance v4, Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;

    invoke-direct {v4, v1, v2}, Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;-><init>(Landroid/net/Uri;Landroid/net/Uri;)V

    return-object v4
.end method

.method public hostResources(Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
    .locals 1
    .param p1, "virtualResourcesPath"    # Ljava/lang/String;
    .param p2, "enableHttp"    # Z
    .param p3, "enableHttps"    # Z

    .prologue
    .line 481
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->authority:Ljava/lang/String;

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->hostResources(Ljava/lang/String;Ljava/lang/String;ZZ)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;

    move-result-object v0

    return-object v0
.end method

.method register(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)V
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "handler"    # Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;

    .prologue
    .line 358
    iget-object v1, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->uriMatcher:Lcom/ionicframework/cordova/webview/UriMatcher;

    monitor-enter v1

    .line 359
    :try_start_0
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->uriMatcher:Lcom/ionicframework/cordova/webview/UriMatcher;

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v3, v4, p2}, Lcom/ionicframework/cordova/webview/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 360
    monitor-exit v1

    .line 361
    return-void

    .line 360
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public shouldInterceptRequest(Landroid/net/Uri;)Landroid/webkit/WebResourceResponse;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 222
    iget-object v2, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->uriMatcher:Lcom/ionicframework/cordova/webview/UriMatcher;

    monitor-enter v2

    .line 223
    :try_start_0
    iget-object v1, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->uriMatcher:Lcom/ionicframework/cordova/webview/UriMatcher;

    invoke-virtual {v1, p1}, Lcom/ionicframework/cordova/webview/UriMatcher;->match(Landroid/net/Uri;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;

    .line 224
    .local v0, "handler":Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;
    monitor-exit v2

    .line 225
    if-nez v0, :cond_0

    .line 226
    const/4 v1, 0x0

    .line 233
    :goto_0
    return-object v1

    .line 224
    .end local v0    # "handler":Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 229
    .restart local v0    # "handler":Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;
    :cond_0
    iget-boolean v1, p0, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->isLocal:Z

    if-eqz v1, :cond_1

    .line 230
    const-string v1, "SERVER"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Handling local request: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    invoke-direct {p0, p1, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->handleLocalRequest(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)Landroid/webkit/WebResourceResponse;

    move-result-object v1

    goto :goto_0

    .line 233
    :cond_1
    invoke-direct {p0, p1, v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->handleProxyRequest(Landroid/net/Uri;Lcom/ionicframework/cordova/webview/WebViewLocalServer$PathHandler;)Landroid/webkit/WebResourceResponse;

    move-result-object v1

    goto :goto_0
.end method

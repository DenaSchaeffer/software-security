.class public Lcom/ionicframework/cordova/webview/IonicWebViewEngine;
.super Lorg/apache/cordova/engine/SystemWebViewEngine;
.source "IonicWebViewEngine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;
    }
.end annotation


# static fields
.field private static final LAST_BINARY_VERSION_CODE:Ljava/lang/String; = "lastBinaryVersionCode"

.field private static final LAST_BINARY_VERSION_NAME:Ljava/lang/String; = "lastBinaryVersionName"

.field public static final TAG:Ljava/lang/String; = "IonicWebViewEngine"


# instance fields
.field private CDV_LOCAL_SERVER:Ljava/lang/String;

.field private localServer:Lcom/ionicframework/cordova/webview/WebViewLocalServer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/apache/cordova/CordovaPreferences;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferences"    # Lorg/apache/cordova/CordovaPreferences;

    .prologue
    .line 40
    new-instance v0, Lorg/apache/cordova/engine/SystemWebView;

    invoke-direct {v0, p1}, Lorg/apache/cordova/engine/SystemWebView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0, p2}, Lorg/apache/cordova/engine/SystemWebViewEngine;-><init>(Lorg/apache/cordova/engine/SystemWebView;Lorg/apache/cordova/CordovaPreferences;)V

    .line 41
    const-string v0, "IonicWebViewEngine"

    const-string v1, "Ionic Web View Engine Starting Right Up 1..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/engine/SystemWebView;)V
    .locals 2
    .param p1, "webView"    # Lorg/apache/cordova/engine/SystemWebView;

    .prologue
    .line 45
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/cordova/engine/SystemWebViewEngine;-><init>(Lorg/apache/cordova/engine/SystemWebView;Lorg/apache/cordova/CordovaPreferences;)V

    .line 46
    const-string v0, "IonicWebViewEngine"

    const-string v1, "Ionic Web View Engine Starting Right Up 2..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/engine/SystemWebView;Lorg/apache/cordova/CordovaPreferences;)V
    .locals 2
    .param p1, "webView"    # Lorg/apache/cordova/engine/SystemWebView;
    .param p2, "preferences"    # Lorg/apache/cordova/CordovaPreferences;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/engine/SystemWebViewEngine;-><init>(Lorg/apache/cordova/engine/SystemWebView;Lorg/apache/cordova/CordovaPreferences;)V

    .line 51
    const-string v0, "IonicWebViewEngine"

    const-string v1, "Ionic Web View Engine Starting Right Up 3..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    return-void
.end method

.method static synthetic access$000(Lcom/ionicframework/cordova/webview/IonicWebViewEngine;)Lcom/ionicframework/cordova/webview/WebViewLocalServer;
    .locals 1
    .param p0, "x0"    # Lcom/ionicframework/cordova/webview/IonicWebViewEngine;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->localServer:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    return-object v0
.end method

.method static synthetic access$100(Lcom/ionicframework/cordova/webview/IonicWebViewEngine;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/ionicframework/cordova/webview/IonicWebViewEngine;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->CDV_LOCAL_SERVER:Ljava/lang/String;

    return-object v0
.end method

.method private isDeployDisabled()Z
    .locals 3

    .prologue
    .line 104
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "DisableDeploy"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private isNewBinary()Z
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/4 v8, 0x0

    .line 78
    const-string v6, ""

    .line 79
    .local v6, "versionCode":Ljava/lang/String;
    const-string v7, ""

    .line 80
    .local v7, "versionName":Ljava/lang/String;
    iget-object v9, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    const-string v10, "WebViewSettings"

    invoke-virtual {v9, v10, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 81
    .local v5, "prefs":Landroid/content/SharedPreferences;
    const-string v9, "lastBinaryVersionCode"

    invoke-interface {v5, v9, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 82
    .local v2, "lastVersionCode":Ljava/lang/String;
    const-string v9, "lastBinaryVersionName"

    invoke-interface {v5, v9, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 85
    .local v3, "lastVersionName":Ljava/lang/String;
    :try_start_0
    iget-object v9, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    iget-object v10, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v10}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    .line 86
    .local v4, "pInfo":Landroid/content/pm/PackageInfo;
    iget v9, v4, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    .line 87
    iget-object v7, v4, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .end local v4    # "pInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 93
    :cond_0
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 94
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v8, "lastBinaryVersionCode"

    invoke-interface {v0, v8, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 95
    const-string v8, "lastBinaryVersionName"

    invoke-interface {v0, v8, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 96
    const-string v8, "serverBasePath"

    const-string v9, ""

    invoke-interface {v0, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 97
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 98
    const/4 v8, 0x1

    .line 100
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_1
    return v8

    .line 88
    :catch_0
    move-exception v1

    .line 89
    .local v1, "ex":Ljava/lang/Exception;
    const-string v9, "IonicWebViewEngine"

    const-string v10, "Unable to get package info"

    invoke-static {v9, v10, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public getServerBasePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->localServer:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    invoke-virtual {v0}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->getBasePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public init(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebViewEngine$Client;Lorg/apache/cordova/CordovaResourceApi;Lorg/apache/cordova/PluginManager;Lorg/apache/cordova/NativeToJsMessageQueue;)V
    .locals 9
    .param p1, "parentWebView"    # Lorg/apache/cordova/CordovaWebView;
    .param p2, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p3, "client"    # Lorg/apache/cordova/CordovaWebViewEngine$Client;
    .param p4, "resourceApi"    # Lorg/apache/cordova/CordovaResourceApi;
    .param p5, "pluginManager"    # Lorg/apache/cordova/PluginManager;
    .param p6, "nativeToJsMessageQueue"    # Lorg/apache/cordova/NativeToJsMessageQueue;

    .prologue
    .line 58
    new-instance v1, Lorg/apache/cordova/ConfigXmlParser;

    invoke-direct {v1}, Lorg/apache/cordova/ConfigXmlParser;-><init>()V

    .line 59
    .local v1, "parser":Lorg/apache/cordova/ConfigXmlParser;
    invoke-interface {p2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/apache/cordova/ConfigXmlParser;->parse(Landroid/content/Context;)V

    .line 61
    iget-object v5, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v6, "WKPort"

    const-string v7, "8080"

    invoke-virtual {v5, v6, v7}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 62
    .local v3, "port":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "http://localhost:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->CDV_LOCAL_SERVER:Ljava/lang/String;

    .line 64
    new-instance v5, Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    invoke-interface {p2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "localhost:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    invoke-direct {v5, v6, v7, v8, v1}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;-><init>(Landroid/content/Context;Ljava/lang/String;ZLorg/apache/cordova/ConfigXmlParser;)V

    iput-object v5, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->localServer:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    .line 65
    iget-object v5, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->localServer:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    const-string v6, "www"

    invoke-virtual {v5, v6}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->hostAssets(Ljava/lang/String;)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;

    move-result-object v0

    .line 67
    .local v0, "ahd":Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;
    iget-object v5, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->webView:Lorg/apache/cordova/engine/SystemWebView;

    new-instance v6, Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;

    invoke-direct {v6, p0, p0, v1}, Lcom/ionicframework/cordova/webview/IonicWebViewEngine$ServerClient;-><init>(Lcom/ionicframework/cordova/webview/IonicWebViewEngine;Lorg/apache/cordova/engine/SystemWebViewEngine;Lorg/apache/cordova/ConfigXmlParser;)V

    invoke-virtual {v5, v6}, Lorg/apache/cordova/engine/SystemWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 69
    invoke-super/range {p0 .. p6}, Lorg/apache/cordova/engine/SystemWebViewEngine;->init(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebViewEngine$Client;Lorg/apache/cordova/CordovaResourceApi;Lorg/apache/cordova/PluginManager;Lorg/apache/cordova/NativeToJsMessageQueue;)V

    .line 70
    invoke-interface {p2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "WebViewSettings"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 71
    .local v4, "prefs":Landroid/content/SharedPreferences;
    const-string v5, "serverBasePath"

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 72
    .local v2, "path":Ljava/lang/String;
    invoke-direct {p0}, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->isDeployDisabled()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-direct {p0}, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->isNewBinary()Z

    move-result v5

    if-nez v5, :cond_0

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 73
    invoke-virtual {p0, v2}, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->setServerBasePath(Ljava/lang/String;)V

    .line 75
    :cond_0
    return-void
.end method

.method public setServerBasePath(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->localServer:Lcom/ionicframework/cordova/webview/WebViewLocalServer;

    invoke-virtual {v0, p1}, Lcom/ionicframework/cordova/webview/WebViewLocalServer;->hostFiles(Ljava/lang/String;)Lcom/ionicframework/cordova/webview/WebViewLocalServer$AssetHostingDetails;

    .line 147
    iget-object v0, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->webView:Lorg/apache/cordova/engine/SystemWebView;

    iget-object v1, p0, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->CDV_LOCAL_SERVER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/cordova/engine/SystemWebView;->loadUrl(Ljava/lang/String;)V

    .line 148
    return-void
.end method

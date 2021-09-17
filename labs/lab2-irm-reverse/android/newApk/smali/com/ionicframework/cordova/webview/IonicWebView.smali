.class public Lcom/ionicframework/cordova/webview/IonicWebView;
.super Lorg/apache/cordova/CordovaPlugin;
.source "IonicWebView.java"


# static fields
.field public static final CDV_SERVER_PATH:Ljava/lang/String; = "serverBasePath"

.field public static final WEBVIEW_PREFS_NAME:Ljava/lang/String; = "WebViewSettings"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 7
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 18
    const-string v3, "setServerBasePath"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 19
    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 20
    .local v1, "path":Ljava/lang/String;
    iget-object v3, p0, Lcom/ionicframework/cordova/webview/IonicWebView;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v5, Lcom/ionicframework/cordova/webview/IonicWebView$1;

    invoke-direct {v5, p0, v1}, Lcom/ionicframework/cordova/webview/IonicWebView$1;-><init>(Lcom/ionicframework/cordova/webview/IonicWebView;Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    move v3, v4

    .line 37
    .end local v1    # "path":Ljava/lang/String;
    :goto_0
    return v3

    .line 26
    :cond_0
    const-string v3, "getServerBasePath"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 27
    iget-object v3, p0, Lcom/ionicframework/cordova/webview/IonicWebView;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaWebView;->getEngine()Lorg/apache/cordova/CordovaWebViewEngine;

    move-result-object v3

    check-cast v3, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;

    invoke-virtual {v3}, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->getServerBasePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    move v3, v4

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string v3, "persistServerBasePath"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 30
    iget-object v3, p0, Lcom/ionicframework/cordova/webview/IonicWebView;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaWebView;->getEngine()Lorg/apache/cordova/CordovaWebViewEngine;

    move-result-object v3

    check-cast v3, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;

    invoke-virtual {v3}, Lcom/ionicframework/cordova/webview/IonicWebViewEngine;->getServerBasePath()Ljava/lang/String;

    move-result-object v1

    .line 31
    .restart local v1    # "path":Ljava/lang/String;
    iget-object v3, p0, Lcom/ionicframework/cordova/webview/IonicWebView;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v6, "WebViewSettings"

    invoke-virtual {v3, v6, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 32
    .local v2, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 33
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v3, "serverBasePath"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 34
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    move v3, v4

    .line 35
    goto :goto_0

    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "path":Ljava/lang/String;
    .end local v2    # "prefs":Landroid/content/SharedPreferences;
    :cond_2
    move v3, v5

    .line 37
    goto :goto_0
.end method

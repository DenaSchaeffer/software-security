.class public Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;
.super Lorg/apache/cordova/CordovaPlugin;
.source "BarcodeScanner.java"


# static fields
.field private static final CANCELLED:Ljava/lang/String; = "cancelled"

.field private static final DATA:Ljava/lang/String; = "data"

.field private static final DISABLE_BEEP:Ljava/lang/String; = "disableSuccessBeep"

.field private static final EMAIL_TYPE:Ljava/lang/String; = "EMAIL_TYPE"

.field private static final ENCODE:Ljava/lang/String; = "encode"

.field private static final FORMAT:Ljava/lang/String; = "format"

.field private static final FORMATS:Ljava/lang/String; = "formats"

.field private static final LOG_TAG:Ljava/lang/String; = "BarcodeScanner"

.field private static final ORIENTATION:Ljava/lang/String; = "orientation"

.field private static final PHONE_TYPE:Ljava/lang/String; = "PHONE_TYPE"

.field private static final PREFER_FRONTCAMERA:Ljava/lang/String; = "preferFrontCamera"

.field private static final PROMPT:Ljava/lang/String; = "prompt"

.field public static final REQUEST_CODE:I = 0xba7c

.field private static final RESULTDISPLAY_DURATION:Ljava/lang/String; = "resultDisplayDuration"

.field private static final SAVE_HISTORY:Ljava/lang/String; = "saveHistory"

.field private static final SCAN:Ljava/lang/String; = "scan"

.field private static final SHOW_FLIP_CAMERA_BUTTON:Ljava/lang/String; = "showFlipCameraButton"

.field private static final SHOW_TORCH_BUTTON:Ljava/lang/String; = "showTorchButton"

.field private static final SMS_TYPE:Ljava/lang/String; = "SMS_TYPE"

.field private static final TEXT:Ljava/lang/String; = "text"

.field private static final TEXT_TYPE:Ljava/lang/String; = "TEXT_TYPE"

.field private static final TORCH_ON:Ljava/lang/String; = "torchOn"

.field private static final TYPE:Ljava/lang/String; = "type"


# instance fields
.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field private permissions:[Ljava/lang/String;

.field private requestArgs:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 63
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.CAMERA"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->permissions:[Ljava/lang/String;

    .line 72
    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 256
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/google/zxing/client/android/encode/EncodeActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 257
    .local v0, "intentEncode":Landroid/content/Intent;
    const-string v1, "com.google.zxing.client.android.ENCODE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 258
    const-string v1, "ENCODE_TYPE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 259
    const-string v1, "ENCODE_DATA"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 261
    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 263
    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 264
    return-void
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 6
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 92
    iput-object p3, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 93
    iput-object p2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->requestArgs:Lorg/json/JSONArray;

    .line 95
    const-string v5, "encode"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 96
    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 97
    .local v1, "obj":Lorg/json/JSONObject;
    if-eqz v1, :cond_2

    .line 98
    const-string v4, "type"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, "type":Ljava/lang/String;
    const-string v4, "data"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 102
    .local v0, "data":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 103
    const-string v2, "TEXT_TYPE"

    .line 106
    :cond_0
    if-nez v0, :cond_1

    .line 107
    const-string v4, "User did not specify data to encode"

    invoke-virtual {p3, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 127
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "obj":Lorg/json/JSONObject;
    .end local v2    # "type":Ljava/lang/String;
    :goto_0
    return v3

    .line 111
    .restart local v0    # "data":Ljava/lang/String;
    .restart local v1    # "obj":Lorg/json/JSONObject;
    .restart local v2    # "type":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v2, v0}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->encode(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 113
    .end local v0    # "data":Ljava/lang/String;
    .end local v2    # "type":Ljava/lang/String;
    :cond_2
    const-string v4, "User did not specify data to encode"

    invoke-virtual {p3, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 116
    .end local v1    # "obj":Lorg/json/JSONObject;
    :cond_3
    const-string v5, "scan"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 119
    invoke-virtual {p0}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->hasPermisssion()Z

    move-result v5

    if-nez v5, :cond_4

    .line 120
    invoke-virtual {p0, v4}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->requestPermissions(I)V

    goto :goto_0

    .line 122
    :cond_4
    invoke-virtual {p0, p2}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->scan(Lorg/json/JSONArray;)V

    goto :goto_0

    :cond_5
    move v3, v4

    .line 125
    goto :goto_0
.end method

.method public hasPermisssion()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 270
    iget-object v3, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->permissions:[Ljava/lang/String;

    array-length v4, v3

    move v2, v1

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v0, v3, v2

    .line 272
    .local v0, "p":Ljava/lang/String;
    invoke-static {p0, v0}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 277
    .end local v0    # "p":Ljava/lang/String;
    :goto_1
    return v1

    .line 270
    .restart local v0    # "p":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 277
    .end local v0    # "p":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 219
    const v2, 0xba7c

    if-ne p1, v2, :cond_0

    iget-object v2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v2, :cond_0

    .line 220
    const/4 v2, -0x1

    if-ne p2, v2, :cond_1

    .line 221
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 223
    .local v1, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "text"

    const-string v3, "SCAN_RESULT"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 224
    const-string v2, "format"

    const-string v3, "SCAN_RESULT_FORMAT"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 225
    const-string v2, "cancelled"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :goto_0
    iget-object v2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 247
    .end local v1    # "obj":Lorg/json/JSONObject;
    :cond_0
    :goto_1
    return-void

    .line 226
    .restart local v1    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 227
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "BarcodeScanner"

    const-string v3, "This should never happen"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 231
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "obj":Lorg/json/JSONObject;
    :cond_1
    if-nez p2, :cond_2

    .line 232
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 234
    .restart local v1    # "obj":Lorg/json/JSONObject;
    :try_start_1
    const-string v2, "text"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 235
    const-string v2, "format"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 236
    const-string v2, "cancelled"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 241
    :goto_2
    iget-object v2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_1

    .line 237
    :catch_1
    move-exception v0

    .line 238
    .restart local v0    # "e":Lorg/json/JSONException;
    const-string v2, "BarcodeScanner"

    const-string v3, "This should never happen"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 244
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "obj":Lorg/json/JSONObject;
    :cond_2
    iget-object v2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callbackContext:Lorg/apache/cordova/CallbackContext;

    const-string v3, "Unexpected error"

    invoke-virtual {v2, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 302
    array-length v3, p3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget v0, p3, v2

    .line 303
    .local v0, "r":I
    const/4 v4, -0x1

    if-ne v0, v4, :cond_0

    .line 304
    const-string v2, "BarcodeScanner"

    const-string v3, "Permission Denied!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ILLEGAL_ACCESS_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 306
    .local v1, "result":Lorg/apache/cordova/PluginResult;
    iget-object v2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 317
    .end local v0    # "r":I
    .end local v1    # "result":Lorg/apache/cordova/PluginResult;
    :goto_1
    return-void

    .line 302
    .restart local v0    # "r":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 311
    .end local v0    # "r":I
    :cond_1
    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 314
    :pswitch_0
    iget-object v2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->requestArgs:Lorg/json/JSONArray;

    invoke-virtual {p0, v2}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->scan(Lorg/json/JSONArray;)V

    goto :goto_1

    .line 311
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onRestoreStateForActivityResult(Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "state"    # Landroid/os/Bundle;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 325
    iput-object p2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 326
    return-void
.end method

.method public requestPermissions(I)V
    .locals 1
    .param p1, "requestCode"    # I

    .prologue
    .line 288
    iget-object v0, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->permissions:[Ljava/lang/String;

    invoke-static {p0, p1, v0}, Lorg/apache/cordova/PermissionHelper;->requestPermissions(Lorg/apache/cordova/CordovaPlugin;I[Ljava/lang/String;)V

    .line 289
    return-void
.end method

.method public scan(Lorg/json/JSONArray;)V
    .locals 3
    .param p1, "args"    # Lorg/json/JSONArray;

    .prologue
    .line 135
    move-object v0, p0

    .line 137
    .local v0, "that":Lorg/apache/cordova/CordovaPlugin;
    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;

    invoke-direct {v2, p0, v0, p1}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;-><init>(Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;Lorg/apache/cordova/CordovaPlugin;Lorg/json/JSONArray;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 207
    return-void
.end method

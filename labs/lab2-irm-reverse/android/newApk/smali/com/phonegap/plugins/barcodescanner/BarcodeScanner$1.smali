.class Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;
.super Ljava/lang/Object;
.source "BarcodeScanner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->scan(Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;

.field final synthetic val$args:Lorg/json/JSONArray;

.field final synthetic val$that:Lorg/apache/cordova/CordovaPlugin;


# direct methods
.method constructor <init>(Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;Lorg/apache/cordova/CordovaPlugin;Lorg/json/JSONArray;)V
    .locals 0
    .param p1, "this$0"    # Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;->this$0:Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;

    iput-object p2, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;->val$that:Lorg/apache/cordova/CordovaPlugin;

    iput-object p3, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;->val$args:Lorg/json/JSONArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 140
    new-instance v3, Landroid/content/Intent;

    iget-object v9, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;->val$that:Lorg/apache/cordova/CordovaPlugin;

    iget-object v9, v9, Lorg/apache/cordova/CordovaPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v9

    const-class v10, Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {v3, v9, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 141
    .local v3, "intentScan":Landroid/content/Intent;
    const-string v9, "com.google.zxing.client.android.SCAN"

    invoke-virtual {v3, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 142
    const-string v9, "android.intent.category.DEFAULT"

    invoke-virtual {v3, v9}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 145
    iget-object v9, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;->val$args:Lorg/json/JSONArray;

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-lez v9, :cond_9

    .line 152
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v9, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;->val$args:Lorg/json/JSONArray;

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v2, v9, :cond_9

    .line 155
    :try_start_0
    iget-object v9, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;->val$args:Lorg/json/JSONArray;

    invoke-virtual {v9, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 161
    .local v7, "obj":Lorg/json/JSONObject;
    invoke-virtual {v7}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v6

    .line 162
    .local v6, "names":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v4, v9, :cond_3

    .line 164
    :try_start_1
    invoke-virtual {v6, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 165
    .local v5, "key":Ljava/lang/String;
    invoke-virtual {v7, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 167
    .local v8, "value":Ljava/lang/Object;
    instance-of v9, v8, Ljava/lang/Integer;

    if-eqz v9, :cond_2

    .line 168
    check-cast v8, Ljava/lang/Integer;

    .end local v8    # "value":Ljava/lang/Object;
    invoke-virtual {v3, v5, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 162
    .end local v5    # "key":Ljava/lang/String;
    :cond_0
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 156
    .end local v4    # "j":I
    .end local v6    # "names":Lorg/json/JSONArray;
    .end local v7    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 157
    .local v1, "e":Lorg/json/JSONException;
    const-string v9, "CordovaLog"

    invoke-virtual {v1}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_1
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 169
    .restart local v4    # "j":I
    .restart local v5    # "key":Ljava/lang/String;
    .restart local v6    # "names":Lorg/json/JSONArray;
    .restart local v7    # "obj":Lorg/json/JSONObject;
    .restart local v8    # "value":Ljava/lang/Object;
    :cond_2
    :try_start_2
    instance-of v9, v8, Ljava/lang/String;

    if-eqz v9, :cond_0

    .line 170
    check-cast v8, Ljava/lang/String;

    .end local v8    # "value":Ljava/lang/Object;
    invoke-virtual {v3, v5, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 173
    .end local v5    # "key":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 174
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v9, "CordovaLog"

    invoke-virtual {v1}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 178
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_3
    const-string v10, "SCAN_CAMERA_ID"

    const-string v9, "preferFrontCamera"

    const/4 v11, 0x0

    invoke-virtual {v7, v9, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v9

    if-eqz v9, :cond_7

    const/4 v9, 0x1

    :goto_4
    invoke-virtual {v3, v10, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 179
    const-string v9, "SHOW_FLIP_CAMERA_BUTTON"

    const-string v10, "showFlipCameraButton"

    const/4 v11, 0x0

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v10

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 180
    const-string v9, "SHOW_TORCH_BUTTON"

    const-string v10, "showTorchButton"

    const/4 v11, 0x0

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v10

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 181
    const-string v9, "TORCH_ON"

    const-string v10, "torchOn"

    const/4 v11, 0x0

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v10

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 182
    const-string v9, "SAVE_HISTORY"

    const-string v10, "saveHistory"

    const/4 v11, 0x0

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v10

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 183
    const-string v9, "disableSuccessBeep"

    const/4 v10, 0x0

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 184
    .local v0, "beep":Z
    const-string v10, "BEEP_ON_SCAN"

    if-nez v0, :cond_8

    const/4 v9, 0x1

    :goto_5
    invoke-virtual {v3, v10, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 185
    const-string v9, "resultDisplayDuration"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 186
    const-string v9, "RESULT_DISPLAY_DURATION_MS"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, ""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "resultDisplayDuration"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v12

    invoke-virtual {v10, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 188
    :cond_4
    const-string v9, "formats"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 189
    const-string v9, "SCAN_FORMATS"

    const-string v10, "formats"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 191
    :cond_5
    const-string v9, "prompt"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 192
    const-string v9, "PROMPT_MESSAGE"

    const-string v10, "prompt"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 194
    :cond_6
    const-string v9, "orientation"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 195
    const-string v9, "ORIENTATION_LOCK"

    const-string v10, "orientation"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto/16 :goto_3

    .line 178
    .end local v0    # "beep":Z
    :cond_7
    const/4 v9, 0x0

    goto/16 :goto_4

    .line 184
    .restart local v0    # "beep":Z
    :cond_8
    const/4 v9, 0x0

    goto :goto_5

    .line 202
    .end local v0    # "beep":Z
    .end local v2    # "i":I
    .end local v4    # "j":I
    .end local v6    # "names":Lorg/json/JSONArray;
    .end local v7    # "obj":Lorg/json/JSONObject;
    :cond_9
    iget-object v9, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;->val$that:Lorg/apache/cordova/CordovaPlugin;

    iget-object v9, v9, Lorg/apache/cordova/CordovaPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 204
    iget-object v9, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;->val$that:Lorg/apache/cordova/CordovaPlugin;

    iget-object v9, v9, Lorg/apache/cordova/CordovaPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    iget-object v10, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner$1;->val$that:Lorg/apache/cordova/CordovaPlugin;

    const v11, 0xba7c

    invoke-interface {v9, v10, v3, v11}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    .line 205
    return-void
.end method

.class Lorg/apache/cordova/file/FileUtils$17;
.super Ljava/lang/Object;
.source "FileUtils.java"

# interfaces
.implements Lorg/apache/cordova/file/FileUtils$FileOp;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/file/FileUtils;->execute(Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/file/FileUtils;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$rawArgs:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/file/FileUtils;

    .prologue
    .line 437
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$17;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$17;->val$rawArgs:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/file/FileUtils$17;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/json/JSONArray;)V
    .locals 9
    .param p1, "args"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/TypeMismatchException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v0, 0x0

    const/4 v8, 0x2

    .line 439
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 440
    .local v1, "dirname":Ljava/lang/String;
    invoke-virtual {p1, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 441
    .local v4, "path":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/cordova/file/FileUtils$17;->this$0:Lorg/apache/cordova/file/FileUtils;

    invoke-static {v5, v1}, Lorg/apache/cordova/file/FileUtils;->access$000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "nativeURL"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 442
    .local v2, "nativeURL":Ljava/lang/String;
    invoke-virtual {p1, v8}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 444
    .local v0, "containsCreate":Z
    :goto_0
    if-eqz v0, :cond_1

    iget-object v5, p0, Lorg/apache/cordova/file/FileUtils$17;->this$0:Lorg/apache/cordova/file/FileUtils;

    const/4 v6, 0x3

    invoke-static {v5, v2, v6}, Lorg/apache/cordova/file/FileUtils;->access$100(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 445
    iget-object v5, p0, Lorg/apache/cordova/file/FileUtils$17;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v6, p0, Lorg/apache/cordova/file/FileUtils$17;->val$rawArgs:Ljava/lang/String;

    iget-object v7, p0, Lorg/apache/cordova/file/FileUtils$17;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {v5, v6, v8, v7}, Lorg/apache/cordova/file/FileUtils;->access$200(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V

    .line 454
    :goto_1
    return-void

    .line 442
    .end local v0    # "containsCreate":Z
    :cond_0
    invoke-virtual {p1, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "create"

    invoke-virtual {v5, v6, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0

    .line 447
    .restart local v0    # "containsCreate":Z
    :cond_1
    if-nez v0, :cond_2

    iget-object v5, p0, Lorg/apache/cordova/file/FileUtils$17;->this$0:Lorg/apache/cordova/file/FileUtils;

    const/4 v6, 0x4

    invoke-static {v5, v2, v6}, Lorg/apache/cordova/file/FileUtils;->access$100(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 448
    iget-object v5, p0, Lorg/apache/cordova/file/FileUtils$17;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v6, p0, Lorg/apache/cordova/file/FileUtils$17;->val$rawArgs:Ljava/lang/String;

    iget-object v7, p0, Lorg/apache/cordova/file/FileUtils$17;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {v5, v6, v8, v7}, Lorg/apache/cordova/file/FileUtils;->access$900(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V

    goto :goto_1

    .line 451
    :cond_2
    iget-object v5, p0, Lorg/apache/cordova/file/FileUtils$17;->this$0:Lorg/apache/cordova/file/FileUtils;

    invoke-virtual {p1, v8}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v5, v1, v4, v6, v7}, Lorg/apache/cordova/file/FileUtils;->access$1000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object v3

    .line 452
    .local v3, "obj":Lorg/json/JSONObject;
    iget-object v5, p0, Lorg/apache/cordova/file/FileUtils$17;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v5, v3}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_1
.end method

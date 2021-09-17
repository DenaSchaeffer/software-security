.class public final Lcom/google/zxing/client/android/clipboard/ClipboardInterface;
.super Ljava/lang/Object;
.source "ClipboardInterface.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/google/zxing/client/android/clipboard/ClipboardInterface;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/clipboard/ClipboardInterface;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method private static getManager(Landroid/content/Context;)Landroid/content/ClipboardManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    return-object v0
.end method

.method public static getText(Landroid/content/Context;)Ljava/lang/CharSequence;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-static {p0}, Lcom/google/zxing/client/android/clipboard/ClipboardInterface;->getManager(Landroid/content/Context;)Landroid/content/ClipboardManager;

    move-result-object v1

    .line 36
    .local v1, "clipboard":Landroid/content/ClipboardManager;
    invoke-virtual {v1}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v0

    .line 37
    .local v0, "clip":Landroid/content/ClipData;
    invoke-static {p0}, Lcom/google/zxing/client/android/clipboard/ClipboardInterface;->hasText(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v2

    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static hasText(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    invoke-static {p0}, Lcom/google/zxing/client/android/clipboard/ClipboardInterface;->getManager(Landroid/content/Context;)Landroid/content/ClipboardManager;

    move-result-object v1

    .line 53
    .local v1, "clipboard":Landroid/content/ClipboardManager;
    invoke-virtual {v1}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v0

    .line 54
    .local v0, "clip":Landroid/content/ClipData;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/ClipData;->getItemCount()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static setText(Ljava/lang/CharSequence;Landroid/content/Context;)V
    .locals 3
    .param p0, "text"    # Ljava/lang/CharSequence;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    if-eqz p0, :cond_0

    .line 43
    :try_start_0
    invoke-static {p1}, Lcom/google/zxing/client/android/clipboard/ClipboardInterface;->getManager(Landroid/content/Context;)Landroid/content/ClipboardManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v2, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    .line 49
    :cond_0
    :goto_0
    return-void

    .line 44
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_1
    sget-object v1, Lcom/google/zxing/client/android/clipboard/ClipboardInterface;->TAG:Ljava/lang/String;

    const-string v2, "Clipboard bug"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 44
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v0

    goto :goto_1
.end method

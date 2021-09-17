.class Lcom/google/zxing/client/android/CaptureActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "CaptureActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/zxing/client/android/CaptureActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/zxing/client/android/CaptureActivity;


# direct methods
.method constructor <init>(Lcom/google/zxing/client/android/CaptureActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/zxing/client/android/CaptureActivity;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/google/zxing/client/android/CaptureActivity$1;->this$0:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 163
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity$1;->this$0:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/CaptureActivity;->finish()V

    .line 164
    return-void
.end method

.class Lcom/google/zxing/client/android/CaptureActivity$2;
.super Ljava/lang/Object;
.source "CaptureActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/zxing/client/android/CaptureActivity;->resetStatusView()V
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
    .line 826
    iput-object p1, p0, Lcom/google/zxing/client/android/CaptureActivity$2;->this$0:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    .line 829
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity$2;->this$0:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "SCAN_CAMERA_ID"

    const/4 v4, -0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 830
    .local v0, "reqCamId":I
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity$2;->this$0:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "SCAN_CAMERA_ID"

    if-ne v0, v2, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v3, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 831
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity$2;->this$0:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "SHOW_FLIP_CAMERA_BUTTON"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 832
    iget-object v1, p0, Lcom/google/zxing/client/android/CaptureActivity$2;->this$0:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/CaptureActivity;->recreate()V

    .line 833
    return-void

    :cond_0
    move v1, v2

    .line 830
    goto :goto_0
.end method

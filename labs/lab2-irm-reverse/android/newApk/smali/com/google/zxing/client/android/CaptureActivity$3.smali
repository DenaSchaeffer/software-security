.class Lcom/google/zxing/client/android/CaptureActivity$3;
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
    .line 845
    iput-object p1, p0, Lcom/google/zxing/client/android/CaptureActivity$3;->this$0:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 848
    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity$3;->this$0:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-static {v0}, Lcom/google/zxing/client/android/CaptureActivity;->access$000(Lcom/google/zxing/client/android/CaptureActivity;)Lcom/google/zxing/client/android/camera/CameraManager;

    move-result-object v1

    iget-object v0, p0, Lcom/google/zxing/client/android/CaptureActivity$3;->this$0:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-static {v0}, Lcom/google/zxing/client/android/CaptureActivity;->access$000(Lcom/google/zxing/client/android/CaptureActivity;)Lcom/google/zxing/client/android/camera/CameraManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/zxing/client/android/camera/CameraManager;->isTorchOn()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/google/zxing/client/android/camera/CameraManager;->setTorch(Z)V

    .line 849
    return-void

    .line 848
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

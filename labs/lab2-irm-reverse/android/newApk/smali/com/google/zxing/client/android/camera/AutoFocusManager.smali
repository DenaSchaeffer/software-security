.class final Lcom/google/zxing/client/android/camera/AutoFocusManager;
.super Ljava/lang/Object;
.source "AutoFocusManager.java"

# interfaces
.implements Landroid/hardware/Camera$AutoFocusCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/client/android/camera/AutoFocusManager$AutoFocusTask;
    }
.end annotation


# static fields
.field private static final AUTO_FOCUS_INTERVAL_MS:J = 0x7d0L

.field private static final FOCUS_MODES_CALLING_AF:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final camera:Landroid/hardware/Camera;

.field private focusing:Z

.field private outstandingTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask",
            "<***>;"
        }
    .end annotation
.end field

.field private stopped:Z

.field private final useAutoFocus:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 34
    const-class v0, Lcom/google/zxing/client/android/camera/AutoFocusManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->TAG:Ljava/lang/String;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->FOCUS_MODES_CALLING_AF:Ljava/util/Collection;

    .line 40
    sget-object v0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->FOCUS_MODES_CALLING_AF:Ljava/util/Collection;

    const-string v1, "auto"

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 41
    sget-object v0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->FOCUS_MODES_CALLING_AF:Ljava/util/Collection;

    const-string v1, "macro"

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 42
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/hardware/Camera;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    const/4 v2, 0x1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p2, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->camera:Landroid/hardware/Camera;

    .line 52
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 53
    .local v1, "sharedPrefs":Landroid/content/SharedPreferences;
    invoke-virtual {p2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v3

    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "currentFocusMode":Ljava/lang/String;
    const-string v3, "preferences_auto_focus"

    .line 55
    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    sget-object v3, Lcom/google/zxing/client/android/camera/AutoFocusManager;->FOCUS_MODES_CALLING_AF:Ljava/util/Collection;

    .line 56
    invoke-interface {v3, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :goto_0
    iput-boolean v2, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->useAutoFocus:Z

    .line 57
    sget-object v2, Lcom/google/zxing/client/android/camera/AutoFocusManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Current focus mode \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'; use auto focus? "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->useAutoFocus:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    invoke-virtual {p0}, Lcom/google/zxing/client/android/camera/AutoFocusManager;->start()V

    .line 59
    return-void

    .line 56
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private declared-synchronized autoFocusAgainLater()V
    .locals 4

    .prologue
    .line 68
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->stopped:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->outstandingTask:Landroid/os/AsyncTask;

    if-nez v2, :cond_0

    .line 69
    new-instance v0, Lcom/google/zxing/client/android/camera/AutoFocusManager$AutoFocusTask;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/google/zxing/client/android/camera/AutoFocusManager$AutoFocusTask;-><init>(Lcom/google/zxing/client/android/camera/AutoFocusManager;Lcom/google/zxing/client/android/camera/AutoFocusManager$1;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    .local v0, "newTask":Lcom/google/zxing/client/android/camera/AutoFocusManager$AutoFocusTask;
    :try_start_1
    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lcom/google/zxing/client/android/camera/AutoFocusManager$AutoFocusTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 72
    iput-object v0, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->outstandingTask:Landroid/os/AsyncTask;
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    .end local v0    # "newTask":Lcom/google/zxing/client/android/camera/AutoFocusManager$AutoFocusTask;
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 73
    .restart local v0    # "newTask":Lcom/google/zxing/client/android/camera/AutoFocusManager$AutoFocusTask;
    :catch_0
    move-exception v1

    .line 74
    .local v1, "ree":Ljava/util/concurrent/RejectedExecutionException;
    :try_start_2
    sget-object v2, Lcom/google/zxing/client/android/camera/AutoFocusManager;->TAG:Ljava/lang/String;

    const-string v3, "Could not request auto focus"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 68
    .end local v0    # "newTask":Lcom/google/zxing/client/android/camera/AutoFocusManager$AutoFocusTask;
    .end local v1    # "ree":Ljava/util/concurrent/RejectedExecutionException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private declared-synchronized cancelOutstandingTask()V
    .locals 2

    .prologue
    .line 97
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->outstandingTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_1

    .line 98
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->outstandingTask:Landroid/os/AsyncTask;

    invoke-virtual {v0}, Landroid/os/AsyncTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_0

    .line 99
    iget-object v0, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->outstandingTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 101
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->outstandingTask:Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    :cond_1
    monitor-exit p0

    return-void

    .line 97
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized onAutoFocus(ZLandroid/hardware/Camera;)V
    .locals 1
    .param p1, "success"    # Z
    .param p2, "theCamera"    # Landroid/hardware/Camera;

    .prologue
    .line 63
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->focusing:Z

    .line 64
    invoke-direct {p0}, Lcom/google/zxing/client/android/camera/AutoFocusManager;->autoFocusAgainLater()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    monitor-exit p0

    return-void

    .line 63
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized start()V
    .locals 3

    .prologue
    .line 80
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->useAutoFocus:Z

    if-eqz v1, :cond_0

    .line 81
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->outstandingTask:Landroid/os/AsyncTask;

    .line 82
    iget-boolean v1, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->stopped:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->focusing:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 84
    :try_start_1
    iget-object v1, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1, p0}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 85
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->focusing:Z
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 86
    :catch_0
    move-exception v0

    .line 88
    .local v0, "re":Ljava/lang/RuntimeException;
    :try_start_2
    sget-object v1, Lcom/google/zxing/client/android/camera/AutoFocusManager;->TAG:Ljava/lang/String;

    const-string v2, "Unexpected exception while focusing"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 90
    invoke-direct {p0}, Lcom/google/zxing/client/android/camera/AutoFocusManager;->autoFocusAgainLater()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 80
    .end local v0    # "re":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized stop()V
    .locals 3

    .prologue
    .line 106
    monitor-enter p0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->stopped:Z

    .line 107
    iget-boolean v1, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->useAutoFocus:Z

    if-eqz v1, :cond_0

    .line 108
    invoke-direct {p0}, Lcom/google/zxing/client/android/camera/AutoFocusManager;->cancelOutstandingTask()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    :try_start_1
    iget-object v1, p0, Lcom/google/zxing/client/android/camera/AutoFocusManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->cancelAutoFocus()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 112
    :catch_0
    move-exception v0

    .line 114
    .local v0, "re":Ljava/lang/RuntimeException;
    :try_start_2
    sget-object v1, Lcom/google/zxing/client/android/camera/AutoFocusManager;->TAG:Ljava/lang/String;

    const-string v2, "Unexpected exception while cancelling focusing"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 106
    .end local v0    # "re":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

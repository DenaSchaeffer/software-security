.class final Lcom/google/zxing/client/android/InactivityTimer;
.super Ljava/lang/Object;
.source "InactivityTimer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/client/android/InactivityTimer$InactivityAsyncTask;,
        Lcom/google/zxing/client/android/InactivityTimer$PowerStatusReceiver;
    }
.end annotation


# static fields
.field private static final INACTIVITY_DELAY_MS:J = 0x493e0L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final activity:Landroid/app/Activity;

.field private inactivityTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final powerStatusReceiver:Landroid/content/BroadcastReceiver;

.field private registered:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lcom/google/zxing/client/android/InactivityTimer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/InactivityTimer;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/google/zxing/client/android/InactivityTimer;->activity:Landroid/app/Activity;

    .line 44
    new-instance v0, Lcom/google/zxing/client/android/InactivityTimer$PowerStatusReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/zxing/client/android/InactivityTimer$PowerStatusReceiver;-><init>(Lcom/google/zxing/client/android/InactivityTimer;Lcom/google/zxing/client/android/InactivityTimer$1;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->powerStatusReceiver:Landroid/content/BroadcastReceiver;

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->registered:Z

    .line 46
    invoke-virtual {p0}, Lcom/google/zxing/client/android/InactivityTimer;->onActivity()V

    .line 47
    return-void
.end method

.method static synthetic access$200(Lcom/google/zxing/client/android/InactivityTimer;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/zxing/client/android/InactivityTimer;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/google/zxing/client/android/InactivityTimer;->cancel()V

    return-void
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/google/zxing/client/android/InactivityTimer;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/zxing/client/android/InactivityTimer;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/google/zxing/client/android/InactivityTimer;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method private declared-synchronized cancel()V
    .locals 2

    .prologue
    .line 76
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->inactivityTask:Landroid/os/AsyncTask;

    .line 77
    .local v0, "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<***>;"
    if-eqz v0, :cond_0

    .line 78
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 79
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/zxing/client/android/InactivityTimer;->inactivityTask:Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    :cond_0
    monitor-exit p0

    return-void

    .line 76
    .end local v0    # "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<***>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method declared-synchronized onActivity()V
    .locals 3

    .prologue
    .line 50
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/google/zxing/client/android/InactivityTimer;->cancel()V

    .line 51
    new-instance v0, Lcom/google/zxing/client/android/InactivityTimer$InactivityAsyncTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/zxing/client/android/InactivityTimer$InactivityAsyncTask;-><init>(Lcom/google/zxing/client/android/InactivityTimer;Lcom/google/zxing/client/android/InactivityTimer$1;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->inactivityTask:Landroid/os/AsyncTask;

    .line 52
    iget-object v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->inactivityTask:Landroid/os/AsyncTask;

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    monitor-exit p0

    return-void

    .line 50
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized onPause()V
    .locals 2

    .prologue
    .line 56
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/google/zxing/client/android/InactivityTimer;->cancel()V

    .line 57
    iget-boolean v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->registered:Z

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/google/zxing/client/android/InactivityTimer;->powerStatusReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 59
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->registered:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    :goto_0
    monitor-exit p0

    return-void

    .line 61
    :cond_0
    :try_start_1
    sget-object v0, Lcom/google/zxing/client/android/InactivityTimer;->TAG:Ljava/lang/String;

    const-string v1, "PowerStatusReceiver was never registered?"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 56
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized onResume()V
    .locals 4

    .prologue
    .line 66
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->registered:Z

    if-eqz v0, :cond_0

    .line 67
    sget-object v0, Lcom/google/zxing/client/android/InactivityTimer;->TAG:Ljava/lang/String;

    const-string v1, "PowerStatusReceiver was already registered?"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    :goto_0
    invoke-virtual {p0}, Lcom/google/zxing/client/android/InactivityTimer;->onActivity()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    monitor-exit p0

    return-void

    .line 69
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/google/zxing/client/android/InactivityTimer;->powerStatusReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/zxing/client/android/InactivityTimer;->registered:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 66
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method shutdown()V
    .locals 0

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/google/zxing/client/android/InactivityTimer;->cancel()V

    .line 85
    return-void
.end method

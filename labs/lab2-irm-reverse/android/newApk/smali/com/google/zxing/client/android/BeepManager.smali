.class final Lcom/google/zxing/client/android/BeepManager;
.super Ljava/lang/Object;
.source "BeepManager.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Ljava/io/Closeable;


# static fields
.field private static final BEEP_VOLUME:F = 0.1f

.field private static final TAG:Ljava/lang/String;

.field private static final VIBRATE_DURATION:J = 0xc8L


# instance fields
.field private final activity:Landroid/app/Activity;

.field private mediaPlayer:Landroid/media/MediaPlayer;

.field private playBeep:Z

.field private vibrate:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-class v0, Lcom/google/zxing/client/android/BeepManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/BeepManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 52
    invoke-virtual {p0}, Lcom/google/zxing/client/android/BeepManager;->updatePrefs()V

    .line 53
    return-void
.end method

.method private buildMediaPlayer(Landroid/content/Context;)Landroid/media/MediaPlayer;
    .locals 8
    .param p1, "activity"    # Landroid/content/Context;

    .prologue
    .line 90
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 92
    .local v0, "mediaPlayer":Landroid/media/MediaPlayer;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$raw;->beep:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 94
    .local v6, "file":Landroid/content/res/AssetFileDescriptor;
    :try_start_1
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    :try_start_2
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 98
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 99
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 100
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 101
    const v1, 0x3dcccccd    # 0.1f

    const v2, 0x3dcccccd    # 0.1f

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 102
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 107
    .end local v0    # "mediaPlayer":Landroid/media/MediaPlayer;
    .end local v6    # "file":Landroid/content/res/AssetFileDescriptor;
    :goto_0
    return-object v0

    .line 96
    .restart local v0    # "mediaPlayer":Landroid/media/MediaPlayer;
    .restart local v6    # "file":Landroid/content/res/AssetFileDescriptor;
    :catchall_0
    move-exception v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V

    throw v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 104
    .end local v6    # "file":Landroid/content/res/AssetFileDescriptor;
    :catch_0
    move-exception v7

    .line 105
    .local v7, "ioe":Ljava/io/IOException;
    sget-object v1, Lcom/google/zxing/client/android/BeepManager;->TAG:Ljava/lang/String;

    invoke-static {v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 106
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 107
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static shouldBeep(Landroid/content/SharedPreferences;Landroid/content/Context;)Z
    .locals 4
    .param p0, "prefs"    # Landroid/content/SharedPreferences;
    .param p1, "activity"    # Landroid/content/Context;

    .prologue
    .line 78
    const-string v2, "preferences_play_beep"

    const/4 v3, 0x1

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 79
    .local v1, "shouldPlayBeep":Z
    if-eqz v1, :cond_0

    .line 81
    const-string v2, "audio"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 82
    .local v0, "audioService":Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    .line 83
    const/4 v1, 0x0

    .line 86
    .end local v0    # "audioService":Landroid/media/AudioManager;
    :cond_0
    return v1
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    .prologue
    .line 126
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 128
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    :cond_0
    monitor-exit p0

    return-void

    .line 126
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onError(Landroid/media/MediaPlayer;II)Z
    .locals 1
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 113
    monitor-enter p0

    const/16 v0, 0x64

    if-ne p2, v0, :cond_0

    .line 115
    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    :goto_0
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    .line 118
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/google/zxing/client/android/BeepManager;->close()V

    .line 119
    invoke-virtual {p0}, Lcom/google/zxing/client/android/BeepManager;->updatePrefs()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 113
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized playBeepSoundAndVibrate()V
    .locals 4

    .prologue
    .line 68
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/zxing/client/android/BeepManager;->playBeep:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 69
    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 71
    :cond_0
    iget-boolean v1, p0, Lcom/google/zxing/client/android/BeepManager;->vibrate:Z

    if-eqz v1, :cond_1

    .line 72
    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 73
    .local v0, "vibrator":Landroid/os/Vibrator;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .end local v0    # "vibrator":Landroid/os/Vibrator;
    :cond_1
    monitor-exit p0

    return-void

    .line 68
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized updatePrefs()V
    .locals 3

    .prologue
    .line 56
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 57
    .local v0, "prefs":Landroid/content/SharedPreferences;
    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/google/zxing/client/android/BeepManager;->shouldBeep(Landroid/content/SharedPreferences;Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/zxing/client/android/BeepManager;->playBeep:Z

    .line 58
    const-string v1, "preferences_vibrate"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/zxing/client/android/BeepManager;->vibrate:Z

    .line 59
    iget-boolean v1, p0, Lcom/google/zxing/client/android/BeepManager;->playBeep:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    if-nez v1, :cond_0

    .line 62
    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 63
    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    invoke-direct {p0, v1}, Lcom/google/zxing/client/android/BeepManager;->buildMediaPlayer(Landroid/content/Context;)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    :cond_0
    monitor-exit p0

    return-void

    .line 56
    .end local v0    # "prefs":Landroid/content/SharedPreferences;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

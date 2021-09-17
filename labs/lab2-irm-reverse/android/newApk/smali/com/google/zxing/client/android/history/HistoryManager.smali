.class public final Lcom/google/zxing/client/android/history/HistoryManager;
.super Ljava/lang/Object;
.source "HistoryManager.java"


# static fields
.field private static final COLUMNS:[Ljava/lang/String;

.field private static final COUNT_COLUMN:[Ljava/lang/String;

.field private static final ID_COL_PROJECTION:[Ljava/lang/String;

.field private static final ID_DETAIL_COL_PROJECTION:[Ljava/lang/String;

.field private static final MAX_ITEMS:I = 0x7d0

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final enableHistory:Z


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 54
    const-class v0, Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    .line 58
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "text"

    aput-object v1, v0, v3

    const-string v1, "display"

    aput-object v1, v0, v4

    const-string v1, "format"

    aput-object v1, v0, v5

    const/4 v1, 0x3

    const-string v2, "timestamp"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "details"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/zxing/client/android/history/HistoryManager;->COLUMNS:[Ljava/lang/String;

    .line 66
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "COUNT(1)"

    aput-object v1, v0, v3

    sput-object v0, Lcom/google/zxing/client/android/history/HistoryManager;->COUNT_COLUMN:[Ljava/lang/String;

    .line 68
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "id"

    aput-object v1, v0, v3

    sput-object v0, Lcom/google/zxing/client/android/history/HistoryManager;->ID_COL_PROJECTION:[Ljava/lang/String;

    .line 69
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "id"

    aput-object v1, v0, v3

    const-string v1, "details"

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/zxing/client/android/history/HistoryManager;->ID_DETAIL_COL_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    .line 76
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 77
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "preferences_history"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/zxing/client/android/history/HistoryManager;->enableHistory:Z

    .line 78
    return-void
.end method

.method private static close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p0, "cursor"    # Landroid/database/Cursor;
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 358
    if-eqz p0, :cond_0

    .line 359
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 361
    :cond_0
    if-eqz p1, :cond_1

    .line 362
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 364
    :cond_1
    return-void
.end method

.method private deletePrevious(Ljava/lang/String;)V
    .locals 7
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 229
    new-instance v1, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v2, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 230
    .local v1, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v0, 0x0

    .line 232
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 233
    const-string v2, "history"

    const-string v3, "text=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    invoke-static {v6, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 237
    return-void

    .line 235
    :catchall_0
    move-exception v2

    invoke-static {v6, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
.end method

.method private static massageHistoryField(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 354
    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "\""

    const-string v1, "\"\""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static saveHistory(Ljava/lang/String;)Landroid/net/Uri;
    .locals 10
    .param p0, "history"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 327
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v7

    const-string v8, "BarcodeScanner"

    invoke-direct {v0, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 328
    .local v0, "bsRoot":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v7, "History"

    invoke-direct {v2, v0, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 329
    .local v2, "historyRoot":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v7

    if-nez v7, :cond_1

    .line 330
    sget-object v7, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Couldn\'t make dir "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    :cond_0
    :goto_0
    return-object v6

    .line 333
    :cond_1
    new-instance v1, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "history-"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".csv"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v1, v2, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 334
    .local v1, "historyFile":Ljava/io/File;
    const/4 v4, 0x0

    .line 336
    .local v4, "out":Ljava/io/OutputStreamWriter;
    :try_start_0
    new-instance v5, Ljava/io/OutputStreamWriter;

    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v8, "UTF-8"

    invoke-static {v8}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v8

    invoke-direct {v5, v7, v8}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 337
    .end local v4    # "out":Ljava/io/OutputStreamWriter;
    .local v5, "out":Ljava/io/OutputStreamWriter;
    :try_start_1
    invoke-virtual {v5, p0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 338
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "file://"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v6

    .line 343
    if-eqz v5, :cond_0

    .line 345
    :try_start_2
    invoke-virtual {v5}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 346
    :catch_0
    move-exception v7

    goto :goto_0

    .line 339
    .end local v5    # "out":Ljava/io/OutputStreamWriter;
    .restart local v4    # "out":Ljava/io/OutputStreamWriter;
    :catch_1
    move-exception v3

    .line 340
    .local v3, "ioe":Ljava/io/IOException;
    :goto_1
    :try_start_3
    sget-object v7, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Couldn\'t access file "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " due to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 343
    if-eqz v4, :cond_0

    .line 345
    :try_start_4
    invoke-virtual {v4}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_0

    .line 346
    :catch_2
    move-exception v7

    goto/16 :goto_0

    .line 343
    .end local v3    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    :goto_2
    if-eqz v4, :cond_2

    .line 345
    :try_start_5
    invoke-virtual {v4}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 348
    :cond_2
    :goto_3
    throw v6

    .line 346
    :catch_3
    move-exception v7

    goto :goto_3

    .line 343
    .end local v4    # "out":Ljava/io/OutputStreamWriter;
    .restart local v5    # "out":Ljava/io/OutputStreamWriter;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "out":Ljava/io/OutputStreamWriter;
    .restart local v4    # "out":Ljava/io/OutputStreamWriter;
    goto :goto_2

    .line 339
    .end local v4    # "out":Ljava/io/OutputStreamWriter;
    .restart local v5    # "out":Ljava/io/OutputStreamWriter;
    :catch_4
    move-exception v3

    move-object v4, v5

    .end local v5    # "out":Ljava/io/OutputStreamWriter;
    .restart local v4    # "out":Ljava/io/OutputStreamWriter;
    goto :goto_1
.end method


# virtual methods
.method public addHistoryItem(Lcom/google/zxing/Result;Lcom/google/zxing/client/android/result/ResultHandler;)V
    .locals 9
    .param p1, "result"    # Lcom/google/zxing/Result;
    .param p2, "handler"    # Lcom/google/zxing/client/android/result/ResultHandler;

    .prologue
    const/4 v8, 0x0

    .line 157
    iget-object v4, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "SAVE_HISTORY"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 158
    invoke-virtual {p2}, Lcom/google/zxing/client/android/result/ResultHandler;->areContentsSecure()Z

    move-result v4

    if-nez v4, :cond_0

    iget-boolean v4, p0, Lcom/google/zxing/client/android/history/HistoryManager;->enableHistory:Z

    if-nez v4, :cond_1

    .line 182
    :cond_0
    :goto_0
    return-void

    .line 162
    :cond_1
    iget-object v4, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 163
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const-string v4, "preferences_remember_duplicates"

    const/4 v5, 0x0

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_2

    .line 164
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/zxing/client/android/history/HistoryManager;->deletePrevious(Ljava/lang/String;)V

    .line 167
    :cond_2
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 168
    .local v3, "values":Landroid/content/ContentValues;
    const-string v4, "text"

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    const-string v4, "format"

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/BarcodeFormat;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    const-string v4, "display"

    invoke-virtual {p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getDisplayContents()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    const-string v4, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 173
    new-instance v1, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v4, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-direct {v1, v4}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 174
    .local v1, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v0, 0x0

    .line 176
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 178
    const-string v4, "history"

    const-string v5, "timestamp"

    invoke-virtual {v0, v4, v5, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0

    :catchall_0
    move-exception v4

    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    throw v4
.end method

.method public addHistoryItemDetails(Ljava/lang/String;Ljava/lang/String;)V
    .locals 16
    .param p1, "itemID"    # Ljava/lang/String;
    .param p2, "itemDetails"    # Ljava/lang/String;

    .prologue
    .line 187
    new-instance v11, Lcom/google/zxing/client/android/history/DBHelper;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-direct {v11, v2}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 188
    .local v11, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v1, 0x0

    .line 189
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v10, 0x0

    .line 191
    .local v10, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 192
    const-string v2, "history"

    sget-object v3, Lcom/google/zxing/client/android/history/HistoryManager;->ID_DETAIL_COL_PROJECTION:[Ljava/lang/String;

    const-string v4, "text=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, "timestamp DESC"

    const-string v9, "1"

    invoke-virtual/range {v1 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 200
    const/4 v14, 0x0

    .line 201
    .local v14, "oldID":Ljava/lang/String;
    const/4 v13, 0x0

    .line 202
    .local v13, "oldDetails":Ljava/lang/String;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 203
    const/4 v2, 0x0

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 204
    const/4 v2, 0x1

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 207
    :cond_0
    if-eqz v14, :cond_1

    .line 209
    if-nez v13, :cond_2

    .line 210
    move-object/from16 v12, p2

    .line 216
    .local v12, "newDetails":Ljava/lang/String;
    :goto_0
    if-eqz v12, :cond_1

    .line 217
    new-instance v15, Landroid/content/ContentValues;

    invoke-direct {v15}, Landroid/content/ContentValues;-><init>()V

    .line 218
    .local v15, "values":Landroid/content/ContentValues;
    const-string v2, "details"

    invoke-virtual {v15, v2, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    const-string v2, "history"

    const-string v3, "id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v14, v4, v5

    invoke-virtual {v1, v2, v15, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 224
    .end local v12    # "newDetails":Ljava/lang/String;
    .end local v15    # "values":Landroid/content/ContentValues;
    :cond_1
    invoke-static {v10, v1}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 226
    return-void

    .line 211
    :cond_2
    :try_start_1
    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 212
    const/4 v12, 0x0

    .restart local v12    # "newDetails":Ljava/lang/String;
    goto :goto_0

    .line 214
    .end local v12    # "newDetails":Ljava/lang/String;
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v12

    .restart local v12    # "newDetails":Ljava/lang/String;
    goto :goto_0

    .line 224
    .end local v12    # "newDetails":Ljava/lang/String;
    .end local v13    # "oldDetails":Ljava/lang/String;
    .end local v14    # "oldID":Ljava/lang/String;
    :catchall_0
    move-exception v2

    invoke-static {v10, v1}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
.end method

.method buildHistory()Ljava/lang/CharSequence;
    .locals 14

    .prologue
    .line 281
    new-instance v10, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-direct {v10, v1}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 282
    .local v10, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v0, 0x0

    .line 283
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 285
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 286
    const-string v1, "history"

    sget-object v2, Lcom/google/zxing/client/android/history/HistoryManager;->COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 291
    const/4 v1, 0x2

    const/4 v2, 0x2

    invoke-static {v1, v2}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v9

    .line 292
    .local v9, "format":Ljava/text/DateFormat;
    new-instance v11, Ljava/lang/StringBuilder;

    const/16 v1, 0x3e8

    invoke-direct {v11, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 293
    .local v11, "historyText":Ljava/lang/StringBuilder;
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 295
    const/16 v1, 0x22

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/client/android/history/HistoryManager;->massageHistoryField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    const/16 v1, 0x22

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/client/android/history/HistoryManager;->massageHistoryField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    const/16 v1, 0x22

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/client/android/history/HistoryManager;->massageHistoryField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    const/16 v1, 0x22

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x3

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/client/android/history/HistoryManager;->massageHistoryField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    const/4 v1, 0x3

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 302
    .local v12, "timestamp":J
    const/16 v1, 0x22

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v12, v13}, Ljava/util/Date;-><init>(J)V

    .line 303
    invoke-virtual {v9, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 302
    invoke-static {v2}, Lcom/google/zxing/client/android/history/HistoryManager;->massageHistoryField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\","

    .line 303
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    const/16 v1, 0x22

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x4

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/client/android/history/HistoryManager;->massageHistoryField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\"\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    .line 311
    .end local v9    # "format":Ljava/text/DateFormat;
    .end local v11    # "historyText":Ljava/lang/StringBuilder;
    .end local v12    # "timestamp":J
    :catchall_0
    move-exception v1

    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    throw v1

    .restart local v9    # "format":Ljava/text/DateFormat;
    .restart local v11    # "historyText":Ljava/lang/StringBuilder;
    :cond_0
    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 309
    return-object v11
.end method

.method public buildHistoryItem(I)Lcom/google/zxing/client/android/history/HistoryItem;
    .locals 13
    .param p1, "number"    # I

    .prologue
    .line 118
    new-instance v12, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v3, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-direct {v12, v3}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 119
    .local v12, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v0, 0x0

    .line 120
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 122
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {v12}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 123
    const-string v1, "history"

    sget-object v2, Lcom/google/zxing/client/android/history/HistoryManager;->COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 124
    add-int/lit8 v3, p1, 0x1

    invoke-interface {v8, v3}, Landroid/database/Cursor;->move(I)Z

    .line 125
    const/4 v3, 0x0

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 126
    .local v2, "text":Ljava/lang/String;
    const/4 v3, 0x1

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 127
    .local v10, "display":Ljava/lang/String;
    const/4 v3, 0x2

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 128
    .local v11, "format":Ljava/lang/String;
    const/4 v3, 0x3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 129
    .local v6, "timestamp":J
    const/4 v3, 0x4

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 130
    .local v9, "details":Ljava/lang/String;
    new-instance v1, Lcom/google/zxing/Result;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v11}, Lcom/google/zxing/BarcodeFormat;->valueOf(Ljava/lang/String;)Lcom/google/zxing/BarcodeFormat;

    move-result-object v5

    invoke-direct/range {v1 .. v7}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;J)V

    .line 131
    .local v1, "result":Lcom/google/zxing/Result;
    new-instance v3, Lcom/google/zxing/client/android/history/HistoryItem;

    invoke-direct {v3, v1, v10, v9}, Lcom/google/zxing/client/android/history/HistoryItem;-><init>(Lcom/google/zxing/Result;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 131
    return-object v3

    .line 133
    .end local v1    # "result":Lcom/google/zxing/Result;
    .end local v2    # "text":Ljava/lang/String;
    .end local v6    # "timestamp":J
    .end local v9    # "details":Ljava/lang/String;
    .end local v10    # "display":Ljava/lang/String;
    .end local v11    # "format":Ljava/lang/String;
    :catchall_0
    move-exception v3

    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    throw v3
.end method

.method public buildHistoryItems()Ljava/util/List;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/client/android/history/HistoryItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 95
    new-instance v12, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v3, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-direct {v12, v3}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 96
    .local v12, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v13, "items":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/client/android/history/HistoryItem;>;"
    const/4 v0, 0x0

    .line 98
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 100
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {v12}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 101
    const-string v1, "history"

    sget-object v2, Lcom/google/zxing/client/android/history/HistoryManager;->COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 102
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 103
    const/4 v3, 0x0

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 104
    .local v2, "text":Ljava/lang/String;
    const/4 v3, 0x1

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 105
    .local v10, "display":Ljava/lang/String;
    const/4 v3, 0x2

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 106
    .local v11, "format":Ljava/lang/String;
    const/4 v3, 0x3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 107
    .local v6, "timestamp":J
    const/4 v3, 0x4

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 108
    .local v9, "details":Ljava/lang/String;
    new-instance v1, Lcom/google/zxing/Result;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v11}, Lcom/google/zxing/BarcodeFormat;->valueOf(Ljava/lang/String;)Lcom/google/zxing/BarcodeFormat;

    move-result-object v5

    invoke-direct/range {v1 .. v7}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;J)V

    .line 109
    .local v1, "result":Lcom/google/zxing/Result;
    new-instance v3, Lcom/google/zxing/client/android/history/HistoryItem;

    invoke-direct {v3, v1, v10, v9}, Lcom/google/zxing/client/android/history/HistoryItem;-><init>(Lcom/google/zxing/Result;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v13, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 112
    .end local v1    # "result":Lcom/google/zxing/Result;
    .end local v2    # "text":Ljava/lang/String;
    .end local v6    # "timestamp":J
    .end local v9    # "details":Ljava/lang/String;
    .end local v10    # "display":Ljava/lang/String;
    .end local v11    # "format":Ljava/lang/String;
    :catchall_0
    move-exception v3

    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    throw v3

    :cond_0
    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 114
    return-object v13
.end method

.method clearHistory()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 316
    new-instance v1, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v2, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 317
    .local v1, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v0, 0x0

    .line 319
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 320
    const-string v2, "history"

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 322
    invoke-static {v5, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 324
    return-void

    .line 322
    :catchall_0
    move-exception v2

    invoke-static {v5, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
.end method

.method public deleteHistoryItem(I)V
    .locals 10
    .param p1, "number"    # I

    .prologue
    .line 138
    new-instance v9, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-direct {v9, v1}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 139
    .local v9, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v0, 0x0

    .line 140
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 142
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 143
    const-string v1, "history"

    sget-object v2, Lcom/google/zxing/client/android/history/HistoryManager;->ID_COL_PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 147
    add-int/lit8 v1, p1, 0x1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->move(I)Z

    .line 148
    const-string v1, "history"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 152
    return-void

    .line 150
    :catchall_0
    move-exception v1

    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    throw v1
.end method

.method public hasHistoryItems()Z
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 81
    new-instance v9, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-direct {v9, v1}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 82
    .local v9, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v0, 0x0

    .line 83
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 85
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 86
    const-string v1, "history"

    sget-object v2, Lcom/google/zxing/client/android/history/HistoryManager;->COUNT_COLUMN:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 87
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 88
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-lez v1, :cond_0

    const/4 v1, 0x1

    .line 90
    :goto_0
    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 88
    return v1

    :cond_0
    move v1, v10

    goto :goto_0

    .line 90
    :catchall_0
    move-exception v1

    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    throw v1
.end method

.method public trimHistory()V
    .locals 12

    .prologue
    .line 240
    new-instance v9, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Landroid/app/Activity;

    invoke-direct {v9, v1}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 241
    .local v9, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    const/4 v0, 0x0

    .line 242
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 244
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 245
    const-string v1, "history"

    sget-object v2, Lcom/google/zxing/client/android/history/HistoryManager;->ID_COL_PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 249
    const/16 v1, 0x7d0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->move(I)Z

    .line 250
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 251
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 252
    .local v10, "id":Ljava/lang/String;
    sget-object v1, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Deleting scan history ID "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    const-string v1, "history"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 255
    .end local v10    # "id":Ljava/lang/String;
    :catch_0
    move-exception v11

    .line 258
    .local v11, "sqle":Landroid/database/sqlite/SQLiteException;
    :try_start_1
    sget-object v1, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    invoke-static {v1, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 261
    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 263
    .end local v11    # "sqle":Landroid/database/sqlite/SQLiteException;
    :goto_1
    return-void

    .line 261
    :cond_0
    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_1

    :catchall_0
    move-exception v1

    invoke-static {v8, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->close(Landroid/database/Cursor;Landroid/database/sqlite/SQLiteDatabase;)V

    throw v1
.end method

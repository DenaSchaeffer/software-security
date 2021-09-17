.class Lio/sqlc/SQLiteAndroidDatabase;
.super Ljava/lang/Object;
.source "SQLiteAndroidDatabase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    }
.end annotation


# static fields
.field private static final DELETE_TABLE_NAME:Ljava/util/regex/Pattern;

.field private static final FIRST_WORD:Ljava/util/regex/Pattern;

.field private static final UPDATE_TABLE_NAME:Ljava/util/regex/Pattern;

.field private static final WHERE_CLAUSE:Ljava/util/regex/Pattern;

.field private static final isPostHoneycomb:Z


# instance fields
.field dbFile:Ljava/io/File;

.field isTransactionActive:Z

.field mydb:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 43
    const-string v0, "^[\\s;]*([^\\s;]+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lio/sqlc/SQLiteAndroidDatabase;->FIRST_WORD:Ljava/util/regex/Pattern;

    .line 46
    const-string v0, "\\s+WHERE\\s+(.+)$"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lio/sqlc/SQLiteAndroidDatabase;->WHERE_CLAUSE:Ljava/util/regex/Pattern;

    .line 49
    const-string v0, "^\\s*UPDATE\\s+(\\S+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lio/sqlc/SQLiteAndroidDatabase;->UPDATE_TABLE_NAME:Ljava/util/regex/Pattern;

    .line 52
    const-string v0, "^\\s*DELETE\\s+FROM\\s+(\\S+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lio/sqlc/SQLiteAndroidDatabase;->DELETE_TABLE_NAME:Ljava/util/regex/Pattern;

    .line 55
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lio/sqlc/SQLiteAndroidDatabase;->isPostHoneycomb:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/sqlc/SQLiteAndroidDatabase;->isTransactionActive:Z

    return-void
.end method

.method private bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "myStatement"    # Landroid/database/sqlite/SQLiteStatement;
    .param p2, "sqlArgs"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 412
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 413
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Float;

    if-nez v1, :cond_0

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Double;

    if-eqz v1, :cond_1

    .line 414
    :cond_0
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 412
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 415
    :cond_1
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Number;

    if-eqz v1, :cond_2

    .line 416
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    goto :goto_1

    .line 417
    :cond_2
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 418
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 420
    :cond_3
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    goto :goto_1

    .line 423
    :cond_4
    return-void
.end method

.method private bindPostHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    .locals 4
    .param p1, "row"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "cur"    # Landroid/database/Cursor;
    .param p4, "i"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 505
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getType(I)I

    move-result v0

    .line 507
    .local v0, "curType":I
    packed-switch v0, :pswitch_data_0

    .line 519
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 522
    :goto_0
    return-void

    .line 509
    :pswitch_0
    sget-object v1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p1, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 512
    :pswitch_1
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {p1, p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_0

    .line 515
    :pswitch_2
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {p1, p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_0

    .line 507
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private bindPreHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    .locals 6
    .param p1, "row"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "cursor"    # Landroid/database/Cursor;
    .param p4, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 528
    move-object v2, p3

    check-cast v2, Landroid/database/sqlite/SQLiteCursor;

    .line 529
    .local v2, "sqLiteCursor":Landroid/database/sqlite/SQLiteCursor;
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteCursor;->getWindow()Landroid/database/CursorWindow;

    move-result-object v0

    .line 530
    .local v0, "cursorWindow":Landroid/database/CursorWindow;
    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v1

    .line 531
    .local v1, "pos":I
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isNull(II)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 532
    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 541
    :goto_0
    return-void

    .line 533
    :cond_0
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isLong(II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 534
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p1, p2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_0

    .line 535
    :cond_1
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isFloat(II)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 536
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    invoke-virtual {p1, p2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_0

    .line 539
    :cond_2
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0
.end method

.method private final countRowsAffectedCompat(Lio/sqlc/SQLiteAndroidDatabase$QueryType;Ljava/lang/String;Lorg/json/JSONArray;Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 16
    .param p1, "queryType"    # Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "json_params"    # Lorg/json/JSONArray;
    .param p4, "mydb"    # Landroid/database/sqlite/SQLiteDatabase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 340
    sget-object v14, Lio/sqlc/SQLiteAndroidDatabase;->WHERE_CLAUSE:Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v13

    .line 342
    .local v13, "whereMatcher":Ljava/util/regex/Matcher;
    const-string v12, ""

    .line 344
    .local v12, "where":Ljava/lang/String;
    const/4 v6, 0x0

    .line 345
    .local v6, "pos":I
    :goto_0
    invoke-virtual {v13, v6}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 346
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, " WHERE "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v13, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 347
    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Ljava/util/regex/Matcher;->start(I)I

    move-result v6

    goto :goto_0

    .line 353
    :cond_0
    const/4 v4, 0x0

    .line 354
    .local v4, "numQuestionMarks":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v14

    if-ge v3, v14, :cond_2

    .line 355
    invoke-virtual {v12, v3}, Ljava/lang/String;->charAt(I)C

    move-result v14

    const/16 v15, 0x3f

    if-ne v14, v15, :cond_1

    .line 356
    add-int/lit8 v4, v4, 0x1

    .line 354
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 360
    :cond_2
    const/4 v9, 0x0

    .line 362
    .local v9, "subParams":Lorg/json/JSONArray;
    if-eqz p3, :cond_3

    .line 364
    move-object/from16 v5, p3

    .line 365
    .local v5, "origArray":Lorg/json/JSONArray;
    new-instance v9, Lorg/json/JSONArray;

    .end local v9    # "subParams":Lorg/json/JSONArray;
    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 366
    .restart local v9    # "subParams":Lorg/json/JSONArray;
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v14

    sub-int v7, v14, v4

    .line 367
    .local v7, "startPos":I
    move v3, v7

    :goto_2
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v3, v14, :cond_3

    .line 368
    sub-int v14, v3, v7

    invoke-virtual {v5, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v9, v14, v15}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 367
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 372
    .end local v5    # "origArray":Lorg/json/JSONArray;
    .end local v7    # "startPos":I
    :cond_3
    sget-object v14, Lio/sqlc/SQLiteAndroidDatabase$QueryType;->update:Lio/sqlc/SQLiteAndroidDatabase$QueryType;

    move-object/from16 v0, p1

    if-ne v0, v14, :cond_6

    .line 373
    sget-object v14, Lio/sqlc/SQLiteAndroidDatabase;->UPDATE_TABLE_NAME:Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    .line 374
    .local v11, "tableMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_5

    .line 375
    const/4 v14, 0x1

    invoke-virtual {v11, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    .line 377
    .local v10, "table":Ljava/lang/String;
    :try_start_0
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SELECT count(*) FROM "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v8

    .line 380
    .local v8, "statement":Landroid/database/sqlite/SQLiteStatement;
    if-eqz v9, :cond_4

    .line 381
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v9}, Lio/sqlc/SQLiteAndroidDatabase;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V

    .line 384
    :cond_4
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v14

    long-to-int v14, v14

    .line 408
    .end local v8    # "statement":Landroid/database/sqlite/SQLiteStatement;
    .end local v10    # "table":Ljava/lang/String;
    :goto_3
    return v14

    .line 385
    .restart local v10    # "table":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 387
    .local v2, "e":Ljava/lang/Exception;
    const-class v14, Lio/sqlc/SQLiteAndroidDatabase;

    invoke-virtual {v14}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "uncaught"

    invoke-static {v14, v15, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 408
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v10    # "table":Ljava/lang/String;
    :cond_5
    :goto_4
    const/4 v14, 0x0

    goto :goto_3

    .line 391
    .end local v11    # "tableMatcher":Ljava/util/regex/Matcher;
    :cond_6
    sget-object v14, Lio/sqlc/SQLiteAndroidDatabase;->DELETE_TABLE_NAME:Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    .line 392
    .restart local v11    # "tableMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_5

    .line 393
    const/4 v14, 0x1

    invoke-virtual {v11, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    .line 395
    .restart local v10    # "table":Ljava/lang/String;
    :try_start_1
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SELECT count(*) FROM "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v8

    .line 397
    .restart local v8    # "statement":Landroid/database/sqlite/SQLiteStatement;
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v9}, Lio/sqlc/SQLiteAndroidDatabase;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V

    .line 399
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v14

    long-to-int v14, v14

    goto :goto_3

    .line 400
    .end local v8    # "statement":Landroid/database/sqlite/SQLiteStatement;
    :catch_1
    move-exception v2

    .line 402
    .restart local v2    # "e":Ljava/lang/Exception;
    const-class v14, Lio/sqlc/SQLiteAndroidDatabase;

    invoke-virtual {v14}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "uncaught"

    invoke-static {v14, v15, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4
.end method

.method private executeSqlBatchStatement(Ljava/lang/String;Lorg/json/JSONArray;Lorg/json/JSONArray;)V
    .locals 22
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "json_params"    # Lorg/json/JSONArray;
    .param p3, "batchResults"    # Lorg/json/JSONArray;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 125
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v19, v0

    if-nez v19, :cond_0

    .line 334
    :goto_0
    return-void

    .line 131
    :cond_0
    const/16 v18, 0x0

    .line 132
    .local v18, "rowsAffectedCompat":I
    const/4 v12, 0x0

    .line 134
    .local v12, "needRowsAffectedCompat":Z
    const/4 v13, 0x0

    .line 136
    .local v13, "queryResult":Lorg/json/JSONObject;
    const-string v6, "unknown"

    .line 137
    .local v6, "errorMessage":Ljava/lang/String;
    const/4 v4, 0x0

    .line 140
    .local v4, "code":I
    const/4 v11, 0x1

    .line 143
    .local v11, "needRawQuery":Z
    :try_start_0
    invoke-static/range {p1 .. p1}, Lio/sqlc/SQLiteAndroidDatabase;->getQueryType(Ljava/lang/String;)Lio/sqlc/SQLiteAndroidDatabase$QueryType;

    move-result-object v15

    .line 146
    .local v15, "queryType":Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    sget-object v19, Lio/sqlc/SQLiteAndroidDatabase$QueryType;->update:Lio/sqlc/SQLiteAndroidDatabase$QueryType;

    move-object/from16 v0, v19

    if-eq v15, v0, :cond_1

    sget-object v19, Lio/sqlc/SQLiteAndroidDatabase$QueryType;->delete:Lio/sqlc/SQLiteAndroidDatabase$QueryType;

    move-object/from16 v0, v19

    if-ne v15, v0, :cond_b

    .line 147
    :cond_1
    sget-boolean v19, Lio/sqlc/SQLiteAndroidDatabase;->isPostHoneycomb:Z

    if-eqz v19, :cond_3

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v10

    .line 150
    .local v10, "myStatement":Landroid/database/sqlite/SQLiteStatement;
    if-eqz p2, :cond_2

    .line 151
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v10, v1}, Lio/sqlc/SQLiteAndroidDatabase;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 154
    :cond_2
    const/16 v17, -0x1

    .line 159
    .local v17, "rowsAffected":I
    :try_start_1
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteConstraintException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move-result v17

    .line 161
    const/4 v11, 0x0

    .line 183
    :goto_1
    :try_start_2
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteStatement;->close()V

    .line 185
    const/16 v19, -0x1

    move/from16 v0, v17

    move/from16 v1, v19

    if-eq v0, v1, :cond_3

    .line 186
    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    .line 187
    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .local v14, "queryResult":Lorg/json/JSONObject;
    :try_start_3
    const-string v19, "rowsAffected"

    move-object/from16 v0, v19

    move/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_c

    move-object v13, v14

    .line 191
    .end local v10    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .end local v17    # "rowsAffected":I
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    :cond_3
    if-eqz v11, :cond_b

    .line 192
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v19

    invoke-direct {v0, v15, v1, v2, v3}, Lio/sqlc/SQLiteAndroidDatabase;->countRowsAffectedCompat(Lio/sqlc/SQLiteAndroidDatabase$QueryType;Ljava/lang/String;Lorg/json/JSONArray;Landroid/database/sqlite/SQLiteDatabase;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    move-result v18

    .line 193
    const/4 v12, 0x1

    move-object v14, v13

    .line 198
    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    :goto_2
    :try_start_5
    sget-object v19, Lio/sqlc/SQLiteAndroidDatabase$QueryType;->insert:Lio/sqlc/SQLiteAndroidDatabase$QueryType;

    move-object/from16 v0, v19

    if-ne v15, v0, :cond_4

    if-eqz p2, :cond_4

    .line 199
    const/4 v11, 0x0

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v10

    .line 203
    .restart local v10    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v10, v1}, Lio/sqlc/SQLiteAndroidDatabase;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_c

    .line 205
    const-wide/16 v8, -0x1

    .line 208
    .local v8, "insertId":J
    :try_start_6
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v8

    .line 211
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V
    :try_end_6
    .catch Landroid/database/sqlite/SQLiteConstraintException; {:try_start_6 .. :try_end_6} :catch_11
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6 .. :try_end_6} :catch_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_c

    .line 212
    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    const-wide/16 v20, -0x1

    cmp-long v19, v8, v20

    if-eqz v19, :cond_8

    .line 213
    :try_start_7
    const-string v19, "insertId"

    move-object/from16 v0, v19

    invoke-virtual {v13, v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 214
    const-string v19, "rowsAffected"

    const/16 v20, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteConstraintException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_10
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 232
    :goto_3
    :try_start_8
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteStatement;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    move-object v14, v13

    .line 235
    .end local v8    # "insertId":J
    .end local v10    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    :cond_4
    :try_start_9
    sget-object v19, Lio/sqlc/SQLiteAndroidDatabase$QueryType;->begin:Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_c

    move-object/from16 v0, v19

    if-ne v15, v0, :cond_5

    .line 236
    const/4 v11, 0x0

    .line 238
    :try_start_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 239
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lio/sqlc/SQLiteAndroidDatabase;->isTransactionActive:Z

    .line 241
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V
    :try_end_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_a .. :try_end_a} :catch_7
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_c

    .line 242
    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    :try_start_b
    const-string v19, "rowsAffected"

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_b .. :try_end_b} :catch_f
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4

    move-object v14, v13

    .line 250
    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    :cond_5
    :goto_4
    :try_start_c
    sget-object v19, Lio/sqlc/SQLiteAndroidDatabase$QueryType;->commit:Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_c

    move-object/from16 v0, v19

    if-ne v15, v0, :cond_6

    .line 251
    const/4 v11, 0x0

    .line 253
    :try_start_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 254
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 255
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lio/sqlc/SQLiteAndroidDatabase;->isTransactionActive:Z

    .line 257
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_8
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_c

    .line 258
    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    :try_start_e
    const-string v19, "rowsAffected"

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_e .. :try_end_e} :catch_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_4

    move-object v14, v13

    .line 266
    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    :cond_6
    :goto_5
    :try_start_f
    sget-object v19, Lio/sqlc/SQLiteAndroidDatabase$QueryType;->rollback:Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_c

    move-object/from16 v0, v19

    if-ne v15, v0, :cond_a

    .line 267
    const/4 v11, 0x0

    .line 269
    :try_start_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 270
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lio/sqlc/SQLiteAndroidDatabase;->isTransactionActive:Z

    .line 272
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V
    :try_end_10
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_10 .. :try_end_10} :catch_9
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_c

    .line 273
    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    :try_start_11
    const-string v19, "rowsAffected"

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_11
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_11 .. :try_end_11} :catch_d
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_4

    .line 282
    :goto_6
    if-eqz v11, :cond_7

    .line 284
    :try_start_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3}, Lio/sqlc/SQLiteAndroidDatabase;->executeSqlStatementQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    :try_end_12
    .catch Landroid/database/sqlite/SQLiteConstraintException; {:try_start_12 .. :try_end_12} :catch_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_12 .. :try_end_12} :catch_b
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_4

    move-result-object v13

    .line 299
    :goto_7
    if-eqz v12, :cond_7

    .line 300
    :try_start_13
    const-string v19, "rowsAffected"

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_4

    .line 310
    .end local v15    # "queryType":Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    :cond_7
    :goto_8
    if-eqz v13, :cond_9

    .line 311
    :try_start_14
    new-instance v16, Lorg/json/JSONObject;

    invoke-direct/range {v16 .. v16}, Lorg/json/JSONObject;-><init>()V

    .line 313
    .local v16, "r":Lorg/json/JSONObject;
    const-string v19, "type"

    const-string v20, "success"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 314
    const-string v19, "result"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 316
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_0

    goto/16 :goto_0

    .line 328
    .end local v16    # "r":Lorg/json/JSONObject;
    :catch_0
    move-exception v7

    .line 329
    .local v7, "ex":Lorg/json/JSONException;
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    .line 330
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "SQLiteAndroidDatabase.executeSql[Batch](): Error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v7}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 162
    .end local v7    # "ex":Lorg/json/JSONException;
    .restart local v10    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v15    # "queryType":Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    .restart local v17    # "rowsAffected":I
    :catch_1
    move-exception v7

    .line 164
    .local v7, "ex":Landroid/database/sqlite/SQLiteConstraintException;
    :try_start_15
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteConstraintException;->printStackTrace()V

    .line 165
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "constraint failure: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteConstraintException;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 166
    const/4 v4, 0x6

    .line 167
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "SQLiteStatement.executeUpdateDelete(): Error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    const/4 v11, 0x0

    .line 180
    goto/16 :goto_1

    .line 169
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteConstraintException;
    :catch_2
    move-exception v7

    .line 171
    .local v7, "ex":Landroid/database/sqlite/SQLiteException;
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 172
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 173
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "SQLiteStatement.executeUpdateDelete(): Error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    const/4 v11, 0x0

    .line 180
    goto/16 :goto_1

    .line 175
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_3
    move-exception v7

    .line 178
    .local v7, "ex":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 179
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "SQLiteStatement.executeUpdateDelete(): runtime error (fallback to old API): "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_4

    goto/16 :goto_1

    .line 303
    .end local v7    # "ex":Ljava/lang/Exception;
    .end local v10    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v15    # "queryType":Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    .end local v17    # "rowsAffected":I
    :catch_4
    move-exception v7

    .line 304
    .restart local v7    # "ex":Ljava/lang/Exception;
    :goto_9
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 305
    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 306
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "SQLiteAndroidDatabase.executeSql[Batch](): Error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 216
    .end local v7    # "ex":Ljava/lang/Exception;
    .restart local v8    # "insertId":J
    .restart local v10    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v15    # "queryType":Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    :cond_8
    :try_start_16
    const-string v19, "rowsAffected"

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_16
    .catch Landroid/database/sqlite/SQLiteConstraintException; {:try_start_16 .. :try_end_16} :catch_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_16 .. :try_end_16} :catch_10
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_4

    goto/16 :goto_3

    .line 218
    :catch_5
    move-exception v7

    .line 220
    .local v7, "ex":Landroid/database/sqlite/SQLiteConstraintException;
    :goto_a
    :try_start_17
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteConstraintException;->printStackTrace()V

    .line 221
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "constraint failure: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteConstraintException;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 222
    const/4 v4, 0x6

    .line 223
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "SQLiteDatabase.executeInsert(): Error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 224
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteConstraintException;
    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    :catch_6
    move-exception v7

    move-object v13, v14

    .line 226
    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .local v7, "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    :goto_b
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 227
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 228
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "SQLiteDatabase.executeInsert(): Error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 243
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .end local v8    # "insertId":J
    .end local v10    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    :catch_7
    move-exception v7

    move-object v13, v14

    .line 244
    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    :goto_c
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 245
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 246
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "SQLiteDatabase.beginTransaction(): Error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object v14, v13

    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_4

    .line 259
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_8
    move-exception v7

    move-object v13, v14

    .line 260
    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    :goto_d
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 261
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 262
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "SQLiteDatabase.setTransactionSuccessful/endTransaction(): Error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object v14, v13

    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_5

    .line 274
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_9
    move-exception v7

    move-object v13, v14

    .line 275
    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    :goto_e
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 276
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 277
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "SQLiteDatabase.endTransaction(): Error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 286
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_a
    move-exception v7

    .line 288
    .local v7, "ex":Landroid/database/sqlite/SQLiteConstraintException;
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteConstraintException;->printStackTrace()V

    .line 289
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "constraint failure: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteConstraintException;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 290
    const/4 v4, 0x6

    .line 291
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Raw query error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7

    .line 292
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteConstraintException;
    :catch_b
    move-exception v7

    .line 294
    .local v7, "ex":Landroid/database/sqlite/SQLiteException;
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 295
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 296
    const-string v19, "executeSqlBatch"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Raw query error="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_4

    goto/16 :goto_7

    .line 318
    .end local v7    # "ex":Landroid/database/sqlite/SQLiteException;
    .end local v15    # "queryType":Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    :cond_9
    :try_start_18
    new-instance v16, Lorg/json/JSONObject;

    invoke-direct/range {v16 .. v16}, Lorg/json/JSONObject;-><init>()V

    .line 319
    .restart local v16    # "r":Lorg/json/JSONObject;
    const-string v19, "type"

    const-string v20, "error"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 321
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 322
    .local v5, "er":Lorg/json/JSONObject;
    const-string v19, "message"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 323
    const-string v19, "code"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 324
    const-string v19, "result"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 326
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_18} :catch_0

    goto/16 :goto_0

    .line 303
    .end local v5    # "er":Lorg/json/JSONObject;
    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .end local v16    # "r":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v15    # "queryType":Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    :catch_c
    move-exception v7

    move-object v13, v14

    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_9

    .line 274
    :catch_d
    move-exception v7

    goto/16 :goto_e

    .line 259
    :catch_e
    move-exception v7

    goto/16 :goto_d

    .line 243
    :catch_f
    move-exception v7

    goto/16 :goto_c

    .line 224
    .restart local v8    # "insertId":J
    .restart local v10    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    :catch_10
    move-exception v7

    goto/16 :goto_b

    .line 218
    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    :catch_11
    move-exception v7

    move-object v13, v14

    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_a

    .end local v8    # "insertId":J
    .end local v10    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    :cond_a
    move-object v13, v14

    .end local v14    # "queryResult":Lorg/json/JSONObject;
    .restart local v13    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_6

    :cond_b
    move-object v14, v13

    .end local v13    # "queryResult":Lorg/json/JSONObject;
    .restart local v14    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_2
.end method

.method private executeSqlStatementQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    .locals 17
    .param p1, "mydb"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "paramsAsJson"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 433
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 435
    .local v13, "rowsResult":Lorg/json/JSONObject;
    const/4 v3, 0x0

    .line 437
    .local v3, "cur":Landroid/database/Cursor;
    const/4 v10, 0x0

    .line 439
    .local v10, "params":[Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v14

    new-array v10, v14, [Ljava/lang/String;

    .line 441
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_0
    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v8, v14, :cond_1

    .line 442
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 443
    const-string v14, ""

    aput-object v14, v10, v8

    .line 441
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 445
    :cond_0
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v10, v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 449
    .end local v8    # "j":I
    :catch_0
    move-exception v6

    .line 450
    .local v6, "ex":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 451
    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    .line 452
    .local v5, "errorMessage":Ljava/lang/String;
    const-string v14, "executeSqlBatch"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "SQLiteAndroidDatabase.executeSql[Batch](): Error="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    throw v6

    .line 448
    .end local v5    # "errorMessage":Ljava/lang/String;
    .end local v6    # "ex":Ljava/lang/Exception;
    .restart local v8    # "j":I
    :cond_1
    :try_start_1
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v10}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 457
    if-eqz v3, :cond_3

    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v14

    if-eqz v14, :cond_3

    .line 458
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 459
    .local v12, "rowsArrayResult":Lorg/json/JSONArray;
    const-string v9, ""

    .line 460
    .local v9, "key":Ljava/lang/String;
    invoke-interface {v3}, Landroid/database/Cursor;->getColumnCount()I

    move-result v2

    .line 464
    .local v2, "colCount":I
    :cond_2
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 466
    .local v11, "row":Lorg/json/JSONObject;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v2, :cond_6

    .line 467
    :try_start_2
    invoke-interface {v3, v7}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v9

    .line 469
    sget-boolean v14, Lio/sqlc/SQLiteAndroidDatabase;->isPostHoneycomb:Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    if-eqz v14, :cond_5

    .line 473
    :try_start_3
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9, v3, v7}, Lio/sqlc/SQLiteAndroidDatabase;->bindPostHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 466
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 474
    :catch_1
    move-exception v6

    .line 475
    .restart local v6    # "ex":Ljava/lang/Exception;
    :try_start_4
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9, v3, v7}, Lio/sqlc/SQLiteAndroidDatabase;->bindPreHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    .line 484
    .end local v6    # "ex":Ljava/lang/Exception;
    :catch_2
    move-exception v4

    .line 485
    .local v4, "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    .line 487
    .end local v4    # "e":Lorg/json/JSONException;
    :goto_4
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v14

    if-nez v14, :cond_2

    .line 490
    :try_start_5
    const-string v14, "rows"

    invoke-virtual {v13, v14, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_3

    .line 496
    .end local v2    # "colCount":I
    .end local v7    # "i":I
    .end local v9    # "key":Ljava/lang/String;
    .end local v11    # "row":Lorg/json/JSONObject;
    .end local v12    # "rowsArrayResult":Lorg/json/JSONArray;
    :cond_3
    :goto_5
    if-eqz v3, :cond_4

    .line 497
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 500
    :cond_4
    return-object v13

    .line 478
    .restart local v2    # "colCount":I
    .restart local v7    # "i":I
    .restart local v9    # "key":Ljava/lang/String;
    .restart local v11    # "row":Lorg/json/JSONObject;
    .restart local v12    # "rowsArrayResult":Lorg/json/JSONArray;
    :cond_5
    :try_start_6
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9, v3, v7}, Lio/sqlc/SQLiteAndroidDatabase;->bindPreHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V

    goto :goto_3

    .line 482
    :cond_6
    invoke-virtual {v12, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_4

    .line 491
    :catch_3
    move-exception v4

    .line 492
    .restart local v4    # "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_5
.end method

.method static getQueryType(Ljava/lang/String;)Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    .locals 5
    .param p0, "query"    # Ljava/lang/String;

    .prologue
    .line 544
    sget-object v3, Lio/sqlc/SQLiteAndroidDatabase;->FIRST_WORD:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 547
    .local v2, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 549
    const/4 v3, 0x1

    :try_start_0
    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 553
    .local v0, "first":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "query not found"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 556
    .end local v0    # "first":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 558
    .local v1, "ignore":Ljava/lang/IllegalArgumentException;
    sget-object v3, Lio/sqlc/SQLiteAndroidDatabase$QueryType;->other:Lio/sqlc/SQLiteAndroidDatabase$QueryType;

    .end local v1    # "ignore":Ljava/lang/IllegalArgumentException;
    :goto_0
    return-object v3

    .line 555
    .restart local v0    # "first":Ljava/lang/String;
    :cond_0
    :try_start_1
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lio/sqlc/SQLiteAndroidDatabase$QueryType;->valueOf(Ljava/lang/String;)Lio/sqlc/SQLiteAndroidDatabase$QueryType;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    goto :goto_0

    .line 563
    .end local v0    # "first":Ljava/lang/String;
    :cond_1
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "query not found"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method bugWorkaround()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 92
    invoke-virtual {p0}, Lio/sqlc/SQLiteAndroidDatabase;->closeDatabaseNow()V

    .line 93
    iget-object v0, p0, Lio/sqlc/SQLiteAndroidDatabase;->dbFile:Ljava/io/File;

    invoke-virtual {p0, v0}, Lio/sqlc/SQLiteAndroidDatabase;->open(Ljava/io/File;)V

    .line 94
    return-void
.end method

.method closeDatabaseNow()V
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_1

    .line 82
    iget-boolean v0, p0, Lio/sqlc/SQLiteAndroidDatabase;->isTransactionActive:Z

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 84
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/sqlc/SQLiteAndroidDatabase;->isTransactionActive:Z

    .line 86
    :cond_0
    iget-object v0, p0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    .line 89
    :cond_1
    return-void
.end method

.method executeSqlBatch([Ljava/lang/String;[Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 5
    .param p1, "queryarr"    # [Ljava/lang/String;
    .param p2, "jsonparamsArr"    # [Lorg/json/JSONArray;
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 105
    iget-object v3, p0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v3, :cond_0

    .line 108
    const-string v3, "INTERNAL PLUGIN ERROR: database not open"

    invoke-virtual {p3, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 120
    :goto_0
    return-void

    .line 112
    :cond_0
    array-length v2, p1

    .line 113
    .local v2, "len":I
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 115
    .local v0, "batchResults":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_1

    .line 116
    aget-object v3, p1, v1

    aget-object v4, p2, v1

    invoke-direct {p0, v3, v4, v0}, Lio/sqlc/SQLiteAndroidDatabase;->executeSqlBatchStatement(Ljava/lang/String;Lorg/json/JSONArray;Lorg/json/JSONArray;)V

    .line 115
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 119
    :cond_1
    invoke-virtual {p3, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto :goto_0
.end method

.method open(Ljava/io/File;)V
    .locals 1
    .param p1, "dbfile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 73
    iput-object p1, p0, Lio/sqlc/SQLiteAndroidDatabase;->dbFile:Ljava/io/File;

    .line 74
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lio/sqlc/SQLiteAndroidDatabase;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    .line 75
    return-void
.end method

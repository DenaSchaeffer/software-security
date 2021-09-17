.class final Lcom/google/zxing/client/android/encode/MECARDContactEncoder;
.super Lcom/google/zxing/client/android/encode/ContactEncoder;
.source "MECARDContactEncoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDNameDisplayFormatter;,
        Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDTelDisplayFormatter;,
        Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDFieldFormatter;
    }
.end annotation


# static fields
.field private static final TERMINATOR:C = ';'


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/google/zxing/client/android/encode/ContactEncoder;-><init>()V

    return-void
.end method


# virtual methods
.method public encode(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)[Ljava/lang/String;
    .locals 8
    .param p2, "organization"    # Ljava/lang/String;
    .param p8, "note"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "phones":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p5, "phoneTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p6, "emails":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p7, "urls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 43
    .local v0, "newContents":Ljava/lang/StringBuilder;
    const-string v2, "MECARD:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 47
    .local v1, "newDisplayContents":Ljava/lang/StringBuilder;
    new-instance v6, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDFieldFormatter;

    const/4 v2, 0x0

    invoke-direct {v6, v2}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDFieldFormatter;-><init>(Lcom/google/zxing/client/android/encode/MECARDContactEncoder$1;)V

    .line 49
    .local v6, "fieldFormatter":Lcom/google/zxing/client/android/encode/Formatter;
    const-string v2, "N"

    const/4 v4, 0x1

    new-instance v5, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDNameDisplayFormatter;

    const/4 v3, 0x0

    invoke-direct {v5, v3}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDNameDisplayFormatter;-><init>(Lcom/google/zxing/client/android/encode/MECARDContactEncoder$1;)V

    const/16 v7, 0x3b

    move-object v3, p1

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;->appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 52
    const-string v2, "ORG"

    const/16 v5, 0x3b

    move-object v3, p2

    move-object v4, v6

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;->append(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 54
    const-string v2, "ADR"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/16 v7, 0x3b

    move-object v3, p3

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;->appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 56
    const-string v2, "TEL"

    const v4, 0x7fffffff

    new-instance v5, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDTelDisplayFormatter;

    const/4 v3, 0x0

    invoke-direct {v5, v3}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDTelDisplayFormatter;-><init>(Lcom/google/zxing/client/android/encode/MECARDContactEncoder$1;)V

    const/16 v7, 0x3b

    move-object v3, p4

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;->appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 59
    const-string v2, "EMAIL"

    const v4, 0x7fffffff

    const/4 v5, 0x0

    const/16 v7, 0x3b

    move-object v3, p6

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;->appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 62
    const-string v2, "URL"

    const v4, 0x7fffffff

    const/4 v5, 0x0

    const/16 v7, 0x3b

    move-object v3, p7

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;->appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 65
    const-string v2, "NOTE"

    const/16 v5, 0x3b

    move-object/from16 v3, p8

    move-object v4, v6

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;->append(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 67
    const/16 v2, 0x3b

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    return-object v2
.end method

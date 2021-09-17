.class final Lcom/google/zxing/client/android/encode/VCardContactEncoder;
.super Lcom/google/zxing/client/android/encode/ContactEncoder;
.source "VCardContactEncoder.java"


# static fields
.field private static final TERMINATOR:C = '\n'


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/google/zxing/client/android/encode/ContactEncoder;-><init>()V

    return-void
.end method

.method private static buildPhoneMetadata(Ljava/util/Collection;Ljava/util/List;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation

    .prologue
    .local p0, "phones":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local p1, "phoneTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v8, 0x0

    .line 80
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_2

    :cond_0
    move-object v4, v8

    .line 108
    :cond_1
    return-object v4

    .line 83
    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v4, "metadataForIndex":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v9

    if-ge v2, v9, :cond_1

    .line 85
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v9

    if-gt v9, v2, :cond_4

    .line 86
    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 88
    :cond_4
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 89
    .local v3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 91
    .local v7, "typeTokens":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v9, "TYPE"

    invoke-interface {v3, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 93
    .local v6, "typeString":Ljava/lang/String;
    invoke-static {v6}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->maybeIntValue(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 94
    .local v0, "androidType":Ljava/lang/Integer;
    if-nez v0, :cond_5

    .line 95
    invoke-interface {v7, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 97
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-static {v9}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->vCardPurposeLabelForAndroidType(I)Ljava/lang/String;

    move-result-object v5

    .line 98
    .local v5, "purpose":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-static {v9}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->vCardContextLabelForAndroidType(I)Ljava/lang/String;

    move-result-object v1

    .line 99
    .local v1, "context":Ljava/lang/String;
    if-eqz v5, :cond_6

    .line 100
    invoke-interface {v7, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 102
    :cond_6
    if-eqz v1, :cond_3

    .line 103
    invoke-interface {v7, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private static maybeIntValue(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 113
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 115
    :goto_0
    return-object v1

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static vCardContextLabelForAndroidType(I)Ljava/lang/String;
    .locals 1
    .param p0, "androidType"    # I

    .prologue
    .line 138
    packed-switch p0, :pswitch_data_0

    .line 151
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 143
    :pswitch_1
    const-string v0, "home"

    goto :goto_0

    .line 149
    :pswitch_2
    const-string v0, "work"

    goto :goto_0

    .line 138
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private static vCardPurposeLabelForAndroidType(I)Ljava/lang/String;
    .locals 1
    .param p0, "androidType"    # I

    .prologue
    .line 120
    sparse-switch p0, :sswitch_data_0

    .line 133
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 124
    :sswitch_0
    const-string v0, "fax"

    goto :goto_0

    .line 127
    :sswitch_1
    const-string v0, "pager"

    goto :goto_0

    .line 129
    :sswitch_2
    const-string v0, "textphone"

    goto :goto_0

    .line 131
    :sswitch_3
    const-string v0, "text"

    goto :goto_0

    .line 120
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x5 -> :sswitch_0
        0x6 -> :sswitch_1
        0xd -> :sswitch_0
        0x10 -> :sswitch_2
        0x12 -> :sswitch_1
        0x14 -> :sswitch_3
    .end sparse-switch
.end method


# virtual methods
.method public encode(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)[Ljava/lang/String;
    .locals 16
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
    .line 47
    .local p1, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "phones":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p5, "phoneTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p6, "emails":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p7, "urls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 48
    .local v0, "newContents":Ljava/lang/StringBuilder;
    const-string v2, "BEGIN:VCARD"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 49
    const-string v2, "VERSION:3.0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 53
    .local v1, "newDisplayContents":Ljava/lang/StringBuilder;
    new-instance v6, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;

    invoke-direct {v6}, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;-><init>()V

    .line 55
    .local v6, "fieldFormatter":Lcom/google/zxing/client/android/encode/Formatter;
    const-string v2, "N"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/16 v7, 0xa

    move-object/from16 v3, p1

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 57
    const-string v2, "ORG"

    const/16 v5, 0xa

    move-object/from16 v3, p2

    move-object v4, v6

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->append(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 59
    const-string v2, "ADR"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/16 v7, 0xa

    move-object/from16 v3, p3

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 61
    invoke-static/range {p4 .. p5}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->buildPhoneMetadata(Ljava/util/Collection;Ljava/util/List;)Ljava/util/List;

    move-result-object v15

    .line 62
    .local v15, "phoneMetadata":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;>;"
    const-string v9, "TEL"

    const v11, 0x7fffffff

    new-instance v12, Lcom/google/zxing/client/android/encode/VCardTelDisplayFormatter;

    invoke-direct {v12, v15}, Lcom/google/zxing/client/android/encode/VCardTelDisplayFormatter;-><init>(Ljava/util/List;)V

    new-instance v13, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;

    invoke-direct {v13, v15}, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;-><init>(Ljava/util/List;)V

    const/16 v14, 0xa

    move-object v7, v0

    move-object v8, v1

    move-object/from16 v10, p4

    invoke-static/range {v7 .. v14}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 66
    const-string v2, "EMAIL"

    const v4, 0x7fffffff

    const/4 v5, 0x0

    const/16 v7, 0xa

    move-object/from16 v3, p6

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 69
    const-string v2, "URL"

    const v4, 0x7fffffff

    const/4 v5, 0x0

    const/16 v7, 0xa

    move-object/from16 v3, p7

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 72
    const-string v2, "NOTE"

    const/16 v5, 0xa

    move-object/from16 v3, p8

    move-object v4, v6

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;->append(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Lcom/google/zxing/client/android/encode/Formatter;C)V

    .line 74
    const-string v2, "END:VCARD"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
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

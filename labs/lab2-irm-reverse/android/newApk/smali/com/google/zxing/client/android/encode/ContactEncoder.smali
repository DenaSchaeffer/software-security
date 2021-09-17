.class abstract Lcom/google/zxing/client/android/encode/ContactEncoder;
.super Ljava/lang/Object;
.source "ContactEncoder.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static append(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Lcom/google/zxing/client/android/encode/Formatter;C)V
    .locals 3
    .param p0, "newContents"    # Ljava/lang/StringBuilder;
    .param p1, "newDisplayContents"    # Ljava/lang/StringBuilder;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "fieldFormatter"    # Lcom/google/zxing/client/android/encode/Formatter;
    .param p5, "terminator"    # C

    .prologue
    .line 61
    invoke-static {p3}, Lcom/google/zxing/client/android/encode/ContactEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 62
    .local v0, "trimmed":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 63
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p4, v0, v2}, Lcom/google/zxing/client/android/encode/Formatter;->format(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    :cond_0
    return-void
.end method

.method static appendUpToUnique(Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;ILcom/google/zxing/client/android/encode/Formatter;Lcom/google/zxing/client/android/encode/Formatter;C)V
    .locals 8
    .param p0, "newContents"    # Ljava/lang/StringBuilder;
    .param p1, "newDisplayContents"    # Ljava/lang/StringBuilder;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p4, "max"    # I
    .param p5, "displayFormatter"    # Lcom/google/zxing/client/android/encode/Formatter;
    .param p6, "fieldFormatter"    # Lcom/google/zxing/client/android/encode/Formatter;
    .param p7, "terminator"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/lang/StringBuilder;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I",
            "Lcom/google/zxing/client/android/encode/Formatter;",
            "Lcom/google/zxing/client/android/encode/Formatter;",
            "C)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p3, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p3, :cond_1

    .line 94
    :cond_0
    return-void

    .line 79
    :cond_1
    const/4 v0, 0x0

    .line 80
    .local v0, "count":I
    new-instance v4, Ljava/util/HashSet;

    const/4 v6, 0x2

    invoke-direct {v4, v6}, Ljava/util/HashSet;-><init>(I)V

    .line 81
    .local v4, "uniques":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_0

    .line 82
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 83
    .local v5, "value":Ljava/lang/String;
    invoke-static {v5}, Lcom/google/zxing/client/android/encode/ContactEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 84
    .local v3, "trimmed":Ljava/lang/String;
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    invoke-interface {v4, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 85
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p6, v3, v2}, Lcom/google/zxing/client/android/encode/Formatter;->format(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    if-nez p5, :cond_3

    move-object v1, v3

    .line 87
    .local v1, "display":Ljava/lang/CharSequence;
    :goto_1
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0xa

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 88
    add-int/lit8 v0, v0, 0x1

    if-eq v0, p4, :cond_0

    .line 91
    invoke-interface {v4, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 81
    .end local v1    # "display":Ljava/lang/CharSequence;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 86
    :cond_3
    invoke-interface {p5, v3, v2}, Lcom/google/zxing/client/android/encode/Formatter;->format(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    move-result-object v1

    goto :goto_1
.end method

.method static trim(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 48
    if-nez p0, :cond_0

    .line 52
    :goto_0
    return-object v1

    .line 51
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "result":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v0, v1

    .end local v0    # "result":Ljava/lang/String;
    :cond_1
    move-object v1, v0

    goto :goto_0
.end method


# virtual methods
.method abstract encode(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)[Ljava/lang/String;
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
.end method

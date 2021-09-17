.class final Lcom/google/zxing/client/android/encode/VCardTelDisplayFormatter;
.super Ljava/lang/Object;
.source "VCardTelDisplayFormatter.java"

# interfaces
.implements Lcom/google/zxing/client/android/encode/Formatter;


# instance fields
.field private final metadataForIndex:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
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
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/zxing/client/android/encode/VCardTelDisplayFormatter;-><init>(Ljava/util/List;)V

    .line 35
    return-void
.end method

.method constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;>;>;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p1, "metadataForIndex":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/google/zxing/client/android/encode/VCardTelDisplayFormatter;->metadataForIndex:Ljava/util/List;

    .line 39
    return-void
.end method

.method private static formatMetadata(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/CharSequence;
    .locals 7
    .param p0, "value"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/lang/CharSequence;"
        }
    .end annotation

    .prologue
    .line 51
    .local p1, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    move-object v3, p0

    .line 70
    :goto_0
    return-object v3

    .line 54
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .local v3, "withMetadata":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 56
    .local v0, "metadatum":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 57
    .local v1, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 60
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 61
    .local v2, "valuesIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 63
    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 66
    .end local v0    # "metadatum":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    .end local v1    # "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2    # "valuesIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_4

    .line 67
    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    :cond_4
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method


# virtual methods
.method public format(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;
    .locals 2
    .param p1, "value"    # Ljava/lang/CharSequence;
    .param p2, "index"    # I

    .prologue
    .line 43
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 44
    iget-object v1, p0, Lcom/google/zxing/client/android/encode/VCardTelDisplayFormatter;->metadataForIndex:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/zxing/client/android/encode/VCardTelDisplayFormatter;->metadataForIndex:Ljava/util/List;

    .line 45
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-gt v1, p2, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 46
    .local v0, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    :goto_0
    invoke-static {p1, v0}, Lcom/google/zxing/client/android/encode/VCardTelDisplayFormatter;->formatMetadata(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 47
    return-object p1

    .line 45
    .end local v0    # "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    :cond_1
    iget-object v1, p0, Lcom/google/zxing/client/android/encode/VCardTelDisplayFormatter;->metadataForIndex:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    move-object v0, v1

    goto :goto_0
.end method

.class final Lcom/google/zxing/client/android/encode/VCardFieldFormatter;
.super Ljava/lang/Object;
.source "VCardFieldFormatter.java"

# interfaces
.implements Lcom/google/zxing/client/android/encode/Formatter;


# static fields
.field private static final NEWLINE:Ljava/util/regex/Pattern;

.field private static final RESERVED_VCARD_CHARS:Ljava/util/regex/Pattern;


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
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-string v0, "([\\\\,;])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;->RESERVED_VCARD_CHARS:Ljava/util/regex/Pattern;

    .line 31
    const-string v0, "\\n"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;->NEWLINE:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;-><init>(Ljava/util/List;)V

    .line 37
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
    .line 39
    .local p1, "metadataForIndex":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;->metadataForIndex:Ljava/util/List;

    .line 41
    return-void
.end method

.method private static formatMetadata(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/CharSequence;
    .locals 9
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
    .local p1, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    const/16 v8, 0x22

    const/4 v7, 0x1

    .line 54
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .local v3, "withMetadata":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_3

    .line 56
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 57
    .local v0, "metadatum":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 58
    .local v1, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 61
    const/16 v4, 0x3b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v6, 0x3d

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v4

    if-le v4, v7, :cond_1

    .line 63
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    :cond_1
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 66
    .local v2, "valuesIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 68
    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 70
    :cond_2
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v4

    if-le v4, v7, :cond_0

    .line 71
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 75
    .end local v0    # "metadatum":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    .end local v1    # "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2    # "valuesIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_3
    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 76
    return-object v3
.end method


# virtual methods
.method public format(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;
    .locals 3
    .param p1, "value"    # Ljava/lang/CharSequence;
    .param p2, "index"    # I

    .prologue
    .line 45
    sget-object v1, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;->RESERVED_VCARD_CHARS:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const-string v2, "\\\\$1"

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 46
    sget-object v1, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;->NEWLINE:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 47
    iget-object v1, p0, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;->metadataForIndex:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;->metadataForIndex:Ljava/util/List;

    .line 48
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-gt v1, p2, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 49
    .local v0, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    :goto_0
    invoke-static {p1, v0}, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;->formatMetadata(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 50
    return-object p1

    .line 48
    .end local v0    # "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    :cond_1
    iget-object v1, p0, Lcom/google/zxing/client/android/encode/VCardFieldFormatter;->metadataForIndex:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    move-object v0, v1

    goto :goto_0
.end method

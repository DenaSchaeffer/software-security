.class Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDFieldFormatter;
.super Ljava/lang/Object;
.source "MECARDContactEncoder.java"

# interfaces
.implements Lcom/google/zxing/client/android/encode/Formatter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/client/android/encode/MECARDContactEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MECARDFieldFormatter"
.end annotation


# static fields
.field private static final NEWLINE:Ljava/util/regex/Pattern;

.field private static final RESERVED_MECARD_CHARS:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 73
    const-string v0, "([\\\\:;])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDFieldFormatter;->RESERVED_MECARD_CHARS:Ljava/util/regex/Pattern;

    .line 74
    const-string v0, "\\n"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDFieldFormatter;->NEWLINE:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/client/android/encode/MECARDContactEncoder$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/zxing/client/android/encode/MECARDContactEncoder$1;

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDFieldFormatter;-><init>()V

    return-void
.end method


# virtual methods
.method public format(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;
    .locals 4
    .param p1, "value"    # Ljava/lang/CharSequence;
    .param p2, "index"    # I

    .prologue
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDFieldFormatter;->NEWLINE:Ljava/util/regex/Pattern;

    sget-object v2, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDFieldFormatter;->RESERVED_MECARD_CHARS:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    const-string v3, "\\\\$1"

    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

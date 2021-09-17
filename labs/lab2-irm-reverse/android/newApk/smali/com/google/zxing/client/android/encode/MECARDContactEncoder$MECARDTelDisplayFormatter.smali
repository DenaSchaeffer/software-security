.class Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDTelDisplayFormatter;
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
    name = "MECARDTelDisplayFormatter"
.end annotation


# static fields
.field private static final NOT_DIGITS:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 82
    const-string v0, "[^0-9]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDTelDisplayFormatter;->NOT_DIGITS:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/client/android/encode/MECARDContactEncoder$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/zxing/client/android/encode/MECARDContactEncoder$1;

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDTelDisplayFormatter;-><init>()V

    return-void
.end method


# virtual methods
.method public format(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;
    .locals 2
    .param p1, "value"    # Ljava/lang/CharSequence;
    .param p2, "index"    # I

    .prologue
    .line 85
    sget-object v0, Lcom/google/zxing/client/android/encode/MECARDContactEncoder$MECARDTelDisplayFormatter;->NOT_DIGITS:Ljava/util/regex/Pattern;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

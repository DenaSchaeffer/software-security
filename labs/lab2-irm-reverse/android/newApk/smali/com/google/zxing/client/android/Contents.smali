.class public final Lcom/google/zxing/client/android/Contents;
.super Ljava/lang/Object;
.source "Contents.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/client/android/Contents$Type;
    }
.end annotation


# static fields
.field public static final EMAIL_KEYS:[Ljava/lang/String;

.field public static final EMAIL_TYPE_KEYS:[Ljava/lang/String;

.field public static final NOTE_KEY:Ljava/lang/String; = "NOTE_KEY"

.field public static final PHONE_KEYS:[Ljava/lang/String;

.field public static final PHONE_TYPE_KEYS:[Ljava/lang/String;

.field public static final URL_KEY:Ljava/lang/String; = "URL_KEY"


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 94
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "phone"

    aput-object v1, v0, v2

    const-string v1, "secondary_phone"

    aput-object v1, v0, v3

    const-string v1, "tertiary_phone"

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/zxing/client/android/Contents;->PHONE_KEYS:[Ljava/lang/String;

    .line 100
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "phone_type"

    aput-object v1, v0, v2

    const-string v1, "secondary_phone_type"

    aput-object v1, v0, v3

    const-string v1, "tertiary_phone_type"

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/zxing/client/android/Contents;->PHONE_TYPE_KEYS:[Ljava/lang/String;

    .line 106
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "email"

    aput-object v1, v0, v2

    const-string v1, "secondary_email"

    aput-object v1, v0, v3

    const-string v1, "tertiary_email"

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/zxing/client/android/Contents;->EMAIL_KEYS:[Ljava/lang/String;

    .line 112
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "email_type"

    aput-object v1, v0, v2

    const-string v1, "secondary_email_type"

    aput-object v1, v0, v3

    const-string v1, "tertiary_email_type"

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/zxing/client/android/Contents;->EMAIL_TYPE_KEYS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

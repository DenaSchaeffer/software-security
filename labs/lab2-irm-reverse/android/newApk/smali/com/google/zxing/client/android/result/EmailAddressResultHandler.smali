.class public final Lcom/google/zxing/client/android/result/EmailAddressResultHandler;
.super Lcom/google/zxing/client/android/result/ResultHandler;
.source "EmailAddressResultHandler.java"


# static fields
.field private static final buttons:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 32
    const/4 v0, 0x2

    new-array v0, v0, [I

    const/4 v1, 0x0

    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_email:I

    aput v2, v0, v1

    const/4 v1, 0x1

    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_add_contact:I

    aput v2, v0, v1

    sput-object v0, Lcom/google/zxing/client/android/result/EmailAddressResultHandler;->buttons:[I

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "result"    # Lcom/google/zxing/client/result/ParsedResult;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/client/android/result/ResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    .line 39
    return-void
.end method


# virtual methods
.method public getButtonCount()I
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/google/zxing/client/android/result/EmailAddressResultHandler;->buttons:[I

    array-length v0, v0

    return v0
.end method

.method public getButtonText(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 48
    sget-object v0, Lcom/google/zxing/client/android/result/EmailAddressResultHandler;->buttons:[I

    aget v0, v0, p1

    return v0
.end method

.method public getDisplayTitle()I
    .locals 1

    .prologue
    .line 70
    sget v0, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->result_email_address:I

    return v0
.end method

.method public handleButtonPress(I)V
    .locals 7
    .param p1, "index"    # I

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/EmailAddressResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v6

    check-cast v6, Lcom/google/zxing/client/result/EmailAddressParsedResult;

    .line 54
    .local v6, "emailResult":Lcom/google/zxing/client/result/EmailAddressParsedResult;
    packed-switch p1, :pswitch_data_0

    .line 66
    :goto_0
    return-void

    .line 56
    :pswitch_0
    invoke-virtual {v6}, Lcom/google/zxing/client/result/EmailAddressParsedResult;->getTos()[Ljava/lang/String;

    move-result-object v1

    .line 57
    invoke-virtual {v6}, Lcom/google/zxing/client/result/EmailAddressParsedResult;->getCCs()[Ljava/lang/String;

    move-result-object v2

    .line 58
    invoke-virtual {v6}, Lcom/google/zxing/client/result/EmailAddressParsedResult;->getBCCs()[Ljava/lang/String;

    move-result-object v3

    .line 59
    invoke-virtual {v6}, Lcom/google/zxing/client/result/EmailAddressParsedResult;->getSubject()Ljava/lang/String;

    move-result-object v4

    .line 60
    invoke-virtual {v6}, Lcom/google/zxing/client/result/EmailAddressParsedResult;->getBody()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    .line 56
    invoke-virtual/range {v0 .. v5}, Lcom/google/zxing/client/android/result/EmailAddressResultHandler;->sendEmail([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 63
    :pswitch_1
    invoke-virtual {v6}, Lcom/google/zxing/client/result/EmailAddressParsedResult;->getTos()[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/client/android/result/EmailAddressResultHandler;->addEmailOnlyContact([Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 54
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

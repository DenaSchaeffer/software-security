.class final Lcom/google/zxing/client/android/encode/QRCodeEncoder;
.super Ljava/lang/Object;
.source "QRCodeEncoder.java"


# static fields
.field private static final BLACK:I = -0x1000000

.field private static final TAG:Ljava/lang/String;

.field private static final WHITE:I = -0x1


# instance fields
.field private final activity:Landroid/content/Context;

.field private contents:Ljava/lang/String;

.field private final dimension:I

.field private displayContents:Ljava/lang/String;

.field private format:Lcom/google/zxing/BarcodeFormat;

.field private title:Ljava/lang/String;

.field private final useVCard:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    const-class v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/content/Intent;IZ)V
    .locals 2
    .param p1, "activity"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "dimension"    # I
    .param p4, "useVCard"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    .line 75
    iput p3, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->dimension:I

    .line 76
    iput-boolean p4, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->useVCard:Z

    .line 77
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "action":Ljava/lang/String;
    const-string v1, "com.google.zxing.client.android.ENCODE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 79
    invoke-direct {p0, p2}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeContentsFromZXingIntent(Landroid/content/Intent;)V

    .line 83
    :cond_0
    :goto_0
    return-void

    .line 80
    :cond_1
    const-string v1, "android.intent.action.SEND"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 81
    invoke-direct {p0, p2}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeContentsFromShareIntent(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private encodeContentsFromShareIntent(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 133
    const-string v0, "android.intent.extra.STREAM"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeFromStreamExtra(Landroid/content/Intent;)V

    .line 138
    :goto_0
    return-void

    .line 136
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeFromTextExtras(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private encodeContentsFromZXingIntent(Landroid/content/Intent;)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 105
    const-string v3, "ENCODE_FORMAT"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, "formatString":Ljava/lang/String;
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    .line 107
    if-eqz v1, :cond_0

    .line 109
    :try_start_0
    invoke-static {v1}, Lcom/google/zxing/BarcodeFormat;->valueOf(Ljava/lang/String;)Lcom/google/zxing/BarcodeFormat;

    move-result-object v3

    iput-object v3, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    sget-object v4, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    if-ne v3, v4, :cond_3

    .line 115
    :cond_1
    const-string v3, "ENCODE_TYPE"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 116
    .local v2, "type":Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 117
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    iput-object v3, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    .line 118
    invoke-direct {p0, p1, v2}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeQRCodeContents(Landroid/content/Intent;Ljava/lang/String;)V

    .line 128
    .end local v2    # "type":Ljava/lang/String;
    :cond_2
    :goto_1
    return-void

    .line 121
    :cond_3
    const-string v3, "ENCODE_DATA"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "data":Ljava/lang/String;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 123
    iput-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 124
    iput-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 125
    iget-object v3, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    sget v4, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->contents_text:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto :goto_1

    .line 110
    .end local v0    # "data":Ljava/lang/String;
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method private encodeFromStreamExtra(Landroid/content/Intent;)V
    .locals 14
    .param p1, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 178
    sget-object v11, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    .line 179
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 180
    .local v2, "bundle":Landroid/os/Bundle;
    if-nez v2, :cond_0

    .line 181
    new-instance v11, Lcom/google/zxing/WriterException;

    const-string v12, "No extras"

    invoke-direct {v11, v12}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 183
    :cond_0
    const-string v11, "android.intent.extra.STREAM"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Landroid/net/Uri;

    .line 184
    .local v8, "uri":Landroid/net/Uri;
    if-nez v8, :cond_1

    .line 185
    new-instance v11, Lcom/google/zxing/WriterException;

    const-string v12, "No EXTRA_STREAM"

    invoke-direct {v11, v12}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 189
    :cond_1
    const/4 v7, 0x0

    .line 191
    .local v7, "stream":Ljava/io/InputStream;
    :try_start_0
    iget-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    invoke-virtual {v11, v8}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v7

    .line 192
    if-nez v7, :cond_3

    .line 193
    new-instance v11, Lcom/google/zxing/WriterException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Can\'t open stream for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 203
    :catch_0
    move-exception v4

    .line 204
    .local v4, "ioe":Ljava/io/IOException;
    :try_start_1
    new-instance v11, Lcom/google/zxing/WriterException;

    invoke-direct {v11, v4}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/Throwable;)V

    throw v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 206
    .end local v4    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v11

    if-eqz v7, :cond_2

    .line 208
    :try_start_2
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 211
    :cond_2
    :goto_0
    throw v11

    .line 195
    :cond_3
    :try_start_3
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 196
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v11, 0x800

    new-array v1, v11, [B

    .line 198
    .local v1, "buffer":[B
    :goto_1
    invoke-virtual {v7, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "bytesRead":I
    if-lez v3, :cond_4

    .line 199
    const/4 v11, 0x0

    invoke-virtual {v0, v1, v11, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 201
    :cond_4
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9

    .line 202
    .local v9, "vcard":[B
    new-instance v10, Ljava/lang/String;

    const/4 v11, 0x0

    array-length v12, v9

    const-string v13, "UTF-8"

    invoke-direct {v10, v9, v11, v12, v13}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 206
    .local v10, "vcardString":Ljava/lang/String;
    if-eqz v7, :cond_5

    .line 208
    :try_start_4
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 214
    :cond_5
    :goto_2
    sget-object v11, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    const-string v12, "Encoding share intent content:"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    sget-object v11, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    invoke-static {v11, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    new-instance v6, Lcom/google/zxing/Result;

    const/4 v11, 0x0

    sget-object v12, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v6, v10, v9, v11, v12}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 217
    .local v6, "result":Lcom/google/zxing/Result;
    invoke-static {v6}, Lcom/google/zxing/client/result/ResultParser;->parseResult(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v5

    .line 218
    .local v5, "parsedResult":Lcom/google/zxing/client/result/ParsedResult;
    instance-of v11, v5, Lcom/google/zxing/client/result/AddressBookParsedResult;

    if-nez v11, :cond_6

    .line 219
    new-instance v11, Lcom/google/zxing/WriterException;

    const-string v12, "Result was not an address"

    invoke-direct {v11, v12}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 221
    :cond_6
    check-cast v5, Lcom/google/zxing/client/result/AddressBookParsedResult;

    .end local v5    # "parsedResult":Lcom/google/zxing/client/result/ParsedResult;
    invoke-direct {p0, v5}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeQRCodeContents(Lcom/google/zxing/client/result/AddressBookParsedResult;)V

    .line 222
    iget-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    if-eqz v11, :cond_7

    iget-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_8

    .line 223
    :cond_7
    new-instance v11, Lcom/google/zxing/WriterException;

    const-string v12, "No content to encode"

    invoke-direct {v11, v12}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 209
    .end local v6    # "result":Lcom/google/zxing/Result;
    :catch_1
    move-exception v11

    goto :goto_2

    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "buffer":[B
    .end local v3    # "bytesRead":I
    .end local v9    # "vcard":[B
    .end local v10    # "vcardString":Ljava/lang/String;
    :catch_2
    move-exception v12

    goto :goto_0

    .line 225
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "buffer":[B
    .restart local v3    # "bytesRead":I
    .restart local v6    # "result":Lcom/google/zxing/Result;
    .restart local v9    # "vcard":[B
    .restart local v10    # "vcardString":Ljava/lang/String;
    :cond_8
    return-void
.end method

.method private encodeFromTextExtras(Landroid/content/Intent;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 142
    const-string v2, "android.intent.extra.TEXT"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/client/android/encode/ContactEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 143
    .local v1, "theContents":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 144
    const-string v2, "android.intent.extra.HTML_TEXT"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/client/android/encode/ContactEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 146
    if-nez v1, :cond_0

    .line 147
    const-string v2, "android.intent.extra.SUBJECT"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/client/android/encode/ContactEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 148
    if-nez v1, :cond_0

    .line 149
    const-string v2, "android.intent.extra.EMAIL"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "emails":[Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 151
    const/4 v2, 0x0

    aget-object v2, v0, v2

    invoke-static {v2}, Lcom/google/zxing/client/android/encode/ContactEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 160
    .end local v0    # "emails":[Ljava/lang/String;
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 161
    :cond_1
    new-instance v2, Lcom/google/zxing/WriterException;

    const-string v3, "Empty EXTRA_TEXT"

    invoke-direct {v2, v3}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 153
    .restart local v0    # "emails":[Ljava/lang/String;
    :cond_2
    const-string v1, "?"

    goto :goto_0

    .line 163
    .end local v0    # "emails":[Ljava/lang/String;
    :cond_3
    iput-object v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 165
    sget-object v2, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    iput-object v2, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    .line 166
    const-string v2, "android.intent.extra.SUBJECT"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 167
    const-string v2, "android.intent.extra.SUBJECT"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 173
    :goto_1
    iget-object v2, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    sget v3, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->contents_text:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    .line 174
    return-void

    .line 168
    :cond_4
    const-string v2, "android.intent.extra.TITLE"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 169
    const-string v2, "android.intent.extra.TITLE"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    goto :goto_1

    .line 171
    :cond_5
    iget-object v2, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    iput-object v2, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    goto :goto_1
.end method

.method private encodeQRCodeContents(Landroid/content/Intent;Ljava/lang/String;)V
    .locals 23
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 228
    const/4 v3, -0x1

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 312
    :cond_1
    :goto_1
    return-void

    .line 228
    :sswitch_0
    const-string v5, "TEXT_TYPE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :sswitch_1
    const-string v5, "EMAIL_TYPE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :sswitch_2
    const-string v5, "PHONE_TYPE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v3, 0x2

    goto :goto_0

    :sswitch_3
    const-string v5, "SMS_TYPE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v3, 0x3

    goto :goto_0

    :sswitch_4
    const-string v5, "CONTACT_TYPE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :sswitch_5
    const-string v5, "LOCATION_TYPE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v3, 0x5

    goto :goto_0

    .line 230
    :pswitch_0
    const-string v3, "ENCODE_DATA"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 231
    .local v21, "textData":Ljava/lang/String;
    if-eqz v21, :cond_1

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 232
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 233
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 234
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    sget v5, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->contents_text:I

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto :goto_1

    .line 239
    .end local v21    # "textData":Ljava/lang/String;
    :pswitch_1
    const-string v3, "ENCODE_DATA"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/zxing/client/android/encode/ContactEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 240
    .local v13, "emailData":Ljava/lang/String;
    if-eqz v13, :cond_1

    .line 241
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mailto:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 242
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 243
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    sget v5, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->contents_email:I

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto/16 :goto_1

    .line 248
    .end local v13    # "emailData":Ljava/lang/String;
    :pswitch_2
    const-string v3, "ENCODE_DATA"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/zxing/client/android/encode/ContactEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 249
    .local v19, "phoneData":Ljava/lang/String;
    if-eqz v19, :cond_1

    .line 250
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tel:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 251
    invoke-static/range {v19 .. v19}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 252
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    sget v5, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->contents_phone:I

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto/16 :goto_1

    .line 257
    .end local v19    # "phoneData":Ljava/lang/String;
    :pswitch_3
    const-string v3, "ENCODE_DATA"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/zxing/client/android/encode/ContactEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 258
    .local v20, "smsData":Ljava/lang/String;
    if-eqz v20, :cond_1

    .line 259
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sms:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 260
    invoke-static/range {v20 .. v20}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 261
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    sget v5, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->contents_sms:I

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto/16 :goto_1

    .line 266
    .end local v20    # "smsData":Ljava/lang/String;
    :pswitch_4
    const-string v3, "ENCODE_DATA"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v12

    .line 267
    .local v12, "contactBundle":Landroid/os/Bundle;
    if-eqz v12, :cond_1

    .line 269
    const-string v3, "name"

    invoke-virtual {v12, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 270
    .local v18, "name":Ljava/lang/String;
    const-string v3, "company"

    invoke-virtual {v12, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 271
    .local v4, "organization":Ljava/lang/String;
    const-string v3, "postal"

    invoke-virtual {v12, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 272
    .local v11, "address":Ljava/lang/String;
    sget-object v3, Lcom/google/zxing/client/android/Contents;->PHONE_KEYS:[Ljava/lang/String;

    invoke-static {v12, v3}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->getAllBundleValues(Landroid/os/Bundle;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    .line 273
    .local v6, "phones":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v3, Lcom/google/zxing/client/android/Contents;->PHONE_TYPE_KEYS:[Ljava/lang/String;

    invoke-static {v12, v3}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->getAllBundleValues(Landroid/os/Bundle;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    .line 274
    .local v7, "phoneTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v3, Lcom/google/zxing/client/android/Contents;->EMAIL_KEYS:[Ljava/lang/String;

    invoke-static {v12, v3}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->getAllBundleValues(Landroid/os/Bundle;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v8

    .line 275
    .local v8, "emails":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v3, "URL_KEY"

    invoke-virtual {v12, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 276
    .local v22, "url":Ljava/lang/String;
    if-nez v22, :cond_2

    const/4 v9, 0x0

    .line 277
    .local v9, "urls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_2
    const-string v3, "NOTE_KEY"

    invoke-virtual {v12, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 279
    .local v10, "note":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->useVCard:Z

    if-eqz v3, :cond_3

    new-instance v2, Lcom/google/zxing/client/android/encode/VCardContactEncoder;

    invoke-direct {v2}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;-><init>()V

    .line 280
    .local v2, "encoder":Lcom/google/zxing/client/android/encode/ContactEncoder;
    :goto_3
    invoke-static/range {v18 .. v18}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 282
    invoke-static {v11}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 280
    invoke-virtual/range {v2 .. v10}, Lcom/google/zxing/client/android/encode/ContactEncoder;->encode(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 289
    .local v14, "encoded":[Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v3, v14, v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 290
    const/4 v3, 0x0

    aget-object v3, v14, v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 291
    const/4 v3, 0x1

    aget-object v3, v14, v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 292
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    sget v5, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->contents_contact:I

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto/16 :goto_1

    .line 276
    .end local v2    # "encoder":Lcom/google/zxing/client/android/encode/ContactEncoder;
    .end local v9    # "urls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "note":Ljava/lang/String;
    .end local v14    # "encoded":[Ljava/lang/String;
    :cond_2
    invoke-static/range {v22 .. v22}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    goto :goto_2

    .line 279
    .restart local v9    # "urls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v10    # "note":Ljava/lang/String;
    :cond_3
    new-instance v2, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;

    invoke-direct {v2}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;-><init>()V

    goto :goto_3

    .line 299
    .end local v4    # "organization":Ljava/lang/String;
    .end local v6    # "phones":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v7    # "phoneTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "emails":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v9    # "urls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "note":Ljava/lang/String;
    .end local v11    # "address":Ljava/lang/String;
    .end local v12    # "contactBundle":Landroid/os/Bundle;
    .end local v18    # "name":Ljava/lang/String;
    .end local v22    # "url":Ljava/lang/String;
    :pswitch_5
    const-string v3, "ENCODE_DATA"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v16

    .line 300
    .local v16, "locationBundle":Landroid/os/Bundle;
    if-eqz v16, :cond_1

    .line 302
    const-string v3, "LAT"

    const v5, 0x7f7fffff    # Float.MAX_VALUE

    move-object/from16 v0, v16

    invoke-virtual {v0, v3, v5}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;F)F

    move-result v15

    .line 303
    .local v15, "latitude":F
    const-string v3, "LONG"

    const v5, 0x7f7fffff    # Float.MAX_VALUE

    move-object/from16 v0, v16

    invoke-virtual {v0, v3, v5}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;F)F

    move-result v17

    .line 304
    .local v17, "longitude":F
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v3, v15, v3

    if-eqz v3, :cond_1

    const v3, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v3, v17, v3

    if-eqz v3, :cond_1

    .line 305
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "geo:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v5, 0x2c

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 306
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 307
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    sget v5, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->contents_location:I

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto/16 :goto_1

    .line 228
    :sswitch_data_0
    .sparse-switch
        -0x4e09e475 -> :sswitch_2
        -0x27f26fe7 -> :sswitch_4
        0x2a45da80 -> :sswitch_3
        0x506b3984 -> :sswitch_5
        0x6a03370c -> :sswitch_0
        0x6d46ba1d -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private encodeQRCodeContents(Lcom/google/zxing/client/result/AddressBookParsedResult;)V
    .locals 11
    .param p1, "contact"    # Lcom/google/zxing/client/result/AddressBookParsedResult;

    .prologue
    const/4 v5, 0x0

    const/4 v10, 0x1

    .line 324
    iget-boolean v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->useVCard:Z

    if-eqz v1, :cond_1

    new-instance v0, Lcom/google/zxing/client/android/encode/VCardContactEncoder;

    invoke-direct {v0}, Lcom/google/zxing/client/android/encode/VCardContactEncoder;-><init>()V

    .line 325
    .local v0, "encoder":Lcom/google/zxing/client/android/encode/ContactEncoder;
    :goto_0
    invoke-virtual {p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNames()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->toList([Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 326
    invoke-virtual {p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getOrg()Ljava/lang/String;

    move-result-object v2

    .line 327
    invoke-virtual {p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getAddresses()[Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->toList([Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 328
    invoke-virtual {p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneNumbers()[Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->toList([Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 330
    invoke-virtual {p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmails()[Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->toList([Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    .line 331
    invoke-virtual {p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getURLs()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->toList([Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    move-object v8, v5

    .line 325
    invoke-virtual/range {v0 .. v8}, Lcom/google/zxing/client/android/encode/ContactEncoder;->encode(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 334
    .local v9, "encoded":[Ljava/lang/String;
    aget-object v1, v9, v10

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 335
    const/4 v1, 0x0

    aget-object v1, v9, v1

    iput-object v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 336
    aget-object v1, v9, v10

    iput-object v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 337
    iget-object v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/content/Context;

    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->contents_contact:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    .line 339
    :cond_0
    return-void

    .line 324
    .end local v0    # "encoder":Lcom/google/zxing/client/android/encode/ContactEncoder;
    .end local v9    # "encoded":[Ljava/lang/String;
    :cond_1
    new-instance v0, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;

    invoke-direct {v0}, Lcom/google/zxing/client/android/encode/MECARDContactEncoder;-><init>()V

    goto :goto_0
.end method

.method private static getAllBundleValues(Landroid/os/Bundle;[Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "keys"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 315
    new-instance v2, Ljava/util/ArrayList;

    array-length v3, p1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 316
    .local v2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    array-length v5, p1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v0, p1, v4

    .line 317
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 318
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_0

    const/4 v3, 0x0

    :goto_1
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 316
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_0

    .line 318
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 320
    .end local v0    # "key":Ljava/lang/String;
    .end local v1    # "value":Ljava/lang/Object;
    :cond_1
    return-object v2
.end method

.method private static guessAppropriateEncoding(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 3
    .param p0, "contents"    # Ljava/lang/CharSequence;

    .prologue
    .line 380
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 381
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/16 v2, 0xff

    if-le v1, v2, :cond_0

    .line 382
    const-string v1, "UTF-8"

    .line 385
    :goto_1
    return-object v1

    .line 380
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 385
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private static toList([Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0, "values"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 342
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method encodeAsBitmap()Landroid/graphics/Bitmap;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 346
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 347
    .local v2, "contentsToEncode":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 348
    const/4 v7, 0x0

    .line 375
    :goto_0
    return-object v7

    .line 350
    :cond_0
    const/4 v6, 0x0

    .line 351
    .local v6, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;Ljava/lang/Object;>;"
    invoke-static {v2}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->guessAppropriateEncoding(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v15

    .line 352
    .local v15, "encoding":Ljava/lang/String;
    if-eqz v15, :cond_1

    .line 353
    new-instance v6, Ljava/util/EnumMap;

    .end local v6    # "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;Ljava/lang/Object;>;"
    const-class v1, Lcom/google/zxing/EncodeHintType;

    invoke-direct {v6, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 354
    .restart local v6    # "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;Ljava/lang/Object;>;"
    sget-object v1, Lcom/google/zxing/EncodeHintType;->CHARACTER_SET:Lcom/google/zxing/EncodeHintType;

    invoke-interface {v6, v1, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    :cond_1
    :try_start_0
    new-instance v1, Lcom/google/zxing/MultiFormatWriter;

    invoke-direct {v1}, Lcom/google/zxing/MultiFormatWriter;-><init>()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->dimension:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->dimension:I

    invoke-virtual/range {v1 .. v6}, Lcom/google/zxing/MultiFormatWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v18

    .line 363
    .local v18, "result":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual/range {v18 .. v18}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v10

    .line 364
    .local v10, "width":I
    invoke-virtual/range {v18 .. v18}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v14

    .line 365
    .local v14, "height":I
    mul-int v1, v10, v14

    new-array v8, v1, [I

    .line 366
    .local v8, "pixels":[I
    const/16 v20, 0x0

    .local v20, "y":I
    :goto_1
    move/from16 v0, v20

    if-ge v0, v14, :cond_4

    .line 367
    mul-int v17, v20, v10

    .line 368
    .local v17, "offset":I
    const/16 v19, 0x0

    .local v19, "x":I
    :goto_2
    move/from16 v0, v19

    if-ge v0, v10, :cond_3

    .line 369
    add-int v3, v17, v19

    invoke-virtual/range {v18 .. v20}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v1

    if-eqz v1, :cond_2

    const/high16 v1, -0x1000000

    :goto_3
    aput v1, v8, v3

    .line 368
    add-int/lit8 v19, v19, 0x1

    goto :goto_2

    .line 359
    .end local v8    # "pixels":[I
    .end local v10    # "width":I
    .end local v14    # "height":I
    .end local v17    # "offset":I
    .end local v18    # "result":Lcom/google/zxing/common/BitMatrix;
    .end local v19    # "x":I
    .end local v20    # "y":I
    :catch_0
    move-exception v16

    .line 361
    .local v16, "iae":Ljava/lang/IllegalArgumentException;
    const/4 v7, 0x0

    goto :goto_0

    .line 369
    .end local v16    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v8    # "pixels":[I
    .restart local v10    # "width":I
    .restart local v14    # "height":I
    .restart local v17    # "offset":I
    .restart local v18    # "result":Lcom/google/zxing/common/BitMatrix;
    .restart local v19    # "x":I
    .restart local v20    # "y":I
    :cond_2
    const/4 v1, -0x1

    goto :goto_3

    .line 366
    :cond_3
    add-int/lit8 v20, v20, 0x1

    goto :goto_1

    .line 373
    .end local v17    # "offset":I
    .end local v19    # "x":I
    :cond_4
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v10, v14, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 374
    .local v7, "bitmap":Landroid/graphics/Bitmap;
    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move v13, v10

    invoke-virtual/range {v7 .. v14}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    goto :goto_0
.end method

.method getContents()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    return-object v0
.end method

.method getDisplayContents()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    return-object v0
.end method

.method getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    return-object v0
.end method

.method isUseVCard()Z
    .locals 1

    .prologue
    .line 98
    iget-boolean v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->useVCard:Z

    return v0
.end method

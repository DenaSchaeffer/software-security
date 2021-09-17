.class public final Lcom/google/zxing/client/android/HttpHelper;
.super Ljava/lang/Object;
.source "HttpHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/client/android/HttpHelper$ContentType;
    }
.end annotation


# static fields
.field private static final REDIRECTOR_DOMAINS:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 39
    const-class v0, Lcom/google/zxing/client/android/HttpHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/HttpHelper;->TAG:Ljava/lang/String;

    .line 41
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x10

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "amzn.to"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "bit.ly"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "bitly.com"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "fb.me"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "goo.gl"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "is.gd"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "j.mp"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "lnkd.in"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "ow.ly"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "R.BEETAGG.COM"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "r.beetagg.com"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "SCN.BY"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "su.pr"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "t.co"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "tinyurl.com"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "tr.im"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/google/zxing/client/android/HttpHelper;->REDIRECTOR_DOMAINS:Ljava/util/Collection;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method private static consume(Ljava/net/URLConnection;I)Ljava/lang/CharSequence;
    .locals 8
    .param p0, "connection"    # Ljava/net/URLConnection;
    .param p1, "maxChars"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 146
    invoke-static {p0}, Lcom/google/zxing/client/android/HttpHelper;->getEncoding(Ljava/net/URLConnection;)Ljava/lang/String;

    move-result-object v2

    .line 147
    .local v2, "encoding":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .local v5, "out":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .line 150
    .local v3, "in":Ljava/io/Reader;
    :try_start_0
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v4, v6, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 151
    .end local v3    # "in":Ljava/io/Reader;
    .local v4, "in":Ljava/io/Reader;
    const/16 v6, 0x400

    :try_start_1
    new-array v0, v6, [C

    .line 153
    .local v0, "buffer":[C
    :goto_0
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-ge v6, p1, :cond_1

    invoke-virtual {v4, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    .local v1, "charsRead":I
    if-lez v1, :cond_1

    .line 154
    const/4 v6, 0x0

    invoke-virtual {v5, v0, v6, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 157
    .end local v0    # "buffer":[C
    .end local v1    # "charsRead":I
    :catchall_0
    move-exception v6

    move-object v3, v4

    .end local v4    # "in":Ljava/io/Reader;
    .restart local v3    # "in":Ljava/io/Reader;
    :goto_1
    if-eqz v3, :cond_0

    .line 159
    :try_start_2
    invoke-virtual {v3}, Ljava/io/Reader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_3

    .line 162
    :cond_0
    :goto_2
    throw v6

    .line 157
    .end local v3    # "in":Ljava/io/Reader;
    .restart local v0    # "buffer":[C
    .restart local v4    # "in":Ljava/io/Reader;
    :cond_1
    if-eqz v4, :cond_2

    .line 159
    :try_start_3
    invoke-virtual {v4}, Ljava/io/Reader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_1

    .line 165
    :cond_2
    :goto_3
    return-object v5

    .line 160
    :catch_0
    move-exception v6

    goto :goto_3

    :catch_1
    move-exception v6

    goto :goto_3

    .end local v0    # "buffer":[C
    .end local v4    # "in":Ljava/io/Reader;
    .restart local v3    # "in":Ljava/io/Reader;
    :catch_2
    move-exception v7

    goto :goto_2

    :catch_3
    move-exception v7

    goto :goto_2

    .line 157
    :catchall_1
    move-exception v6

    goto :goto_1
.end method

.method public static downloadViaHttp(Ljava/lang/String;Lcom/google/zxing/client/android/HttpHelper$ContentType;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "type"    # Lcom/google/zxing/client/android/HttpHelper$ContentType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lcom/google/zxing/client/android/HttpHelper;->downloadViaHttp(Ljava/lang/String;Lcom/google/zxing/client/android/HttpHelper$ContentType;I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static downloadViaHttp(Ljava/lang/String;Lcom/google/zxing/client/android/HttpHelper$ContentType;I)Ljava/lang/CharSequence;
    .locals 3
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "type"    # Lcom/google/zxing/client/android/HttpHelper$ContentType;
    .param p2, "maxChars"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    sget-object v1, Lcom/google/zxing/client/android/HttpHelper$1;->$SwitchMap$com$google$zxing$client$android$HttpHelper$ContentType:[I

    invoke-virtual {p1}, Lcom/google/zxing/client/android/HttpHelper$ContentType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 97
    const-string v0, "text/*,*/*"

    .line 99
    .local v0, "contentTypes":Ljava/lang/String;
    :goto_0
    invoke-static {p0, v0, p2}, Lcom/google/zxing/client/android/HttpHelper;->downloadViaHttp(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v1

    return-object v1

    .line 87
    .end local v0    # "contentTypes":Ljava/lang/String;
    :pswitch_0
    const-string v0, "application/xhtml+xml,text/html,text/*,*/*"

    .line 88
    .restart local v0    # "contentTypes":Ljava/lang/String;
    goto :goto_0

    .line 90
    .end local v0    # "contentTypes":Ljava/lang/String;
    :pswitch_1
    const-string v0, "application/json,text/*,*/*"

    .line 91
    .restart local v0    # "contentTypes":Ljava/lang/String;
    goto :goto_0

    .line 93
    .end local v0    # "contentTypes":Ljava/lang/String;
    :pswitch_2
    const-string v0, "application/xml,text/*,*/*"

    .line 94
    .restart local v0    # "contentTypes":Ljava/lang/String;
    goto :goto_0

    .line 85
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static downloadViaHttp(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/CharSequence;
    .locals 8
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "contentTypes"    # Ljava/lang/String;
    .param p2, "maxChars"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    const/4 v2, 0x0

    .line 104
    .local v2, "redirects":I
    :goto_0
    const/4 v5, 0x5

    if-ge v2, v5, :cond_1

    .line 105
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 106
    .local v4, "url":Ljava/net/URL;
    invoke-static {v4}, Lcom/google/zxing/client/android/HttpHelper;->safelyOpenConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 107
    .local v0, "connection":Ljava/net/HttpURLConnection;
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 108
    const-string v5, "Accept"

    invoke-virtual {v0, v5, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    const-string v5, "Accept-Charset"

    const-string v6, "utf-8,*"

    invoke-virtual {v0, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const-string v5, "User-Agent"

    const-string v6, "ZXing (Android)"

    invoke-virtual {v0, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    :try_start_0
    invoke-static {v0}, Lcom/google/zxing/client/android/HttpHelper;->safelyConnect(Ljava/net/HttpURLConnection;)I

    move-result v3

    .line 113
    .local v3, "responseCode":I
    sparse-switch v3, :sswitch_data_0

    .line 125
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Bad HTTP response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    .end local v3    # "responseCode":I
    :catchall_0
    move-exception v5

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v5

    .line 115
    .restart local v3    # "responseCode":I
    :sswitch_0
    :try_start_1
    invoke-static {v0, p2}, Lcom/google/zxing/client/android/HttpHelper;->consume(Ljava/net/URLConnection;I)Ljava/lang/CharSequence;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v5

    .line 128
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 115
    return-object v5

    .line 117
    :sswitch_1
    :try_start_2
    const-string v5, "Location"

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v1

    .line 118
    .local v1, "location":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 119
    move-object p0, v1

    .line 120
    add-int/lit8 v2, v2, 0x1

    .line 128
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    .line 123
    :cond_0
    :try_start_3
    new-instance v5, Ljava/io/IOException;

    const-string v6, "No Location"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 131
    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    .end local v1    # "location":Ljava/lang/String;
    .end local v3    # "responseCode":I
    .end local v4    # "url":Ljava/net/URL;
    :cond_1
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Too many redirects"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 113
    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0x12e -> :sswitch_1
    .end sparse-switch
.end method

.method private static getEncoding(Ljava/net/URLConnection;)Ljava/lang/String;
    .locals 3
    .param p0, "connection"    # Ljava/net/URLConnection;

    .prologue
    .line 135
    const-string v2, "Content-Type"

    invoke-virtual {p0, v2}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 136
    .local v1, "contentTypeHeader":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 137
    const-string v2, "charset="

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 138
    .local v0, "charsetStart":I
    if-ltz v0, :cond_0

    .line 139
    const-string v2, "charset="

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 142
    .end local v0    # "charsetStart":I
    :goto_0
    return-object v2

    :cond_0
    const-string v2, "UTF-8"

    goto :goto_0
.end method

.method private static safelyConnect(Ljava/net/HttpURLConnection;)I
    .locals 2
    .param p0, "connection"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    :try_start_0
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->connect()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_4

    .line 224
    :try_start_1
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_6

    move-result v1

    return v1

    .line 219
    :catch_0
    move-exception v0

    .line 221
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_0
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 225
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v0

    .line 227
    .restart local v0    # "e":Ljava/lang/RuntimeException;
    :goto_1
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 219
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_2
    move-exception v0

    goto :goto_0

    :catch_3
    move-exception v0

    goto :goto_0

    :catch_4
    move-exception v0

    goto :goto_0

    .line 225
    :catch_5
    move-exception v0

    goto :goto_1

    :catch_6
    move-exception v0

    goto :goto_1
.end method

.method private static safelyOpenConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    .locals 5
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 210
    .local v0, "conn":Ljava/net/URLConnection;
    instance-of v2, v0, Ljava/net/HttpURLConnection;

    if-nez v2, :cond_0

    .line 211
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2}, Ljava/io/IOException;-><init>()V

    throw v2

    .line 205
    .end local v0    # "conn":Ljava/net/URLConnection;
    :catch_0
    move-exception v1

    .line 207
    .local v1, "npe":Ljava/lang/NullPointerException;
    sget-object v2, Lcom/google/zxing/client/android/HttpHelper;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad URI? "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 213
    .end local v1    # "npe":Ljava/lang/NullPointerException;
    .restart local v0    # "conn":Ljava/net/URLConnection;
    :cond_0
    check-cast v0, Ljava/net/HttpURLConnection;

    .end local v0    # "conn":Ljava/net/URLConnection;
    return-object v0
.end method

.method public static unredirect(Ljava/net/URI;)Ljava/net/URI;
    .locals 7
    .param p0, "uri"    # Ljava/net/URI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 169
    sget-object v4, Lcom/google/zxing/client/android/HttpHelper;->REDIRECTOR_DOMAINS:Ljava/util/Collection;

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 195
    .end local p0    # "uri":Ljava/net/URI;
    :goto_0
    return-object p0

    .line 172
    .restart local p0    # "uri":Ljava/net/URI;
    :cond_0
    invoke-virtual {p0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v3

    .line 173
    .local v3, "url":Ljava/net/URL;
    invoke-static {v3}, Lcom/google/zxing/client/android/HttpHelper;->safelyOpenConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 174
    .local v0, "connection":Ljava/net/HttpURLConnection;
    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 175
    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 176
    const-string v4, "HEAD"

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 177
    const-string v4, "User-Agent"

    const-string v5, "ZXing (Android)"

    invoke-virtual {v0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    :try_start_0
    invoke-static {v0}, Lcom/google/zxing/client/android/HttpHelper;->safelyConnect(Ljava/net/HttpURLConnection;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 180
    .local v2, "responseCode":I
    packed-switch v2, :pswitch_data_0

    .line 197
    :cond_1
    :goto_1
    :pswitch_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    .line 186
    :pswitch_1
    :try_start_1
    const-string v4, "Location"

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 187
    .local v1, "location":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 189
    :try_start_2
    new-instance v4, Ljava/net/URI;

    invoke-direct {v4, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 197
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    move-object p0, v4

    .line 189
    goto :goto_0

    .line 197
    .end local v1    # "location":Ljava/lang/String;
    .end local v2    # "responseCode":I
    :catchall_0
    move-exception v4

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v4

    .line 190
    .restart local v1    # "location":Ljava/lang/String;
    .restart local v2    # "responseCode":I
    :catch_0
    move-exception v4

    goto :goto_1

    .line 180
    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.class public final Lcom/google/zxing/client/android/wifi/WifiConfigManager;
.super Landroid/os/AsyncTask;
.source "WifiConfigManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/google/zxing/client/result/WifiParsedResult;",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final HEX_DIGITS:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final wifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lcom/google/zxing/client/android/wifi/WifiConfigManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    .line 36
    const-string v0, "[0-9A-Fa-f]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->HEX_DIGITS:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Landroid/net/wifi/WifiManager;)V
    .locals 0
    .param p1, "wifiManager"    # Landroid/net/wifi/WifiManager;

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->wifiManager:Landroid/net/wifi/WifiManager;

    .line 42
    return-void
.end method

.method private static changeNetworkCommon(Lcom/google/zxing/client/result/WifiParsedResult;)Landroid/net/wifi/WifiConfiguration;
    .locals 3
    .param p0, "wifiResult"    # Lcom/google/zxing/client/result/WifiParsedResult;

    .prologue
    .line 121
    new-instance v0, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v0}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 122
    .local v0, "config":Landroid/net/wifi/WifiConfiguration;
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 123
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 124
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 125
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 126
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 128
    invoke-virtual {p0}, Lcom/google/zxing/client/result/WifiParsedResult;->getSsid()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [I

    invoke-static {v1, v2}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->quoteNonHex(Ljava/lang/String;[I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 129
    invoke-virtual {p0}, Lcom/google/zxing/client/result/WifiParsedResult;->isHidden()Z

    move-result v1

    iput-boolean v1, v0, Landroid/net/wifi/WifiConfiguration;->hiddenSSID:Z

    .line 130
    return-object v0
.end method

.method private static changeNetworkUnEncrypted(Landroid/net/wifi/WifiManager;Lcom/google/zxing/client/result/WifiParsedResult;)V
    .locals 3
    .param p0, "wifiManager"    # Landroid/net/wifi/WifiManager;
    .param p1, "wifiResult"    # Lcom/google/zxing/client/result/WifiParsedResult;

    .prologue
    .line 166
    invoke-static {p1}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->changeNetworkCommon(Lcom/google/zxing/client/result/WifiParsedResult;)Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 167
    .local v0, "config":Landroid/net/wifi/WifiConfiguration;
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 168
    invoke-static {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->updateNetwork(Landroid/net/wifi/WifiManager;Landroid/net/wifi/WifiConfiguration;)V

    .line 169
    return-void
.end method

.method private static changeNetworkWEP(Landroid/net/wifi/WifiManager;Lcom/google/zxing/client/result/WifiParsedResult;)V
    .locals 7
    .param p0, "wifiManager"    # Landroid/net/wifi/WifiManager;
    .param p1, "wifiResult"    # Lcom/google/zxing/client/result/WifiParsedResult;

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 135
    invoke-static {p1}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->changeNetworkCommon(Lcom/google/zxing/client/result/WifiParsedResult;)Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 136
    .local v0, "config":Landroid/net/wifi/WifiConfiguration;
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/zxing/client/result/WifiParsedResult;->getPassword()Ljava/lang/String;

    move-result-object v2

    new-array v3, v6, [I

    fill-array-data v3, :array_0

    invoke-static {v2, v3}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->quoteNonHex(Ljava/lang/String;[I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    .line 137
    iput v4, v0, Landroid/net/wifi/WifiConfiguration;->wepTxKeyIndex:I

    .line 138
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 139
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 140
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 141
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 142
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 143
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 144
    invoke-static {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->updateNetwork(Landroid/net/wifi/WifiManager;Landroid/net/wifi/WifiConfiguration;)V

    .line 145
    return-void

    .line 136
    nop

    :array_0
    .array-data 4
        0xa
        0x1a
        0x3a
    .end array-data
.end method

.method private static changeNetworkWPA(Landroid/net/wifi/WifiManager;Lcom/google/zxing/client/result/WifiParsedResult;)V
    .locals 7
    .param p0, "wifiManager"    # Landroid/net/wifi/WifiManager;
    .param p1, "wifiResult"    # Lcom/google/zxing/client/result/WifiParsedResult;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 149
    invoke-static {p1}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->changeNetworkCommon(Lcom/google/zxing/client/result/WifiParsedResult;)Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 151
    .local v0, "config":Landroid/net/wifi/WifiConfiguration;
    invoke-virtual {p1}, Lcom/google/zxing/client/result/WifiParsedResult;->getPassword()Ljava/lang/String;

    move-result-object v1

    new-array v2, v4, [I

    const/16 v3, 0x40

    aput v3, v2, v5

    invoke-static {v1, v2}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->quoteNonHex(Ljava/lang/String;[I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    .line 152
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 153
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 154
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 155
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 156
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 157
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 158
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 159
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 160
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 161
    invoke-static {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->updateNetwork(Landroid/net/wifi/WifiManager;Landroid/net/wifi/WifiConfiguration;)V

    .line 162
    return-void
.end method

.method private static convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x22

    .line 195
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 196
    :cond_0
    const/4 p0, 0x0

    .line 202
    .end local p0    # "s":Ljava/lang/String;
    :cond_1
    :goto_0
    return-object p0

    .line 199
    .restart local p0    # "s":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v1, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-eq v0, v1, :cond_1

    .line 202
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method private static findNetworkInExistingConfig(Landroid/net/wifi/WifiManager;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 5
    .param p0, "wifiManager"    # Landroid/net/wifi/WifiManager;
    .param p1, "ssid"    # Ljava/lang/String;

    .prologue
    .line 172
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v1

    .line 173
    .local v1, "existingConfigs":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Landroid/net/wifi/WifiConfiguration;>;"
    if-eqz v1, :cond_1

    .line 174
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiConfiguration;

    .line 175
    .local v0, "existingConfig":Landroid/net/wifi/WifiConfiguration;
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 176
    .local v2, "existingSSID":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 177
    iget v3, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 181
    .end local v0    # "existingConfig":Landroid/net/wifi/WifiConfiguration;
    .end local v2    # "existingSSID":Ljava/lang/String;
    :goto_0
    return-object v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static varargs isHexOfLength(Ljava/lang/CharSequence;[I)Z
    .locals 6
    .param p0, "value"    # Ljava/lang/CharSequence;
    .param p1, "allowedLengths"    # [I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 212
    if-eqz p0, :cond_0

    sget-object v3, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->HEX_DIGITS:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-nez v3, :cond_2

    :cond_0
    move v1, v2

    .line 223
    :cond_1
    :goto_0
    return v1

    .line 215
    :cond_2
    array-length v3, p1

    if-eqz v3, :cond_1

    .line 218
    array-length v4, p1

    move v3, v2

    :goto_1
    if-ge v3, v4, :cond_3

    aget v0, p1, v3

    .line 219
    .local v0, "length":I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-eq v5, v0, :cond_1

    .line 218
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .end local v0    # "length":I
    :cond_3
    move v1, v2

    .line 223
    goto :goto_0
.end method

.method private static varargs quoteNonHex(Ljava/lang/String;[I)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "allowedLengths"    # [I

    .prologue
    .line 185
    invoke-static {p0, p1}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->isHexOfLength(Ljava/lang/CharSequence;[I)Z

    move-result v0

    if-eqz v0, :cond_0

    .end local p0    # "value":Ljava/lang/String;
    :goto_0
    return-object p0

    .restart local p0    # "value":Ljava/lang/String;
    :cond_0
    invoke-static {p0}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method private static updateNetwork(Landroid/net/wifi/WifiManager;Landroid/net/wifi/WifiConfiguration;)V
    .locals 5
    .param p0, "wifiManager"    # Landroid/net/wifi/WifiManager;
    .param p1, "config"    # Landroid/net/wifi/WifiConfiguration;

    .prologue
    .line 100
    iget-object v2, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-static {p0, v2}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->findNetworkInExistingConfig(Landroid/net/wifi/WifiManager;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 101
    .local v0, "foundNetworkID":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 102
    sget-object v2, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Removing old configuration for network "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/net/wifi/WifiManager;->removeNetwork(I)Z

    .line 104
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    .line 106
    :cond_0
    invoke-virtual {p0, p1}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v1

    .line 107
    .local v1, "networkId":I
    if-ltz v1, :cond_2

    .line 109
    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 110
    sget-object v2, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Associating to network "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    .line 118
    :goto_0
    return-void

    .line 113
    :cond_1
    sget-object v2, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to enable network "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 116
    :cond_2
    sget-object v2, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to add network "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/google/zxing/client/result/WifiParsedResult;)Ljava/lang/Object;
    .locals 10
    .param p1, "args"    # [Lcom/google/zxing/client/result/WifiParsedResult;

    .prologue
    const/4 v9, 0x0

    .line 46
    const/4 v6, 0x0

    aget-object v5, p1, v6

    .line 48
    .local v5, "theWifiResult":Lcom/google/zxing/client/result/WifiParsedResult;
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v6

    if-nez v6, :cond_3

    .line 49
    sget-object v6, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    const-string v7, "Enabling wi-fi..."

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->wifiManager:Landroid/net/wifi/WifiManager;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 51
    sget-object v6, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    const-string v7, "Wi-fi enabled"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    const/4 v0, 0x0

    .line 58
    .local v0, "count":I
    :goto_0
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v6

    if-nez v6, :cond_3

    .line 59
    const/16 v6, 0xa

    if-lt v0, v6, :cond_2

    .line 60
    sget-object v6, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    const-string v7, "Took too long to enable wi-fi, quitting"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .end local v0    # "count":I
    :cond_0
    :goto_1
    return-object v9

    .line 53
    :cond_1
    sget-object v6, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    const-string v7, "Wi-fi could not be enabled!"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 63
    .restart local v0    # "count":I
    :cond_2
    sget-object v6, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    const-string v7, "Still waiting for wi-fi to enable..."

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    const-wide/16 v6, 0x3e8

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 69
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 72
    .end local v0    # "count":I
    :cond_3
    invoke-virtual {v5}, Lcom/google/zxing/client/result/WifiParsedResult;->getNetworkEncryption()Ljava/lang/String;

    move-result-object v3

    .line 75
    .local v3, "networkTypeString":Ljava/lang/String;
    :try_start_1
    invoke-static {v3}, Lcom/google/zxing/client/android/wifi/NetworkType;->forIntentValue(Ljava/lang/String;)Lcom/google/zxing/client/android/wifi/NetworkType;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 80
    .local v2, "networkType":Lcom/google/zxing/client/android/wifi/NetworkType;
    sget-object v6, Lcom/google/zxing/client/android/wifi/NetworkType;->NO_PASSWORD:Lcom/google/zxing/client/android/wifi/NetworkType;

    if-ne v2, v6, :cond_4

    .line 81
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-static {v6, v5}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->changeNetworkUnEncrypted(Landroid/net/wifi/WifiManager;Lcom/google/zxing/client/result/WifiParsedResult;)V

    goto :goto_1

    .line 76
    .end local v2    # "networkType":Lcom/google/zxing/client/android/wifi/NetworkType;
    :catch_0
    move-exception v1

    .line 77
    .local v1, "ignored":Ljava/lang/IllegalArgumentException;
    sget-object v6, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Bad network type; see NetworkType values: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 83
    .end local v1    # "ignored":Ljava/lang/IllegalArgumentException;
    .restart local v2    # "networkType":Lcom/google/zxing/client/android/wifi/NetworkType;
    :cond_4
    invoke-virtual {v5}, Lcom/google/zxing/client/result/WifiParsedResult;->getPassword()Ljava/lang/String;

    move-result-object v4

    .line 84
    .local v4, "password":Ljava/lang/String;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 85
    sget-object v6, Lcom/google/zxing/client/android/wifi/NetworkType;->WEP:Lcom/google/zxing/client/android/wifi/NetworkType;

    if-ne v2, v6, :cond_5

    .line 86
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-static {v6, v5}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->changeNetworkWEP(Landroid/net/wifi/WifiManager;Lcom/google/zxing/client/result/WifiParsedResult;)V

    goto :goto_1

    .line 87
    :cond_5
    sget-object v6, Lcom/google/zxing/client/android/wifi/NetworkType;->WPA:Lcom/google/zxing/client/android/wifi/NetworkType;

    if-ne v2, v6, :cond_0

    .line 88
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-static {v6, v5}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->changeNetworkWPA(Landroid/net/wifi/WifiManager;Lcom/google/zxing/client/result/WifiParsedResult;)V

    goto :goto_1

    .line 66
    .end local v2    # "networkType":Lcom/google/zxing/client/android/wifi/NetworkType;
    .end local v3    # "networkTypeString":Ljava/lang/String;
    .end local v4    # "password":Ljava/lang/String;
    .restart local v0    # "count":I
    :catch_1
    move-exception v6

    goto :goto_2
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 32
    check-cast p1, [Lcom/google/zxing/client/result/WifiParsedResult;

    invoke-virtual {p0, p1}, Lcom/google/zxing/client/android/wifi/WifiConfigManager;->doInBackground([Lcom/google/zxing/client/result/WifiParsedResult;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

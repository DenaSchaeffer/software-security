.class public final Lcom/google/zxing/client/android/result/AddressBookResultHandler;
.super Lcom/google/zxing/client/android/result/ResultHandler;
.source "AddressBookResultHandler.java"


# static fields
.field private static final BUTTON_TEXTS:[I

.field private static final DATE_FORMATS:[Ljava/text/DateFormat;


# instance fields
.field private buttonCount:I

.field private final fields:[Z


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v2, 0x0

    .line 43
    new-array v1, v9, [Ljava/text/DateFormat;

    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyyMMdd"

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v3, v1, v2

    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyyMMdd\'T\'HHmmss"

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v3, v1, v6

    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyy-MM-dd"

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v3, v1, v7

    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyy-MM-dd\'T\'HH:mm:ss"

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v3, v1, v8

    sput-object v1, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->DATE_FORMATS:[Ljava/text/DateFormat;

    .line 50
    sget-object v3, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->DATE_FORMATS:[Ljava/text/DateFormat;

    array-length v4, v3

    move v1, v2

    .local v0, "format":Ljava/text/DateFormat;
    :goto_0
    if-ge v1, v4, :cond_0

    aget-object v0, v3, v1

    .line 51
    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 50
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 55
    :cond_0
    new-array v1, v9, [I

    sget v3, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_add_contact:I

    aput v3, v1, v2

    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_show_map:I

    aput v2, v1, v6

    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_dial:I

    aput v2, v1, v7

    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_email:I

    aput v2, v1, v8

    sput-object v1, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->BUTTON_TEXTS:[I

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V
    .locals 11
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "result"    # Lcom/google/zxing/client/result/ParsedResult;

    .prologue
    const/4 v10, 0x4

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 83
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/client/android/result/ResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    move-object v0, p2

    .line 84
    check-cast v0, Lcom/google/zxing/client/result/AddressBookParsedResult;

    .line 85
    .local v0, "addressResult":Lcom/google/zxing/client/result/AddressBookParsedResult;
    invoke-virtual {v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getAddresses()[Ljava/lang/String;

    move-result-object v1

    .line 86
    .local v1, "addresses":[Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneNumbers()[Ljava/lang/String;

    move-result-object v3

    .line 87
    .local v3, "phoneNumbers":[Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmails()[Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, "emails":[Ljava/lang/String;
    new-array v5, v10, [Z

    iput-object v5, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    .line 90
    iget-object v5, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    aput-boolean v6, v5, v7

    .line 91
    iget-object v8, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    if-eqz v1, :cond_1

    array-length v5, v1

    if-lez v5, :cond_1

    aget-object v5, v1, v7

    if-eqz v5, :cond_1

    aget-object v5, v1, v7

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    move v5, v6

    :goto_0
    aput-boolean v5, v8, v6

    .line 92
    iget-object v8, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    const/4 v9, 0x2

    if-eqz v3, :cond_2

    array-length v5, v3

    if-lez v5, :cond_2

    move v5, v6

    :goto_1
    aput-boolean v5, v8, v9

    .line 93
    iget-object v5, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    const/4 v8, 0x3

    if-eqz v2, :cond_3

    array-length v9, v2

    if-lez v9, :cond_3

    :goto_2
    aput-boolean v6, v5, v8

    .line 95
    iput v7, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->buttonCount:I

    .line 96
    const/4 v4, 0x0

    .local v4, "x":I
    :goto_3
    if-ge v4, v10, :cond_4

    .line 97
    iget-object v5, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    aget-boolean v5, v5, v4

    if-eqz v5, :cond_0

    .line 98
    iget v5, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->buttonCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->buttonCount:I

    .line 96
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .end local v4    # "x":I
    :cond_1
    move v5, v7

    .line 91
    goto :goto_0

    :cond_2
    move v5, v7

    .line 92
    goto :goto_1

    :cond_3
    move v6, v7

    .line 93
    goto :goto_2

    .line 101
    .restart local v4    # "x":I
    :cond_4
    return-void
.end method

.method private mapIndexToAction(I)I
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 68
    iget v2, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->buttonCount:I

    if-ge p1, v2, :cond_2

    .line 69
    const/4 v0, -0x1

    .line 70
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "x":I
    :goto_0
    const/4 v2, 0x4

    if-ge v1, v2, :cond_2

    .line 71
    iget-object v2, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_0

    .line 72
    add-int/lit8 v0, v0, 0x1

    .line 74
    :cond_0
    if-ne v0, p1, :cond_1

    .line 79
    .end local v0    # "count":I
    .end local v1    # "x":I
    :goto_1
    return v1

    .line 70
    .restart local v0    # "count":I
    .restart local v1    # "x":I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 79
    .end local v0    # "count":I
    .end local v1    # "x":I
    :cond_2
    const/4 v1, -0x1

    goto :goto_1
.end method

.method private static parseDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 155
    sget-object v2, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->DATE_FORMATS:[Ljava/text/DateFormat;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    .line 157
    .local v0, "currentFormat":Ljava/text/DateFormat;
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 162
    .end local v0    # "currentFormat":Ljava/text/DateFormat;
    :goto_1
    return-object v1

    .line 158
    .restart local v0    # "currentFormat":Ljava/text/DateFormat;
    :catch_0
    move-exception v4

    .line 155
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 162
    .end local v0    # "currentFormat":Ljava/text/DateFormat;
    :cond_0
    const/4 v1, 0x0

    goto :goto_1
.end method


# virtual methods
.method public getButtonCount()I
    .locals 1

    .prologue
    .line 105
    iget v0, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->buttonCount:I

    return v0
.end method

.method public getButtonText(I)I
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 110
    sget-object v0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->BUTTON_TEXTS:[I

    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->mapIndexToAction(I)I

    move-result v1

    aget v0, v0, v1

    return v0
.end method

.method public getDisplayContents()Ljava/lang/CharSequence;
    .locals 14

    .prologue
    const/4 v10, 0x0

    .line 168
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/client/result/AddressBookParsedResult;

    .line 169
    .local v7, "result":Lcom/google/zxing/client/result/AddressBookParsedResult;
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v9, 0x64

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 170
    .local v1, "contents":Ljava/lang/StringBuilder;
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNames()[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 171
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    .line 173
    .local v3, "namesLength":I
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPronunciation()Ljava/lang/String;

    move-result-object v6

    .line 174
    .local v6, "pronunciation":Ljava/lang/String;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_0

    .line 175
    const-string v9, "\n("

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    const/16 v9, 0x29

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 180
    :cond_0
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getTitle()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 181
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getOrg()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 182
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getAddresses()[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 183
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneNumbers()[Ljava/lang/String;

    move-result-object v5

    .line 184
    .local v5, "numbers":[Ljava/lang/String;
    if-eqz v5, :cond_2

    .line 185
    array-length v11, v5

    move v9, v10

    :goto_0
    if-ge v9, v11, :cond_2

    aget-object v4, v5, v9

    .line 186
    .local v4, "number":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 187
    invoke-static {v4}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 185
    :cond_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 191
    .end local v4    # "number":Ljava/lang/String;
    :cond_2
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmails()[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 192
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getURLs()[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 194
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getBirthday()Ljava/lang/String;

    move-result-object v0

    .line 195
    .local v0, "birthday":Ljava/lang/String;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_3

    .line 196
    invoke-static {v0}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 197
    .local v2, "date":Ljava/util/Date;
    if-eqz v2, :cond_3

    .line 198
    const/4 v9, 0x2

    invoke-static {v9}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v9

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 201
    .end local v2    # "date":Ljava/util/Date;
    :cond_3
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNote()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 203
    if-lez v3, :cond_4

    .line 205
    new-instance v8, Landroid/text/SpannableString;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 206
    .local v8, "styled":Landroid/text/Spannable;
    new-instance v9, Landroid/text/style/StyleSpan;

    const/4 v11, 0x1

    invoke-direct {v9, v11}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-interface {v8, v9, v10, v3, v10}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 209
    .end local v8    # "styled":Landroid/text/Spannable;
    :goto_1
    return-object v8

    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_1
.end method

.method public getDisplayTitle()I
    .locals 1

    .prologue
    .line 215
    sget v0, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->result_address_book:I

    return v0
.end method

.method public handleButtonPress(I)V
    .locals 22
    .param p1, "index"    # I

    .prologue
    .line 115
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v19

    check-cast v19, Lcom/google/zxing/client/result/AddressBookParsedResult;

    .line 116
    .local v19, "addressResult":Lcom/google/zxing/client/result/AddressBookParsedResult;
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getAddresses()[Ljava/lang/String;

    move-result-object v21

    .line 117
    .local v21, "addresses":[Ljava/lang/String;
    if-eqz v21, :cond_0

    move-object/from16 v0, v21

    array-length v1, v0

    const/4 v2, 0x1

    if-ge v1, v2, :cond_2

    :cond_0
    const/4 v11, 0x0

    .line 118
    .local v11, "address1":Ljava/lang/String;
    :goto_0
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getAddressTypes()[Ljava/lang/String;

    move-result-object v20

    .line 119
    .local v20, "addressTypes":[Ljava/lang/String;
    if-eqz v20, :cond_1

    move-object/from16 v0, v20

    array-length v1, v0

    const/4 v2, 0x1

    if-ge v1, v2, :cond_3

    :cond_1
    const/4 v12, 0x0

    .line 120
    .local v12, "address1Type":Ljava/lang/String;
    :goto_1
    invoke-direct/range {p0 .. p1}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->mapIndexToAction(I)I

    move-result v18

    .line 121
    .local v18, "action":I
    packed-switch v18, :pswitch_data_0

    .line 152
    :goto_2
    return-void

    .line 117
    .end local v11    # "address1":Ljava/lang/String;
    .end local v12    # "address1Type":Ljava/lang/String;
    .end local v18    # "action":I
    .end local v20    # "addressTypes":[Ljava/lang/String;
    :cond_2
    const/4 v1, 0x0

    aget-object v11, v21, v1

    goto :goto_0

    .line 119
    .restart local v11    # "address1":Ljava/lang/String;
    .restart local v20    # "addressTypes":[Ljava/lang/String;
    :cond_3
    const/4 v1, 0x0

    aget-object v12, v20, v1

    goto :goto_1

    .line 123
    .restart local v12    # "address1Type":Ljava/lang/String;
    .restart local v18    # "action":I
    :pswitch_0
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNames()[Ljava/lang/String;

    move-result-object v2

    .line 124
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNicknames()[Ljava/lang/String;

    move-result-object v3

    .line 125
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPronunciation()Ljava/lang/String;

    move-result-object v4

    .line 126
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneNumbers()[Ljava/lang/String;

    move-result-object v5

    .line 127
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneTypes()[Ljava/lang/String;

    move-result-object v6

    .line 128
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmails()[Ljava/lang/String;

    move-result-object v7

    .line 129
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmailTypes()[Ljava/lang/String;

    move-result-object v8

    .line 130
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNote()Ljava/lang/String;

    move-result-object v9

    .line 131
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getInstantMessenger()Ljava/lang/String;

    move-result-object v10

    .line 134
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getOrg()Ljava/lang/String;

    move-result-object v13

    .line 135
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getTitle()Ljava/lang/String;

    move-result-object v14

    .line 136
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getURLs()[Ljava/lang/String;

    move-result-object v15

    .line 137
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getBirthday()Ljava/lang/String;

    move-result-object v16

    .line 138
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getGeo()[Ljava/lang/String;

    move-result-object v17

    move-object/from16 v1, p0

    .line 123
    invoke-virtual/range {v1 .. v17}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->addContact([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_2

    .line 141
    :pswitch_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->searchMap(Ljava/lang/String;)V

    goto :goto_2

    .line 144
    :pswitch_2
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneNumbers()[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->dialPhone(Ljava/lang/String;)V

    goto :goto_2

    .line 147
    :pswitch_3
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmails()[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->sendEmail([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 121
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

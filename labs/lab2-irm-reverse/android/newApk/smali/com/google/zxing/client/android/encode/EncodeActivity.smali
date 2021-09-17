.class public final Lcom/google/zxing/client/android/encode/EncodeActivity;
.super Landroid/app/Activity;
.source "EncodeActivity.java"


# static fields
.field private static final MAX_BARCODE_FILENAME_LENGTH:I = 0x18

.field private static final NOT_ALPHANUMERIC:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String;

.field private static final USE_VCARD_KEY:Ljava/lang/String; = "USE_VCARD"


# instance fields
.field private qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-class v0, Lcom/google/zxing/client/android/encode/EncodeActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/encode/EncodeActivity;->TAG:Ljava/lang/String;

    .line 60
    const-string v0, "[^A-Za-z0-9]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/encode/EncodeActivity;->NOT_ALPHANUMERIC:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private static makeBarcodeFileName(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 4
    .param p0, "contents"    # Ljava/lang/CharSequence;

    .prologue
    const/16 v3, 0x18

    .line 182
    sget-object v1, Lcom/google/zxing/client/android/encode/EncodeActivity;->NOT_ALPHANUMERIC:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 183
    .local v0, "fileName":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v3, :cond_0

    .line 184
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 186
    :cond_0
    return-object v0
.end method

.method private share()V
    .locals 14

    .prologue
    .line 119
    iget-object v5, p0, Lcom/google/zxing/client/android/encode/EncodeActivity;->qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    .line 120
    .local v5, "encoder":Lcom/google/zxing/client/android/encode/QRCodeEncoder;
    if-nez v5, :cond_1

    .line 121
    sget-object v11, Lcom/google/zxing/client/android/encode/EncodeActivity;->TAG:Ljava/lang/String;

    const-string v12, "No existing barcode to send?"

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    :cond_0
    :goto_0
    return-void

    .line 125
    :cond_1
    invoke-virtual {v5}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->getContents()Ljava/lang/String;

    move-result-object v4

    .line 126
    .local v4, "contents":Ljava/lang/String;
    if-nez v4, :cond_2

    .line 127
    sget-object v11, Lcom/google/zxing/client/android/encode/EncodeActivity;->TAG:Ljava/lang/String;

    const-string v12, "No existing barcode to send?"

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 133
    :cond_2
    :try_start_0
    invoke-virtual {v5}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeAsBitmap()Landroid/graphics/Bitmap;
    :try_end_0
    .catch Lcom/google/zxing/WriterException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 138
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_0

    .line 142
    new-instance v3, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v11

    const-string v12, "BarcodeScanner"

    invoke-direct {v3, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 143
    .local v3, "bsRoot":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v11, "Barcodes"

    invoke-direct {v1, v3, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 144
    .local v1, "barcodesRoot":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_3

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v11

    if-nez v11, :cond_3

    .line 145
    sget-object v11, Lcom/google/zxing/client/android/encode/EncodeActivity;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Couldn\'t make dir "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    sget v11, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_unmount_usb:I

    invoke-direct {p0, v11}, Lcom/google/zxing/client/android/encode/EncodeActivity;->showErrorMessage(I)V

    goto :goto_0

    .line 134
    .end local v1    # "barcodesRoot":Ljava/io/File;
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "bsRoot":Ljava/io/File;
    :catch_0
    move-exception v10

    .line 135
    .local v10, "we":Lcom/google/zxing/WriterException;
    sget-object v11, Lcom/google/zxing/client/android/encode/EncodeActivity;->TAG:Ljava/lang/String;

    invoke-static {v11, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 149
    .end local v10    # "we":Lcom/google/zxing/WriterException;
    .restart local v1    # "barcodesRoot":Ljava/io/File;
    .restart local v2    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v3    # "bsRoot":Ljava/io/File;
    :cond_3
    new-instance v0, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v4}, Lcom/google/zxing/client/android/encode/EncodeActivity;->makeBarcodeFileName(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".png"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v0, v1, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 150
    .local v0, "barcodeFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v11

    if-nez v11, :cond_4

    .line 151
    sget-object v11, Lcom/google/zxing/client/android/encode/EncodeActivity;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Could not delete "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    :cond_4
    const/4 v7, 0x0

    .line 156
    .local v7, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 157
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .local v8, "fos":Ljava/io/FileOutputStream;
    :try_start_2
    sget-object v11, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/4 v12, 0x0

    invoke-virtual {v2, v11, v12, v8}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 163
    if-eqz v8, :cond_5

    .line 165
    :try_start_3
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 172
    :cond_5
    :goto_1
    new-instance v9, Landroid/content/Intent;

    const-string v11, "android.intent.action.SEND"

    const-string v12, "mailto:"

    invoke-static {v12}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-direct {v9, v11, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 173
    .local v9, "intent":Landroid/content/Intent;
    const-string v11, "android.intent.extra.SUBJECT"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    sget v13, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->app_name:I

    invoke-virtual {p0, v13}, Lcom/google/zxing/client/android/encode/EncodeActivity;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " - "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v5}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->getTitle()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 174
    const-string v11, "android.intent.extra.TEXT"

    invoke-virtual {v9, v11, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 175
    const-string v11, "android.intent.extra.STREAM"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "file://"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 176
    const-string v11, "image/png"

    invoke-virtual {v9, v11}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 177
    const/high16 v11, 0x80000

    invoke-virtual {v9, v11}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 178
    const/4 v11, 0x0

    invoke-static {v9, v11}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/google/zxing/client/android/encode/EncodeActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 158
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .end local v9    # "intent":Landroid/content/Intent;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v6

    .line 159
    .local v6, "fnfe":Ljava/io/FileNotFoundException;
    :goto_2
    :try_start_4
    sget-object v11, Lcom/google/zxing/client/android/encode/EncodeActivity;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Couldn\'t access file "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " due to "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    sget v11, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_unmount_usb:I

    invoke-direct {p0, v11}, Lcom/google/zxing/client/android/encode/EncodeActivity;->showErrorMessage(I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 163
    if-eqz v7, :cond_0

    .line 165
    :try_start_5
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto/16 :goto_0

    .line 166
    :catch_2
    move-exception v11

    goto/16 :goto_0

    .line 163
    .end local v6    # "fnfe":Ljava/io/FileNotFoundException;
    :catchall_0
    move-exception v11

    :goto_3
    if-eqz v7, :cond_6

    .line 165
    :try_start_6
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 168
    :cond_6
    :goto_4
    throw v11

    .line 166
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v11

    goto/16 :goto_1

    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v12

    goto :goto_4

    .line 163
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v11

    move-object v7, v8

    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    goto :goto_3

    .line 158
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    :catch_5
    move-exception v6

    move-object v7, v8

    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2
.end method

.method private showErrorMessage(I)V
    .locals 3
    .param p1, "message"    # I

    .prologue
    .line 237
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 238
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 239
    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_ok:I

    new-instance v2, Lcom/google/zxing/client/android/FinishListener;

    invoke-direct {v2, p0}, Lcom/google/zxing/client/android/FinishListener;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 240
    new-instance v1, Lcom/google/zxing/client/android/FinishListener;

    invoke-direct {v1, p0}, Lcom/google/zxing/client/android/FinishListener;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 241
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 242
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 67
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 68
    invoke-virtual {p0}, Lcom/google/zxing/client/android/encode/EncodeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 69
    .local v1, "intent":Landroid/content/Intent;
    if-nez v1, :cond_0

    .line 70
    invoke-virtual {p0}, Lcom/google/zxing/client/android/encode/EncodeActivity;->finish()V

    .line 79
    :goto_0
    return-void

    .line 72
    :cond_0
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "action":Ljava/lang/String;
    const-string v2, "com.google.zxing.client.android.ENCODE"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "android.intent.action.SEND"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 74
    :cond_1
    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$layout;->encode:I

    invoke-virtual {p0, v2}, Lcom/google/zxing/client/android/encode/EncodeActivity;->setContentView(I)V

    goto :goto_0

    .line 76
    :cond_2
    invoke-virtual {p0}, Lcom/google/zxing/client/android/encode/EncodeActivity;->finish()V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 7
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/google/zxing/client/android/encode/EncodeActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v3

    .line 84
    .local v3, "menuInflater":Landroid/view/MenuInflater;
    sget v6, Lbarcodescanner/xservices/nl/barcodescanner/R$menu;->encode:I

    invoke-virtual {v3, v6, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 85
    iget-object v6, p0, Lcom/google/zxing/client/android/encode/EncodeActivity;->qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/google/zxing/client/android/encode/EncodeActivity;->qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    invoke-virtual {v6}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->isUseVCard()Z

    move-result v6

    if-eqz v6, :cond_1

    const/4 v5, 0x1

    .line 86
    .local v5, "useVcard":Z
    :goto_0
    if-eqz v5, :cond_2

    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->menu_encode_mecard:I

    .line 87
    .local v1, "encodeNameResource":I
    :goto_1
    sget v6, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->menu_encode:I

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 88
    .local v0, "encodeItem":Landroid/view/MenuItem;
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 89
    invoke-virtual {p0}, Lcom/google/zxing/client/android/encode/EncodeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 90
    .local v2, "intent":Landroid/content/Intent;
    if-eqz v2, :cond_0

    .line 91
    const-string v6, "ENCODE_TYPE"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 92
    .local v4, "type":Ljava/lang/String;
    const-string v6, "CONTACT_TYPE"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    invoke-interface {v0, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 94
    .end local v4    # "type":Ljava/lang/String;
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v6

    return v6

    .line 85
    .end local v0    # "encodeItem":Landroid/view/MenuItem;
    .end local v1    # "encodeNameResource":I
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v5    # "useVcard":Z
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 86
    .restart local v5    # "useVcard":Z
    :cond_2
    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->menu_encode_vcard:I

    goto :goto_1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 6
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 99
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 100
    .local v0, "i":I
    sget v4, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->menu_share:I

    if-ne v0, v4, :cond_0

    .line 101
    invoke-direct {p0}, Lcom/google/zxing/client/android/encode/EncodeActivity;->share()V

    .line 114
    :goto_0
    return v3

    .line 103
    :cond_0
    sget v4, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->menu_encode:I

    if-ne v0, v4, :cond_3

    .line 104
    invoke-virtual {p0}, Lcom/google/zxing/client/android/encode/EncodeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 105
    .local v1, "intent":Landroid/content/Intent;
    if-nez v1, :cond_1

    move v3, v2

    .line 106
    goto :goto_0

    .line 108
    :cond_1
    const-string v4, "USE_VCARD"

    iget-object v5, p0, Lcom/google/zxing/client/android/encode/EncodeActivity;->qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    invoke-virtual {v5}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->isUseVCard()Z

    move-result v5

    if-nez v5, :cond_2

    move v2, v3

    :cond_2
    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 109
    const/high16 v2, 0x4000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 110
    invoke-virtual {p0, v1}, Lcom/google/zxing/client/android/encode/EncodeActivity;->startActivity(Landroid/content/Intent;)V

    .line 111
    invoke-virtual {p0}, Lcom/google/zxing/client/android/encode/EncodeActivity;->finish()V

    goto :goto_0

    .end local v1    # "intent":Landroid/content/Intent;
    :cond_3
    move v3, v2

    .line 114
    goto :goto_0
.end method

.method protected onResume()V
    .locals 15

    .prologue
    const/4 v14, 0x0

    .line 191
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 193
    const-string v12, "window"

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/encode/EncodeActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/WindowManager;

    .line 194
    .local v7, "manager":Landroid/view/WindowManager;
    invoke-interface {v7}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 195
    .local v2, "display":Landroid/view/Display;
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    .line 196
    .local v3, "displaySize":Landroid/graphics/Point;
    invoke-virtual {v2, v3}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 197
    iget v11, v3, Landroid/graphics/Point;->x:I

    .line 198
    .local v11, "width":I
    iget v5, v3, Landroid/graphics/Point;->y:I

    .line 199
    .local v5, "height":I
    if-ge v11, v5, :cond_0

    move v8, v11

    .line 200
    .local v8, "smallerDimension":I
    :goto_0
    mul-int/lit8 v12, v8, 0x7

    div-int/lit8 v8, v12, 0x8

    .line 202
    invoke-virtual {p0}, Lcom/google/zxing/client/android/encode/EncodeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 203
    .local v6, "intent":Landroid/content/Intent;
    if-nez v6, :cond_1

    .line 234
    :goto_1
    return-void

    .end local v6    # "intent":Landroid/content/Intent;
    .end local v8    # "smallerDimension":I
    :cond_0
    move v8, v5

    .line 199
    goto :goto_0

    .line 208
    .restart local v6    # "intent":Landroid/content/Intent;
    .restart local v8    # "smallerDimension":I
    :cond_1
    :try_start_0
    const-string v12, "USE_VCARD"

    const/4 v13, 0x0

    invoke-virtual {v6, v12, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v9

    .line 209
    .local v9, "useVCard":Z
    new-instance v12, Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    invoke-direct {v12, p0, v6, v8, v9}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;-><init>(Landroid/content/Context;Landroid/content/Intent;IZ)V

    iput-object v12, p0, Lcom/google/zxing/client/android/encode/EncodeActivity;->qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    .line 210
    iget-object v12, p0, Lcom/google/zxing/client/android/encode/EncodeActivity;->qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    invoke-virtual {v12}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeAsBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 211
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_2

    .line 212
    sget-object v12, Lcom/google/zxing/client/android/encode/EncodeActivity;->TAG:Ljava/lang/String;

    const-string v13, "Could not encode barcode"

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    sget v12, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_encode_contents_failed:I

    invoke-direct {p0, v12}, Lcom/google/zxing/client/android/encode/EncodeActivity;->showErrorMessage(I)V

    .line 214
    const/4 v12, 0x0

    iput-object v12, p0, Lcom/google/zxing/client/android/encode/EncodeActivity;->qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;
    :try_end_0
    .catch Lcom/google/zxing/WriterException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 229
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v9    # "useVCard":Z
    :catch_0
    move-exception v4

    .line 230
    .local v4, "e":Lcom/google/zxing/WriterException;
    sget-object v12, Lcom/google/zxing/client/android/encode/EncodeActivity;->TAG:Ljava/lang/String;

    const-string v13, "Could not encode barcode"

    invoke-static {v12, v13, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 231
    sget v12, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_encode_contents_failed:I

    invoke-direct {p0, v12}, Lcom/google/zxing/client/android/encode/EncodeActivity;->showErrorMessage(I)V

    .line 232
    iput-object v14, p0, Lcom/google/zxing/client/android/encode/EncodeActivity;->qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    goto :goto_1

    .line 218
    .end local v4    # "e":Lcom/google/zxing/WriterException;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v9    # "useVCard":Z
    :cond_2
    :try_start_1
    sget v12, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->image_view:I

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/encode/EncodeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/ImageView;

    .line 219
    .local v10, "view":Landroid/widget/ImageView;
    invoke-virtual {v10, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 221
    sget v12, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->contents_text_view:I

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/encode/EncodeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 222
    .local v1, "contents":Landroid/widget/TextView;
    const-string v12, "ENCODE_SHOW_CONTENTS"

    const/4 v13, 0x1

    invoke-virtual {v6, v12, v13}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 223
    iget-object v12, p0, Lcom/google/zxing/client/android/encode/EncodeActivity;->qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    invoke-virtual {v12}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->getDisplayContents()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 224
    iget-object v12, p0, Lcom/google/zxing/client/android/encode/EncodeActivity;->qrCodeEncoder:Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    invoke-virtual {v12}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->getTitle()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/encode/EncodeActivity;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 226
    :cond_3
    const-string v12, ""

    invoke-virtual {v1, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    const-string v12, ""

    invoke-virtual {p0, v12}, Lcom/google/zxing/client/android/encode/EncodeActivity;->setTitle(Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Lcom/google/zxing/WriterException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.class Lcom/google/zxing/client/android/PreferencesFragment$CustomSearchURLValidator;
.super Ljava/lang/Object;
.source "PreferencesFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/client/android/PreferencesFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomSearchURLValidator"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/zxing/client/android/PreferencesFragment;


# direct methods
.method private constructor <init>(Lcom/google/zxing/client/android/PreferencesFragment;)V
    .locals 0

    .prologue
    .line 93
    iput-object p1, p0, Lcom/google/zxing/client/android/PreferencesFragment$CustomSearchURLValidator;->this$0:Lcom/google/zxing/client/android/PreferencesFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/client/android/PreferencesFragment;Lcom/google/zxing/client/android/PreferencesFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/zxing/client/android/PreferencesFragment;
    .param p2, "x1"    # Lcom/google/zxing/client/android/PreferencesFragment$1;

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/PreferencesFragment$CustomSearchURLValidator;-><init>(Lcom/google/zxing/client/android/PreferencesFragment;)V

    return-void
.end method

.method private isValid(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 110
    if-nez p1, :cond_1

    .line 128
    :cond_0
    :goto_0
    return v3

    .line 113
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 114
    .local v2, "valueString":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 120
    const-string v5, "%[st]"

    const-string v6, ""

    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 122
    const-string v5, "%f(?![0-9a-f])"

    const-string v6, ""

    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 125
    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 126
    .local v0, "uri":Ljava/net/URI;
    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    if-nez v5, :cond_0

    move v3, v4

    goto :goto_0

    .line 127
    .end local v0    # "uri":Ljava/net/URI;
    :catch_0
    move-exception v1

    .local v1, "use":Ljava/net/URISyntaxException;
    move v3, v4

    .line 128
    goto :goto_0
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    .line 96
    invoke-direct {p0, p2}, Lcom/google/zxing/client/android/PreferencesFragment$CustomSearchURLValidator;->isValid(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 97
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/google/zxing/client/android/PreferencesFragment$CustomSearchURLValidator;->this$0:Lcom/google/zxing/client/android/PreferencesFragment;

    .line 98
    invoke-virtual {v2}, Lcom/google/zxing/client/android/PreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 99
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_error:I

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 100
    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_invalid_value:I

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 101
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 102
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 103
    const/4 v1, 0x0

    .line 105
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    :cond_0
    return v1
.end method

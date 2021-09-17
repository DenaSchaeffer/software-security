.class public final Lcom/google/zxing/client/android/book/SearchBookContentsActivity;
.super Landroid/app/Activity;
.source "SearchBookContentsActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;
    }
.end annotation


# static fields
.field private static final GT_ENTITY_PATTERN:Ljava/util/regex/Pattern;

.field private static final LT_ENTITY_PATTERN:Ljava/util/regex/Pattern;

.field private static final QUOTE_ENTITY_PATTERN:Ljava/util/regex/Pattern;

.field private static final QUOT_ENTITY_PATTERN:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String;

.field private static final TAG_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private final buttonListener:Landroid/view/View$OnClickListener;

.field private headerView:Landroid/widget/TextView;

.field private isbn:Ljava/lang/String;

.field private final keyListener:Landroid/view/View$OnKeyListener;

.field private networkTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask",
            "<",
            "Ljava/lang/String;",
            "**>;"
        }
    .end annotation
.end field

.field private queryButton:Landroid/view/View;

.field private queryTextView:Landroid/widget/EditText;

.field private resultListView:Landroid/widget/ListView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    const-class v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->TAG:Ljava/lang/String;

    .line 57
    const-string v0, "\\<.*?\\>"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->TAG_PATTERN:Ljava/util/regex/Pattern;

    .line 58
    const-string v0, "&lt;"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->LT_ENTITY_PATTERN:Ljava/util/regex/Pattern;

    .line 59
    const-string v0, "&gt;"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->GT_ENTITY_PATTERN:Ljava/util/regex/Pattern;

    .line 60
    const-string v0, "&#39;"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->QUOTE_ENTITY_PATTERN:Ljava/util/regex/Pattern;

    .line 61
    const-string v0, "&quot;"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->QUOT_ENTITY_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 70
    new-instance v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$1;

    invoke-direct {v0, p0}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$1;-><init>(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->buttonListener:Landroid/view/View$OnClickListener;

    .line 77
    new-instance v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$2;

    invoke-direct {v0, p0}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$2;-><init>(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->keyListener:Landroid/view/View$OnKeyListener;

    return-void
.end method

.method static synthetic access$000(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->launchSearch()V

    return-void
.end method

.method static synthetic access$1000()Ljava/util/regex/Pattern;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->QUOTE_ENTITY_PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method static synthetic access$1100()Ljava/util/regex/Pattern;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->QUOT_ENTITY_PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->headerView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryTextView:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$500(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$600(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->resultListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$700()Ljava/util/regex/Pattern;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->TAG_PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method static synthetic access$800()Ljava/util/regex/Pattern;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->LT_ENTITY_PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method static synthetic access$900()Ljava/util/regex/Pattern;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->GT_ENTITY_PATTERN:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method private launchSearch()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 150
    iget-object v2, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryTextView:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 151
    .local v1, "query":Ljava/lang/String;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 152
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->networkTask:Landroid/os/AsyncTask;

    .line 153
    .local v0, "oldTask":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<***>;"
    if-eqz v0, :cond_0

    .line 154
    invoke-virtual {v0, v7}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 156
    :cond_0
    new-instance v2, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;

    invoke-direct {v2, p0, v8}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;-><init>(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;Lcom/google/zxing/client/android/book/SearchBookContentsActivity$1;)V

    iput-object v2, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->networkTask:Landroid/os/AsyncTask;

    .line 157
    iget-object v2, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->networkTask:Landroid/os/AsyncTask;

    sget-object v3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    aput-object v1, v4, v6

    iget-object v5, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->isbn:Ljava/lang/String;

    aput-object v5, v4, v7

    invoke-virtual {v2, v3, v4}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 158
    iget-object v2, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->headerView:Landroid/widget/TextView;

    sget v3, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_sbc_searching_book:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 159
    iget-object v2, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->resultListView:Landroid/widget/ListView;

    invoke-virtual {v2, v8}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 160
    iget-object v2, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryTextView:Landroid/widget/EditText;

    invoke-virtual {v2, v6}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 161
    iget-object v2, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryButton:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 163
    .end local v0    # "oldTask":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<***>;"
    :cond_1
    return-void
.end method


# virtual methods
.method getISBN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->isbn:Ljava/lang/String;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 94
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 97
    invoke-static {p0}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 98
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/webkit/CookieManager;->removeExpiredCookie()V

    .line 100
    invoke-virtual {p0}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 101
    .local v2, "intent":Landroid/content/Intent;
    if-eqz v2, :cond_0

    const-string v3, "com.google.zxing.client.android.SEARCH_BOOK_CONTENTS"

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 102
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->finish()V

    .line 131
    :goto_0
    return-void

    .line 106
    :cond_1
    const-string v3, "ISBN"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->isbn:Ljava/lang/String;

    .line 107
    iget-object v3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->isbn:Ljava/lang/String;

    invoke-static {v3}, Lcom/google/zxing/client/android/LocaleManager;->isBookSearchUrl(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 108
    sget v3, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->sbc_name:I

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 113
    :goto_1
    sget v3, Lbarcodescanner/xservices/nl/barcodescanner/R$layout;->search_book_contents:I

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->setContentView(I)V

    .line 114
    sget v3, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->query_text_view:I

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryTextView:Landroid/widget/EditText;

    .line 116
    const-string v3, "QUERY"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 117
    .local v1, "initialQuery":Ljava/lang/String;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 119
    iget-object v3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryTextView:Landroid/widget/EditText;

    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 121
    :cond_2
    iget-object v3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryTextView:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->keyListener:Landroid/view/View$OnKeyListener;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 123
    sget v3, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->query_button:I

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryButton:Landroid/view/View;

    .line 124
    iget-object v3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryButton:Landroid/view/View;

    iget-object v4, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->buttonListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    sget v3, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->result_list_view:I

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    iput-object v3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->resultListView:Landroid/widget/ListView;

    .line 127
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 128
    .local v0, "factory":Landroid/view/LayoutInflater;
    sget v3, Lbarcodescanner/xservices/nl/barcodescanner/R$layout;->search_book_contents_header:I

    iget-object v4, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->resultListView:Landroid/widget/ListView;

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->headerView:Landroid/widget/TextView;

    .line 130
    iget-object v3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->resultListView:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->headerView:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    goto :goto_0

    .line 110
    .end local v0    # "factory":Landroid/view/LayoutInflater;
    .end local v1    # "initialQuery":Ljava/lang/String;
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->sbc_name:I

    invoke-virtual {p0, v4}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": ISBN "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->isbn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 141
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->networkTask:Landroid/os/AsyncTask;

    .line 142
    .local v0, "oldTask":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<***>;"
    if-eqz v0, :cond_0

    .line 143
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 144
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->networkTask:Landroid/os/AsyncTask;

    .line 146
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 147
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 135
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 136
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->queryTextView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    .line 137
    return-void
.end method

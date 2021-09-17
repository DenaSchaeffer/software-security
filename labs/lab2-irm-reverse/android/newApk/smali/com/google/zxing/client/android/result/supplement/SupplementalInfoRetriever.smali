.class public abstract Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
.super Landroid/os/AsyncTask;
.source "SupplementalInfoRetriever.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SupplementalInfo"


# instance fields
.field private final historyManagerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/google/zxing/client/android/history/HistoryManager;",
            ">;"
        }
    .end annotation
.end field

.field private final newContents:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Landroid/text/Spannable;",
            ">;"
        }
    .end annotation
.end field

.field private final newHistories:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final textViewRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/widget/TextView;Lcom/google/zxing/client/android/history/HistoryManager;)V
    .locals 1
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "historyManager"    # Lcom/google/zxing/client/android/history/HistoryManager;

    .prologue
    .line 86
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 87
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->textViewRef:Ljava/lang/ref/WeakReference;

    .line 88
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->historyManagerRef:Ljava/lang/ref/WeakReference;

    .line 89
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->newContents:Ljava/util/Collection;

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->newHistories:Ljava/util/Collection;

    .line 91
    return-void
.end method

.method static maybeAddText(Ljava/lang/String;Ljava/util/Collection;)V
    .locals 1
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 164
    .local p1, "texts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 165
    invoke-interface {p1, p0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 167
    :cond_0
    return-void
.end method

.method static maybeAddTextSeries(Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 170
    .local p0, "textSeries":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local p1, "texts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz p0, :cond_2

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 171
    const/4 v2, 0x1

    .line 172
    .local v2, "first":Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .local v1, "authorsText":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 174
    .local v0, "author":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 175
    const/4 v2, 0x0

    .line 179
    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 177
    :cond_0
    const-string v4, ", "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 181
    .end local v0    # "author":Ljava/lang/String;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 183
    .end local v1    # "authorsText":Ljava/lang/StringBuilder;
    .end local v2    # "first":Z
    :cond_2
    return-void
.end method

.method public static maybeInvokeRetrieval(Landroid/widget/TextView;Lcom/google/zxing/client/result/ParsedResult;Lcom/google/zxing/client/android/history/HistoryManager;Landroid/content/Context;)V
    .locals 11
    .param p0, "textView"    # Landroid/widget/TextView;
    .param p1, "result"    # Lcom/google/zxing/client/result/ParsedResult;
    .param p2, "historyManager"    # Lcom/google/zxing/client/android/history/HistoryManager;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    :try_start_0
    instance-of v9, p1, Lcom/google/zxing/client/result/URIParsedResult;

    if-eqz v9, :cond_1

    .line 55
    new-instance v8, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;

    move-object v0, p1

    check-cast v0, Lcom/google/zxing/client/result/URIParsedResult;

    move-object v9, v0

    invoke-direct {v8, p0, v9, p2, p3}, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;-><init>(Landroid/widget/TextView;Lcom/google/zxing/client/result/URIParsedResult;Lcom/google/zxing/client/android/history/HistoryManager;Landroid/content/Context;)V

    .line 57
    .local v8, "uriRetriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    sget-object v9, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v8, v9, v10}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 58
    new-instance v7, Lcom/google/zxing/client/android/result/supplement/TitleRetriever;

    check-cast p1, Lcom/google/zxing/client/result/URIParsedResult;

    .end local p1    # "result":Lcom/google/zxing/client/result/ParsedResult;
    invoke-direct {v7, p0, p1, p2}, Lcom/google/zxing/client/android/result/supplement/TitleRetriever;-><init>(Landroid/widget/TextView;Lcom/google/zxing/client/result/URIParsedResult;Lcom/google/zxing/client/android/history/HistoryManager;)V

    .line 60
    .local v7, "titleRetriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    sget-object v9, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v7, v9, v10}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 79
    .end local v7    # "titleRetriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    .end local v8    # "uriRetriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    :cond_0
    :goto_0
    return-void

    .line 61
    .restart local p1    # "result":Lcom/google/zxing/client/result/ParsedResult;
    :cond_1
    instance-of v9, p1, Lcom/google/zxing/client/result/ProductParsedResult;

    if-eqz v9, :cond_2

    .line 62
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/client/result/ProductParsedResult;

    move-object v5, v0

    .line 63
    .local v5, "productParsedResult":Lcom/google/zxing/client/result/ProductParsedResult;
    invoke-virtual {v5}, Lcom/google/zxing/client/result/ProductParsedResult;->getProductID()Ljava/lang/String;

    move-result-object v3

    .line 64
    .local v3, "productID":Ljava/lang/String;
    new-instance v6, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;

    invoke-direct {v6, p0, v3, p2, p3}, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;-><init>(Landroid/widget/TextView;Ljava/lang/String;Lcom/google/zxing/client/android/history/HistoryManager;Landroid/content/Context;)V

    .line 66
    .local v6, "productRetriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    sget-object v9, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v6, v9, v10}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 76
    .end local v3    # "productID":Ljava/lang/String;
    .end local v5    # "productParsedResult":Lcom/google/zxing/client/result/ProductParsedResult;
    .end local v6    # "productRetriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    .end local p1    # "result":Lcom/google/zxing/client/result/ParsedResult;
    :catch_0
    move-exception v9

    goto :goto_0

    .line 67
    .restart local p1    # "result":Lcom/google/zxing/client/result/ParsedResult;
    :cond_2
    instance-of v9, p1, Lcom/google/zxing/client/result/ISBNParsedResult;

    if-eqz v9, :cond_0

    .line 68
    check-cast p1, Lcom/google/zxing/client/result/ISBNParsedResult;

    .end local p1    # "result":Lcom/google/zxing/client/result/ParsedResult;
    invoke-virtual {p1}, Lcom/google/zxing/client/result/ISBNParsedResult;->getISBN()Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "isbn":Ljava/lang/String;
    new-instance v4, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;

    invoke-direct {v4, p0, v2, p2, p3}, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;-><init>(Landroid/widget/TextView;Ljava/lang/String;Lcom/google/zxing/client/android/history/HistoryManager;Landroid/content/Context;)V

    .line 71
    .local v4, "productInfoRetriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    sget-object v9, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v4, v9, v10}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 72
    new-instance v1, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;

    invoke-direct {v1, p0, v2, p2, p3}, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;-><init>(Landroid/widget/TextView;Ljava/lang/String;Lcom/google/zxing/client/android/history/HistoryManager;Landroid/content/Context;)V

    .line 74
    .local v1, "bookInfoRetriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    sget-object v9, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v1, v9, v10}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method


# virtual methods
.method final append(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "itemID"    # Ljava/lang/String;
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "newTexts"    # [Ljava/lang/String;
    .param p4, "linkURL"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 124
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .local v5, "newTextCombined":Ljava/lang/StringBuilder;
    if-eqz p2, :cond_0

    .line 127
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v8, 0x20

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 130
    :cond_0
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    .line 132
    .local v3, "linkStart":I
    const/4 v1, 0x1

    .line 133
    .local v1, "first":Z
    array-length v8, p3

    move v6, v7

    :goto_0
    if-ge v6, v8, :cond_2

    aget-object v4, p3, v6

    .line 134
    .local v4, "newText":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 135
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    const/4 v1, 0x0

    .line 133
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 138
    :cond_1
    const-string v9, " ["

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    const/16 v9, 0x5d

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 144
    .end local v4    # "newText":Ljava/lang/String;
    :cond_2
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 146
    .local v2, "linkEnd":I
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 147
    .restart local v4    # "newText":Ljava/lang/String;
    new-instance v0, Landroid/text/SpannableString;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, "\n\n"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 148
    .local v0, "content":Landroid/text/Spannable;
    if-eqz p4, :cond_4

    .line 151
    const-string v6, "HTTP://"

    invoke-virtual {p4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 152
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "http"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v8, 0x4

    invoke-virtual {p4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    .line 156
    :cond_3
    :goto_2
    new-instance v6, Landroid/text/style/URLSpan;

    invoke-direct {v6, p4}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    const/16 v8, 0x21

    invoke-interface {v0, v6, v3, v2, v8}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 159
    :cond_4
    iget-object v6, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->newContents:Ljava/util/Collection;

    invoke-interface {v6, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 160
    iget-object v6, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->newHistories:Ljava/util/Collection;

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/String;

    aput-object p1, v8, v7

    const/4 v7, 0x1

    aput-object v4, v8, v7

    invoke-interface {v6, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 161
    return-void

    .line 153
    :cond_5
    const-string v6, "HTTPS://"

    invoke-virtual {p4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 154
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "https"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v8, 0x5

    invoke-virtual {p4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    goto :goto_2
.end method

.method public final varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 96
    :try_start_0
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->retrieveSupplementalInfo()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    const/4 v1, 0x0

    return-object v1

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "SupplementalInfo"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected final onPostExecute(Ljava/lang/Object;)V
    .locals 7
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    .line 105
    iget-object v4, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->textViewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 106
    .local v3, "textView":Landroid/widget/TextView;
    if-eqz v3, :cond_1

    .line 107
    iget-object v4, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->newContents:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 108
    .local v0, "content":Ljava/lang/CharSequence;
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 110
    .end local v0    # "content":Ljava/lang/CharSequence;
    :cond_0
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 112
    :cond_1
    iget-object v4, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->historyManagerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/client/android/history/HistoryManager;

    .line 113
    .local v1, "historyManager":Lcom/google/zxing/client/android/history/HistoryManager;
    if-eqz v1, :cond_2

    .line 114
    iget-object v4, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->newHistories:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    .line 115
    .local v2, "text":[Ljava/lang/String;
    const/4 v5, 0x0

    aget-object v5, v2, v5

    const/4 v6, 0x1

    aget-object v6, v2, v6

    invoke-virtual {v1, v5, v6}, Lcom/google/zxing/client/android/history/HistoryManager;->addHistoryItemDetails(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 118
    .end local v2    # "text":[Ljava/lang/String;
    :cond_2
    return-void
.end method

.method abstract retrieveSupplementalInfo()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

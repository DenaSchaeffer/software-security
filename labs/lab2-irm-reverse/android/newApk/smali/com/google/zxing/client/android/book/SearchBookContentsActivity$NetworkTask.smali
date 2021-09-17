.class final Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;
.super Landroid/os/AsyncTask;
.source "SearchBookContentsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/client/android/book/SearchBookContentsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "NetworkTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;


# direct methods
.method private constructor <init>(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)V
    .locals 0

    .prologue
    .line 165
    iput-object p1, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;Lcom/google/zxing/client/android/book/SearchBookContentsActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/zxing/client/android/book/SearchBookContentsActivity;
    .param p2, "x1"    # Lcom/google/zxing/client/android/book/SearchBookContentsActivity$1;

    .prologue
    .line 165
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;-><init>(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)V

    return-void
.end method

.method private handleSearchResults(Lorg/json/JSONObject;)V
    .locals 11
    .param p1, "json"    # Lorg/json/JSONObject;

    .prologue
    const/4 v10, 0x0

    .line 210
    :try_start_0
    const-string v6, "number_of_results"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 211
    .local v0, "count":I
    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v6}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$300(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/TextView;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    sget v9, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_sbc_results:I

    invoke-virtual {v8, v9}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    if-lez v0, :cond_1

    .line 213
    const-string v6, "search_results"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 214
    .local v3, "results":Lorg/json/JSONArray;
    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v6}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$400(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/EditText;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/zxing/client/android/book/SearchBookContentsResult;->setQuery(Ljava/lang/String;)V

    .line 215
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 216
    .local v2, "items":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/client/android/book/SearchBookContentsResult;>;"
    const/4 v5, 0x0

    .local v5, "x":I
    :goto_0
    if-ge v5, v0, :cond_0

    .line 217
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->parseResult(Lorg/json/JSONObject;)Lcom/google/zxing/client/android/book/SearchBookContentsResult;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 219
    :cond_0
    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v6}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$600(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/ListView;

    move-result-object v6

    new-instance v7, Lcom/google/zxing/client/android/book/BrowseBookListener;

    iget-object v8, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-direct {v7, v8, v2}, Lcom/google/zxing/client/android/book/BrowseBookListener;-><init>(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;Ljava/util/List;)V

    invoke-virtual {v6, v7}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 220
    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v6}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$600(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/ListView;

    move-result-object v6

    new-instance v7, Lcom/google/zxing/client/android/book/SearchBookContentsAdapter;

    iget-object v8, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-direct {v7, v8, v2}, Lcom/google/zxing/client/android/book/SearchBookContentsAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-virtual {v6, v7}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 233
    .end local v0    # "count":I
    .end local v2    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/client/android/book/SearchBookContentsResult;>;"
    .end local v3    # "results":Lorg/json/JSONArray;
    .end local v5    # "x":I
    :goto_1
    return-void

    .line 222
    .restart local v0    # "count":I
    :cond_1
    const-string v6, "searchable"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 223
    .local v4, "searchable":Ljava/lang/String;
    const-string v6, "false"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 224
    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v6}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$300(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/TextView;

    move-result-object v6

    sget v7, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_sbc_book_not_searchable:I

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    .line 226
    :cond_2
    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v6}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$600(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/ListView;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 228
    .end local v0    # "count":I
    .end local v4    # "searchable":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 229
    .local v1, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$200()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Bad JSON from book search"

    invoke-static {v6, v7, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 230
    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v6}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$600(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/ListView;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 231
    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v6}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$300(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/TextView;

    move-result-object v6

    sget v7, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_sbc_failed:I

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1
.end method

.method private parseResult(Lorg/json/JSONObject;)Lcom/google/zxing/client/android/book/SearchBookContentsResult;
    .locals 9
    .param p1, "json"    # Lorg/json/JSONObject;

    .prologue
    const/4 v4, 0x0

    .line 242
    :try_start_0
    const-string v5, "page_id"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 243
    .local v1, "pageId":Ljava/lang/String;
    const-string v5, "page_number"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 244
    .local v2, "pageNumber":Ljava/lang/String;
    const-string v5, "snippet_text"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 251
    .local v3, "snippet":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 253
    :cond_0
    const-string v2, ""

    .line 258
    :goto_0
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v4, 0x1

    .line 259
    .local v4, "valid":Z
    :cond_1
    if-eqz v4, :cond_3

    .line 261
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$700()Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 262
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$800()Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    const-string v6, "<"

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 263
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$900()Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    const-string v6, ">"

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 264
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$1000()Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 265
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$1100()Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 270
    :goto_1
    new-instance v5, Lcom/google/zxing/client/android/book/SearchBookContentsResult;

    invoke-direct {v5, v1, v2, v3, v4}, Lcom/google/zxing/client/android/book/SearchBookContentsResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .end local v1    # "pageId":Ljava/lang/String;
    .end local v2    # "pageNumber":Ljava/lang/String;
    .end local v3    # "snippet":Ljava/lang/String;
    .end local v4    # "valid":Z
    :goto_2
    return-object v5

    .line 245
    :catch_0
    move-exception v0

    .line 246
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$200()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 248
    new-instance v5, Lcom/google/zxing/client/android/book/SearchBookContentsResult;

    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    sget v7, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_sbc_no_page_returned:I

    invoke-virtual {v6, v7}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    const-string v8, ""

    invoke-direct {v5, v6, v7, v8, v4}, Lcom/google/zxing/client/android/book/SearchBookContentsResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_2

    .line 255
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "pageId":Ljava/lang/String;
    .restart local v2    # "pageNumber":Ljava/lang/String;
    .restart local v3    # "snippet":Ljava/lang/String;
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    sget v7, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_sbc_page:I

    invoke-virtual {v6, v7}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x20

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 267
    .restart local v4    # "valid":Z
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v6, 0x28

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    sget v7, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_sbc_snippet_unavailable:I

    invoke-virtual {v6, v7}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x29

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 165
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->doInBackground([Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 11
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 173
    const/4 v8, 0x0

    :try_start_0
    aget-object v5, p1, v8

    .line 174
    .local v5, "theQuery":Ljava/lang/String;
    const/4 v8, 0x1

    aget-object v4, p1, v8

    .line 176
    .local v4, "theIsbn":Ljava/lang/String;
    invoke-static {v4}, Lcom/google/zxing/client/android/LocaleManager;->isBookSearchUrl(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 177
    const/16 v8, 0x3d

    invoke-virtual {v4, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 178
    .local v1, "equals":I
    add-int/lit8 v8, v1, 0x1

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 179
    .local v7, "volumeId":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "http://www.google.com/books?id="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, "&jscmd=SearchWithinVolume2&q="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 183
    .end local v1    # "equals":I
    .end local v7    # "volumeId":Ljava/lang/String;
    .local v6, "uri":Ljava/lang/String;
    :goto_0
    sget-object v8, Lcom/google/zxing/client/android/HttpHelper$ContentType;->JSON:Lcom/google/zxing/client/android/HttpHelper$ContentType;

    invoke-static {v6, v8}, Lcom/google/zxing/client/android/HttpHelper;->downloadViaHttp(Ljava/lang/String;Lcom/google/zxing/client/android/HttpHelper$ContentType;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 184
    .local v0, "content":Ljava/lang/CharSequence;
    new-instance v8, Lorg/json/JSONObject;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 190
    .end local v0    # "content":Ljava/lang/CharSequence;
    .end local v4    # "theIsbn":Ljava/lang/String;
    .end local v5    # "theQuery":Ljava/lang/String;
    .end local v6    # "uri":Ljava/lang/String;
    :goto_1
    return-object v8

    .line 181
    .restart local v4    # "theIsbn":Ljava/lang/String;
    .restart local v5    # "theQuery":Ljava/lang/String;
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "http://www.google.com/books?vid=isbn"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, "&jscmd=SearchWithinVolume2&q="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v6

    .restart local v6    # "uri":Ljava/lang/String;
    goto :goto_0

    .line 185
    .end local v4    # "theIsbn":Ljava/lang/String;
    .end local v5    # "theQuery":Ljava/lang/String;
    .end local v6    # "uri":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 186
    .local v2, "ioe":Ljava/io/IOException;
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$200()Ljava/lang/String;

    move-result-object v8

    const-string v10, "Error accessing book search"

    invoke-static {v8, v10, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v8, v9

    .line 187
    goto :goto_1

    .line 188
    .end local v2    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v3

    .line 189
    .local v3, "je":Lorg/json/JSONException;
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$200()Ljava/lang/String;

    move-result-object v8

    const-string v10, "Error accessing book search"

    invoke-static {v8, v10, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v8, v9

    .line 190
    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 165
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->onPostExecute(Lorg/json/JSONObject;)V

    return-void
.end method

.method protected onPostExecute(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "result"    # Lorg/json/JSONObject;

    .prologue
    const/4 v2, 0x1

    .line 196
    if-nez p1, :cond_0

    .line 197
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v0}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$300(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/TextView;

    move-result-object v0

    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_sbc_failed:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 201
    :goto_0
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v0}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$400(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 202
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v0}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$400(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    .line 203
    iget-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->this$0:Lcom/google/zxing/client/android/book/SearchBookContentsActivity;

    invoke-static {v0}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$500(Lcom/google/zxing/client/android/book/SearchBookContentsActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 204
    return-void

    .line 199
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkTask;->handleSearchResults(Lorg/json/JSONObject;)V

    goto :goto_0
.end method

.class public final Lcom/google/zxing/client/android/history/HistoryActivity;
.super Landroid/app/ListActivity;
.source "HistoryActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private adapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Lcom/google/zxing/client/android/history/HistoryItem;",
            ">;"
        }
    .end annotation
.end field

.field private historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

.field private originalTitle:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const-class v0, Lcom/google/zxing/client/android/history/HistoryActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/history/HistoryActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/google/zxing/client/android/history/HistoryActivity;)Lcom/google/zxing/client/android/history/HistoryManager;
    .locals 1
    .param p0, "x0"    # Lcom/google/zxing/client/android/history/HistoryActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    return-object v0
.end method

.method private reloadHistoryItems()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 71
    iget-object v2, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v2}, Lcom/google/zxing/client/android/history/HistoryManager;->buildHistoryItems()Ljava/util/List;

    move-result-object v1

    .line 72
    .local v1, "items":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/client/android/history/HistoryItem;>;"
    iget-object v2, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2}, Landroid/widget/ArrayAdapter;->clear()V

    .line 73
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/client/android/history/HistoryItem;

    .line 74
    .local v0, "item":Lcom/google/zxing/client/android/history/HistoryItem;
    iget-object v3, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v3, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 76
    .end local v0    # "item":Lcom/google/zxing/client/android/history/HistoryItem;
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->originalTitle:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v3}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x29

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/zxing/client/android/history/HistoryActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v2, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2}, Landroid/widget/ArrayAdapter;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 78
    iget-object v2, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->adapter:Landroid/widget/ArrayAdapter;

    new-instance v3, Lcom/google/zxing/client/android/history/HistoryItem;

    invoke-direct {v3, v4, v4, v4}, Lcom/google/zxing/client/android/history/HistoryItem;-><init>(Lcom/google/zxing/Result;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 80
    :cond_1
    return-void
.end method


# virtual methods
.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 104
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 105
    .local v0, "position":I
    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v1, v0}, Lcom/google/zxing/client/android/history/HistoryManager;->deleteHistoryItem(I)V

    .line 106
    invoke-direct {p0}, Lcom/google/zxing/client/android/history/HistoryActivity;->reloadHistoryItems()V

    .line 107
    const/4 v1, 0x1

    return v1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 55
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    new-instance v1, Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-direct {v1, p0}, Lcom/google/zxing/client/android/history/HistoryManager;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    .line 57
    new-instance v1, Lcom/google/zxing/client/android/history/HistoryItemAdapter;

    invoke-direct {v1, p0}, Lcom/google/zxing/client/android/history/HistoryItemAdapter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->adapter:Landroid/widget/ArrayAdapter;

    .line 58
    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {p0, v1}, Lcom/google/zxing/client/android/history/HistoryActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 59
    invoke-virtual {p0}, Lcom/google/zxing/client/android/history/HistoryActivity;->getListView()Landroid/widget/ListView;

    move-result-object v0

    .line 60
    .local v0, "listview":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/history/HistoryActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 61
    invoke-virtual {p0}, Lcom/google/zxing/client/android/history/HistoryActivity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->originalTitle:Ljava/lang/CharSequence;

    .line 62
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    .line 96
    check-cast p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .end local p3    # "menuInfo":Landroid/view/ContextMenu$ContextMenuInfo;
    iget v0, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    .line 97
    .local v0, "position":I
    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v1}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v1, v0}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/client/android/history/HistoryItem;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/history/HistoryItem;->getResult()Lcom/google/zxing/Result;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 98
    :cond_0
    const/4 v1, 0x0

    sget v2, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->history_clear_one_history_text:I

    invoke-interface {p1, v1, v0, v0, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 100
    :cond_1
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 112
    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/history/HistoryManager;->hasHistoryItems()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 113
    invoke-virtual {p0}, Lcom/google/zxing/client/android/history/HistoryActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 114
    .local v0, "menuInflater":Landroid/view/MenuInflater;
    sget v1, Lbarcodescanner/xservices/nl/barcodescanner/R$menu;->history:I

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 116
    .end local v0    # "menuInflater":Landroid/view/MenuInflater;
    :cond_0
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v1

    return v1
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 2
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 84
    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v1, p3}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/client/android/history/HistoryItem;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/history/HistoryItem;->getResult()Lcom/google/zxing/Result;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 85
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 86
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "ITEM_NUMBER"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 87
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/google/zxing/client/android/history/HistoryActivity;->setResult(ILandroid/content/Intent;)V

    .line 88
    invoke-virtual {p0}, Lcom/google/zxing/client/android/history/HistoryActivity;->finish()V

    .line 90
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 11
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v10, 0x0

    const/4 v7, 0x1

    .line 121
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    .line 122
    .local v4, "i":I
    sget v8, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->menu_history_send:I

    if-ne v4, v8, :cond_1

    .line 123
    iget-object v8, p0, Lcom/google/zxing/client/android/history/HistoryActivity;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v8}, Lcom/google/zxing/client/android/history/HistoryManager;->buildHistory()Ljava/lang/CharSequence;

    move-result-object v2

    .line 124
    .local v2, "history":Ljava/lang/CharSequence;
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/google/zxing/client/android/history/HistoryManager;->saveHistory(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 125
    .local v3, "historyFile":Landroid/os/Parcelable;
    if-nez v3, :cond_0

    .line 126
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 127
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    sget v8, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_unmount_usb:I

    invoke-virtual {v1, v8}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 128
    sget v8, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_ok:I

    invoke-virtual {v1, v8, v10}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 129
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 163
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v2    # "history":Ljava/lang/CharSequence;
    .end local v3    # "historyFile":Landroid/os/Parcelable;
    :goto_0
    return v7

    .line 131
    .restart local v2    # "history":Ljava/lang/CharSequence;
    .restart local v3    # "historyFile":Landroid/os/Parcelable;
    :cond_0
    new-instance v5, Landroid/content/Intent;

    const-string v8, "android.intent.action.SEND"

    const-string v9, "mailto:"

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-direct {v5, v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 132
    .local v5, "intent":Landroid/content/Intent;
    const/high16 v8, 0x80000

    invoke-virtual {v5, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 133
    invoke-virtual {p0}, Lcom/google/zxing/client/android/history/HistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v9, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->history_email_title:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 134
    .local v6, "subject":Ljava/lang/String;
    const-string v8, "android.intent.extra.SUBJECT"

    invoke-virtual {v5, v8, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    const-string v8, "android.intent.extra.TEXT"

    invoke-virtual {v5, v8, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 136
    const-string v8, "android.intent.extra.STREAM"

    invoke-virtual {v5, v8, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 137
    const-string v8, "text/csv"

    invoke-virtual {v5, v8}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    :try_start_0
    invoke-virtual {p0, v5}, Lcom/google/zxing/client/android/history/HistoryActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 140
    :catch_0
    move-exception v0

    .line 141
    .local v0, "anfe":Landroid/content/ActivityNotFoundException;
    sget-object v8, Lcom/google/zxing/client/android/history/HistoryActivity;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 145
    .end local v0    # "anfe":Landroid/content/ActivityNotFoundException;
    .end local v2    # "history":Ljava/lang/CharSequence;
    .end local v3    # "historyFile":Landroid/os/Parcelable;
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v6    # "subject":Ljava/lang/String;
    :cond_1
    sget v8, Lbarcodescanner/xservices/nl/barcodescanner/R$id;->menu_history_clear_text:I

    if-ne v4, v8, :cond_2

    .line 146
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 147
    .restart local v1    # "builder":Landroid/app/AlertDialog$Builder;
    sget v8, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->msg_sure:I

    invoke-virtual {v1, v8}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 148
    invoke-virtual {v1, v7}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 149
    sget v8, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_ok:I

    new-instance v9, Lcom/google/zxing/client/android/history/HistoryActivity$1;

    invoke-direct {v9, p0}, Lcom/google/zxing/client/android/history/HistoryActivity$1;-><init>(Lcom/google/zxing/client/android/history/HistoryActivity;)V

    invoke-virtual {v1, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 157
    sget v8, Lbarcodescanner/xservices/nl/barcodescanner/R$string;->button_cancel:I

    invoke-virtual {v1, v8, v10}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 158
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 161
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    :cond_2
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v7

    goto :goto_0
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 66
    invoke-super {p0}, Landroid/app/ListActivity;->onResume()V

    .line 67
    invoke-direct {p0}, Lcom/google/zxing/client/android/history/HistoryActivity;->reloadHistoryItems()V

    .line 68
    return-void
.end method

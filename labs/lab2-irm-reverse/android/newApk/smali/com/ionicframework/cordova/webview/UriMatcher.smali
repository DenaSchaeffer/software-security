.class public Lcom/ionicframework/cordova/webview/UriMatcher;
.super Ljava/lang/Object;
.source "UriMatcher.java"


# static fields
.field private static final EXACT:I = 0x0

.field static final PATH_SPLIT_PATTERN:Ljava/util/regex/Pattern;

.field private static final REST:I = 0x2

.field private static final TEXT:I = 0x1


# instance fields
.field private mChildren:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/ionicframework/cordova/webview/UriMatcher;",
            ">;"
        }
    .end annotation
.end field

.field private mCode:Ljava/lang/Object;

.field private mText:Ljava/lang/String;

.field private mWhich:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 115
    const-string v0, "/"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/ionicframework/cordova/webview/UriMatcher;->PATH_SPLIT_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object v1, p0, Lcom/ionicframework/cordova/webview/UriMatcher;->mCode:Ljava/lang/Object;

    .line 41
    const/4 v0, -0x1

    iput v0, p0, Lcom/ionicframework/cordova/webview/UriMatcher;->mWhich:I

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ionicframework/cordova/webview/UriMatcher;->mChildren:Ljava/util/ArrayList;

    .line 43
    iput-object v1, p0, Lcom/ionicframework/cordova/webview/UriMatcher;->mText:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .param p1, "code"    # Ljava/lang/Object;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/ionicframework/cordova/webview/UriMatcher;->mCode:Ljava/lang/Object;

    .line 34
    const/4 v0, -0x1

    iput v0, p0, Lcom/ionicframework/cordova/webview/UriMatcher;->mWhich:I

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ionicframework/cordova/webview/UriMatcher;->mChildren:Ljava/util/ArrayList;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ionicframework/cordova/webview/UriMatcher;->mText:Ljava/lang/String;

    .line 37
    return-void
.end method


# virtual methods
.method public addURI(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 13
    .param p1, "scheme"    # Ljava/lang/String;
    .param p2, "authority"    # Ljava/lang/String;
    .param p3, "path"    # Ljava/lang/String;
    .param p4, "code"    # Ljava/lang/Object;

    .prologue
    .line 62
    if-nez p4, :cond_0

    .line 63
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "Code can\'t be null"

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 66
    :cond_0
    const/4 v10, 0x0

    .line 67
    .local v10, "tokens":[Ljava/lang/String;
    if-eqz p3, :cond_2

    .line 68
    move-object/from16 v5, p3

    .line 70
    .local v5, "newPath":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_1

    const/4 v11, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x2f

    if-ne v11, v12, :cond_1

    .line 71
    const/4 v11, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 73
    :cond_1
    sget-object v11, Lcom/ionicframework/cordova/webview/UriMatcher;->PATH_SPLIT_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v11, v5}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v10

    .line 76
    .end local v5    # "newPath":Ljava/lang/String;
    :cond_2
    if-eqz v10, :cond_5

    array-length v8, v10

    .line 77
    .local v8, "numTokens":I
    :goto_0
    move-object v6, p0

    .line 78
    .local v6, "node":Lcom/ionicframework/cordova/webview/UriMatcher;
    const/4 v3, -0x2

    .local v3, "i":I
    :goto_1
    if-ge v3, v8, :cond_b

    .line 80
    const/4 v11, -0x2

    if-ne v3, v11, :cond_6

    .line 81
    move-object v9, p1

    .line 86
    .local v9, "token":Ljava/lang/String;
    :goto_2
    iget-object v2, v6, Lcom/ionicframework/cordova/webview/UriMatcher;->mChildren:Ljava/util/ArrayList;

    .line 87
    .local v2, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/ionicframework/cordova/webview/UriMatcher;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 90
    .local v7, "numChildren":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_3
    if-ge v4, v7, :cond_3

    .line 91
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ionicframework/cordova/webview/UriMatcher;

    .line 92
    .local v1, "child":Lcom/ionicframework/cordova/webview/UriMatcher;
    iget-object v11, v1, Lcom/ionicframework/cordova/webview/UriMatcher;->mText:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 93
    move-object v6, v1

    .line 97
    .end local v1    # "child":Lcom/ionicframework/cordova/webview/UriMatcher;
    :cond_3
    if-ne v4, v7, :cond_4

    .line 99
    new-instance v1, Lcom/ionicframework/cordova/webview/UriMatcher;

    invoke-direct {v1}, Lcom/ionicframework/cordova/webview/UriMatcher;-><init>()V

    .line 100
    .restart local v1    # "child":Lcom/ionicframework/cordova/webview/UriMatcher;
    const-string v11, "**"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    .line 101
    const/4 v11, 0x2

    iput v11, v1, Lcom/ionicframework/cordova/webview/UriMatcher;->mWhich:I

    .line 107
    :goto_4
    iput-object v9, v1, Lcom/ionicframework/cordova/webview/UriMatcher;->mText:Ljava/lang/String;

    .line 108
    iget-object v11, v6, Lcom/ionicframework/cordova/webview/UriMatcher;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    move-object v6, v1

    .line 78
    .end local v1    # "child":Lcom/ionicframework/cordova/webview/UriMatcher;
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 76
    .end local v2    # "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/ionicframework/cordova/webview/UriMatcher;>;"
    .end local v3    # "i":I
    .end local v4    # "j":I
    .end local v6    # "node":Lcom/ionicframework/cordova/webview/UriMatcher;
    .end local v7    # "numChildren":I
    .end local v8    # "numTokens":I
    .end local v9    # "token":Ljava/lang/String;
    :cond_5
    const/4 v8, 0x0

    goto :goto_0

    .line 82
    .restart local v3    # "i":I
    .restart local v6    # "node":Lcom/ionicframework/cordova/webview/UriMatcher;
    .restart local v8    # "numTokens":I
    :cond_6
    const/4 v11, -0x1

    if-ne v3, v11, :cond_7

    .line 83
    move-object v9, p2

    .restart local v9    # "token":Ljava/lang/String;
    goto :goto_2

    .line 85
    .end local v9    # "token":Ljava/lang/String;
    :cond_7
    aget-object v9, v10, v3

    .restart local v9    # "token":Ljava/lang/String;
    goto :goto_2

    .line 90
    .restart local v1    # "child":Lcom/ionicframework/cordova/webview/UriMatcher;
    .restart local v2    # "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/ionicframework/cordova/webview/UriMatcher;>;"
    .restart local v4    # "j":I
    .restart local v7    # "numChildren":I
    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 102
    :cond_9
    const-string v11, "*"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 103
    const/4 v11, 0x1

    iput v11, v1, Lcom/ionicframework/cordova/webview/UriMatcher;->mWhich:I

    goto :goto_4

    .line 105
    :cond_a
    const/4 v11, 0x0

    iput v11, v1, Lcom/ionicframework/cordova/webview/UriMatcher;->mWhich:I

    goto :goto_4

    .line 112
    .end local v1    # "child":Lcom/ionicframework/cordova/webview/UriMatcher;
    .end local v2    # "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/ionicframework/cordova/webview/UriMatcher;>;"
    .end local v4    # "j":I
    .end local v7    # "numChildren":I
    .end local v9    # "token":Ljava/lang/String;
    :cond_b
    move-object/from16 v0, p4

    iput-object v0, v6, Lcom/ionicframework/cordova/webview/UriMatcher;->mCode:Ljava/lang/Object;

    .line 113
    return-void
.end method

.method public match(Landroid/net/Uri;)Ljava/lang/Object;
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 125
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    .line 126
    .local v7, "pathSegments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v2

    .line 128
    .local v2, "li":I
    move-object v6, p0

    .line 130
    .local v6, "node":Lcom/ionicframework/cordova/webview/UriMatcher;
    if-nez v2, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_0

    .line 131
    iget-object v9, p0, Lcom/ionicframework/cordova/webview/UriMatcher;->mCode:Ljava/lang/Object;

    .line 172
    :goto_0
    return-object v9

    .line 134
    :cond_0
    const/4 v0, -0x2

    .local v0, "i":I
    :goto_1
    if-ge v0, v2, :cond_1

    .line 136
    const/4 v9, -0x2

    if-ne v0, v9, :cond_2

    .line 137
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v8

    .line 142
    .local v8, "u":Ljava/lang/String;
    :goto_2
    iget-object v3, v6, Lcom/ionicframework/cordova/webview/UriMatcher;->mChildren:Ljava/util/ArrayList;

    .line 143
    .local v3, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/ionicframework/cordova/webview/UriMatcher;>;"
    if-nez v3, :cond_4

    .line 172
    .end local v3    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/ionicframework/cordova/webview/UriMatcher;>;"
    .end local v8    # "u":Ljava/lang/String;
    :cond_1
    iget-object v9, v6, Lcom/ionicframework/cordova/webview/UriMatcher;->mCode:Ljava/lang/Object;

    goto :goto_0

    .line 138
    :cond_2
    const/4 v9, -0x1

    if-ne v0, v9, :cond_3

    .line 139
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v8

    .restart local v8    # "u":Ljava/lang/String;
    goto :goto_2

    .line 141
    .end local v8    # "u":Ljava/lang/String;
    :cond_3
    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .restart local v8    # "u":Ljava/lang/String;
    goto :goto_2

    .line 146
    .restart local v3    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/ionicframework/cordova/webview/UriMatcher;>;"
    :cond_4
    const/4 v6, 0x0

    .line 147
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 148
    .local v4, "lj":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_3
    if-ge v1, v4, :cond_6

    .line 149
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/ionicframework/cordova/webview/UriMatcher;

    .line 151
    .local v5, "n":Lcom/ionicframework/cordova/webview/UriMatcher;
    iget v9, v5, Lcom/ionicframework/cordova/webview/UriMatcher;->mWhich:I

    packed-switch v9, :pswitch_data_0

    .line 163
    :cond_5
    :goto_4
    if-eqz v6, :cond_7

    .line 167
    .end local v5    # "n":Lcom/ionicframework/cordova/webview/UriMatcher;
    :cond_6
    if-nez v6, :cond_8

    .line 168
    const/4 v9, 0x0

    goto :goto_0

    .line 153
    .restart local v5    # "n":Lcom/ionicframework/cordova/webview/UriMatcher;
    :pswitch_0
    iget-object v9, v5, Lcom/ionicframework/cordova/webview/UriMatcher;->mText:Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 154
    move-object v6, v5

    goto :goto_4

    .line 158
    :pswitch_1
    move-object v6, v5

    .line 159
    goto :goto_4

    .line 161
    :pswitch_2
    iget-object v9, v5, Lcom/ionicframework/cordova/webview/UriMatcher;->mCode:Ljava/lang/Object;

    goto :goto_0

    .line 148
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 134
    .end local v5    # "n":Lcom/ionicframework/cordova/webview/UriMatcher;
    :cond_8
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 151
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

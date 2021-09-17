.class public final Lcom/google/zxing/datamatrix/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# instance fields
.field private final rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    sget-object v1, Lcom/google/zxing/common/reedsolomon/GenericGF;->DATA_MATRIX_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    iput-object v0, p0, Lcom/google/zxing/datamatrix/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    .line 39
    return-void
.end method

.method private correctErrors([BI)V
    .locals 6
    .param p1, "codewordBytes"    # [B
    .param p2, "numDataCodewords"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .prologue
    .line 116
    array-length v3, p1

    .line 118
    .local v3, "numCodewords":I
    new-array v0, v3, [I

    .line 119
    .local v0, "codewordsInts":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 120
    aget-byte v4, p1, v1

    and-int/lit16 v4, v4, 0xff

    aput v4, v0, v1

    .line 119
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 123
    :cond_0
    :try_start_0
    iget-object v4, p0, Lcom/google/zxing/datamatrix/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    array-length v5, p1

    sub-int/2addr v5, p2

    invoke-virtual {v4, v0, v5}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_0
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    const/4 v1, 0x0

    :goto_1
    if-ge v1, p2, :cond_1

    .line 130
    aget v4, v0, v1

    int-to-byte v4, v4

    aput-byte v4, p1, v1

    .line 129
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 124
    :catch_0
    move-exception v2

    .line 125
    .local v2, "ignored":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v4

    throw v4

    .line 132
    .end local v2    # "ignored":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    :cond_1
    return-void
.end method


# virtual methods
.method public decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
    .locals 17
    .param p1, "bits"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .prologue
    .line 75
    new-instance v10, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 76
    .local v10, "parser":Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;
    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->getVersion()Lcom/google/zxing/datamatrix/decoder/Version;

    move-result-object v13

    .line 79
    .local v13, "version":Lcom/google/zxing/datamatrix/decoder/Version;
    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCodewords()[B

    move-result-object v2

    .line 81
    .local v2, "codewords":[B
    invoke-static {v2, v13}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getDataBlocks([BLcom/google/zxing/datamatrix/decoder/Version;)[Lcom/google/zxing/datamatrix/decoder/DataBlock;

    move-result-object v4

    .line 84
    .local v4, "dataBlocks":[Lcom/google/zxing/datamatrix/decoder/DataBlock;
    const/4 v12, 0x0

    .line 85
    .local v12, "totalBytes":I
    array-length v15, v4

    const/4 v14, 0x0

    :goto_0
    if-ge v14, v15, :cond_0

    aget-object v6, v4, v14

    .line 86
    .local v6, "db":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    invoke-virtual {v6}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getNumDataCodewords()I

    move-result v16

    add-int v12, v12, v16

    .line 85
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 88
    .end local v6    # "db":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    :cond_0
    new-array v11, v12, [B

    .line 90
    .local v11, "resultBytes":[B
    array-length v5, v4

    .line 92
    .local v5, "dataBlocksCount":I
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_1
    if-ge v8, v5, :cond_2

    .line 93
    aget-object v3, v4, v8

    .line 94
    .local v3, "dataBlock":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    invoke-virtual {v3}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getCodewords()[B

    move-result-object v1

    .line 95
    .local v1, "codewordBytes":[B
    invoke-virtual {v3}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getNumDataCodewords()I

    move-result v9

    .line 96
    .local v9, "numDataCodewords":I
    move-object/from16 v0, p0

    invoke-direct {v0, v1, v9}, Lcom/google/zxing/datamatrix/decoder/Decoder;->correctErrors([BI)V

    .line 97
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v9, :cond_1

    .line 99
    mul-int v14, v7, v5

    add-int/2addr v14, v8

    aget-byte v15, v1, v7

    aput-byte v15, v11, v14

    .line 97
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 92
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 104
    .end local v1    # "codewordBytes":[B
    .end local v3    # "dataBlock":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    .end local v7    # "i":I
    .end local v9    # "numDataCodewords":I
    :cond_2
    invoke-static {v11}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decode([B)Lcom/google/zxing/common/DecoderResult;

    move-result-object v14

    return-object v14
.end method

.method public decode([[Z)Lcom/google/zxing/common/DecoderResult;
    .locals 5
    .param p1, "image"    # [[Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .prologue
    .line 51
    array-length v1, p1

    .line 52
    .local v1, "dimension":I
    new-instance v0, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    .line 53
    .local v0, "bits":Lcom/google/zxing/common/BitMatrix;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 54
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    if-ge v3, v1, :cond_1

    .line 55
    aget-object v4, p1, v2

    aget-boolean v4, v4, v3

    if-eqz v4, :cond_0

    .line 56
    invoke-virtual {v0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 54
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 53
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 60
    .end local v3    # "j":I
    :cond_2
    invoke-virtual {p0, v0}, Lcom/google/zxing/datamatrix/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v4

    return-object v4
.end method

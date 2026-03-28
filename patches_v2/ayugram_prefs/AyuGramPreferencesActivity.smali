.class public Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;
.super Lorg/telegram/ui/ActionBar/cOm7;

# instance fields
.field private listView:Lorg/telegram/ui/Components/RecyclerListView;
.field private listAdapter:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;

.field private headerRow:I
.field private ghostModeRow:I
.field private spyRow:I
.field private customizationRow:I
.field private headerShadowRow:I
.field private linksHeaderRow:I
.field private channelRow:I
.field private linksShadowRow:I
.field private rowCount:I

# direct methods
.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Lorg/telegram/ui/ActionBar/cOm7;-><init>()V
    return-void
.end method

.method public onFragmentCreate()Z
    .locals 2

    invoke-super {p0}, Lorg/telegram/ui/ActionBar/cOm7;->onFragmentCreate()Z

    const/4 v0, 0x0
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->headerRow:I

    const/4 v0, 0x1
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->ghostModeRow:I

    const/4 v0, 0x2
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->spyRow:I

    const/4 v0, 0x3
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->customizationRow:I

    const/4 v0, 0x4
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->headerShadowRow:I

    const/4 v0, 0x5
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->linksHeaderRow:I

    const/4 v0, 0x6
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->channelRow:I

    const/4 v0, 0x7
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->linksShadowRow:I

    const/16 v0, 0x8
    iput v0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->rowCount:I

    const/4 v1, 0x1
    return v1
.end method

.method public createView(Landroid/content/Context;)Landroid/view/View;
    .locals 6

    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V

    # Setup ActionBar
    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    sget v1, Lorg/telegram/messenger/R$drawable;->ic_ab_back:I
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AUX;->setBackButtonImage(I)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AUX;->setAllowOverlayTitle(Z)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    const-string v2, "AyuGram"
    invoke-virtual {v0, v2}, Lorg/telegram/ui/ActionBar/AUX;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    new-instance v2, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$BackListener;
    invoke-direct {v2, p0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$BackListener;-><init>(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)V
    invoke-virtual {v0, v2}, Lorg/telegram/ui/ActionBar/AUX;->setActionBarMenuOnItemClick(Lorg/telegram/ui/ActionBar/AUX$con;)V

    # Create FrameLayout
    new-instance v0, Landroid/widget/FrameLayout;
    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;

    sget v2, Lorg/telegram/ui/ActionBar/q;->Z7:I
    invoke-static {v2}, Lorg/telegram/ui/ActionBar/q;->u2(I)I
    move-result v2
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    check-cast v0, Landroid/widget/FrameLayout;

    # Create RecyclerListView
    new-instance v2, Lorg/telegram/ui/Components/RecyclerListView;
    invoke-direct {v2, p1}, Lorg/telegram/ui/Components/RecyclerListView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->listView:Lorg/telegram/ui/Components/RecyclerListView;

    invoke-virtual {v2, v1}, Lorg/telegram/ui/Components/RecyclerListView;->setVerticalScrollBarEnabled(Z)V

    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;
    const/4 v4, 0x1
    invoke-direct {v3, p1, v4, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    # Create adapter
    new-instance v3, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;
    invoke-direct {v3, p0, p1}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;-><init>(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;Landroid/content/Context;)V
    iput-object v3, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->listAdapter:Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ListAdapter;

    invoke-virtual {v2, v3}, Lorg/telegram/ui/Components/RecyclerListView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    # Add to frame
    const/4 v3, -0x1
    const/16 v5, 0x33
    invoke-static {v3, v3, v5}, Lorg/telegram/ui/Components/rq;->e(III)Landroid/widget/FrameLayout$LayoutParams;
    move-result-object v3
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # Set click listener
    new-instance v3, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ClickListener;
    invoke-direct {v3, p0}, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity$ClickListener;-><init>(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)V
    invoke-virtual {v2, v3}, Lorg/telegram/ui/Components/RecyclerListView;->setOnItemClickListener(Lorg/telegram/ui/Components/RecyclerListView$OnItemClickListener;)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    return-object v0
.end method

# Accessor methods for inner classes
.method static synthetic access$getGhostModeRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->ghostModeRow:I
    return p0
.end method

.method static synthetic access$getSpyRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->spyRow:I
    return p0
.end method

.method static synthetic access$getCustomizationRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->customizationRow:I
    return p0
.end method

.method static synthetic access$getChannelRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->channelRow:I
    return p0
.end method

.method static synthetic access$getRowCount(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->rowCount:I
    return p0
.end method

.method static synthetic access$getHeaderRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->headerRow:I
    return p0
.end method

.method static synthetic access$getHeaderShadowRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->headerShadowRow:I
    return p0
.end method

.method static synthetic access$getLinksHeaderRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->linksHeaderRow:I
    return p0
.end method

.method static synthetic access$getLinksShadowRow(Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/AyuGramPreferencesActivity;->linksShadowRow:I
    return p0
.end method

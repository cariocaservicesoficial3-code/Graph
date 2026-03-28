.class public Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;
.super Lorg/telegram/ui/ActionBar/cOm7;

.field private listView:Lorg/telegram/ui/Components/RecyclerListView;
.field private listAdapter:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;

.field private headerRow:I
.field private ghostModeRow:I
.field private noReadRow:I
.field private noOnlineRow:I
.field private noTypingRow:I
.field private noUploadRow:I
.field private offlineAfterOnlineRow:I
.field private ghostShadowRow:I
.field private featuresHeaderRow:I
.field private markReadAfterSendRow:I
.field private ghostAlertStoriesRow:I
.field private featuresShadowRow:I
.field private rowCount:I

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Lorg/telegram/ui/ActionBar/cOm7;-><init>()V
    return-void
.end method

.method public onFragmentCreate()Z
    .locals 2

    invoke-super {p0}, Lorg/telegram/ui/ActionBar/cOm7;->onFragmentCreate()Z

    invoke-static {}, Lcom/radolyn/ayugram/AyuConfig;->ensureLoaded()V

    const/4 v0, 0x0
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->headerRow:I
    const/4 v0, 0x1
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostModeRow:I
    const/4 v0, 0x2
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noReadRow:I
    const/4 v0, 0x3
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noOnlineRow:I
    const/4 v0, 0x4
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noTypingRow:I
    const/4 v0, 0x5
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noUploadRow:I
    const/4 v0, 0x6
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->offlineAfterOnlineRow:I
    const/4 v0, 0x7
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostShadowRow:I
    const/16 v0, 0x8
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->featuresHeaderRow:I
    const/16 v0, 0x9
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->markReadAfterSendRow:I
    const/16 v0, 0xa
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostAlertStoriesRow:I
    const/16 v0, 0xb
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->featuresShadowRow:I
    const/16 v0, 0xc
    iput v0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->rowCount:I

    const/4 v1, 0x1
    return v1
.end method

.method public createView(Landroid/content/Context;)Landroid/view/View;
    .locals 6

    # ActionBar
    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    sget v1, Lorg/telegram/messenger/R$drawable;->ic_ab_back:I
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AUX;->setBackButtonImage(I)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Lorg/telegram/ui/ActionBar/AUX;->setAllowOverlayTitle(Z)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    const-string v2, "Modo Fantasma"
    invoke-virtual {v0, v2}, Lorg/telegram/ui/ActionBar/AUX;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->actionBar:Lorg/telegram/ui/ActionBar/AUX;
    new-instance v2, Lcom/radolyn/ayugram/preferences/GenericBackListener;
    invoke-direct {v2, p0}, Lcom/radolyn/ayugram/preferences/GenericBackListener;-><init>(Lorg/telegram/ui/ActionBar/cOm7;)V
    invoke-virtual {v0, v2}, Lorg/telegram/ui/ActionBar/AUX;->setActionBarMenuOnItemClick(Lorg/telegram/ui/ActionBar/AUX$con;)V

    # FrameLayout
    new-instance v0, Landroid/widget/FrameLayout;
    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    sget v2, Lorg/telegram/ui/ActionBar/q;->Z7:I
    invoke-static {v2}, Lorg/telegram/ui/ActionBar/q;->u2(I)I
    move-result v2
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    check-cast v0, Landroid/widget/FrameLayout;

    # RecyclerListView
    new-instance v2, Lorg/telegram/ui/Components/RecyclerListView;
    invoke-direct {v2, p1}, Lorg/telegram/ui/Components/RecyclerListView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->listView:Lorg/telegram/ui/Components/RecyclerListView;
    invoke-virtual {v2, v1}, Lorg/telegram/ui/Components/RecyclerListView;->setVerticalScrollBarEnabled(Z)V

    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;
    const/4 v4, 0x1
    invoke-direct {v3, p1, v4, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    new-instance v3, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
    invoke-direct {v3, p0, p1}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;-><init>(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;Landroid/content/Context;)V
    iput-object v3, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->listAdapter:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
    invoke-virtual {v2, v3}, Lorg/telegram/ui/Components/RecyclerListView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    const/4 v3, -0x1
    const/16 v5, 0x33
    invoke-static {v3, v3, v5}, Lorg/telegram/ui/Components/rq;->e(III)Landroid/widget/FrameLayout$LayoutParams;
    move-result-object v3
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ClickListener;
    invoke-direct {v3, p0}, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ClickListener;-><init>(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)V
    invoke-virtual {v2, v3}, Lorg/telegram/ui/Components/RecyclerListView;->setOnItemClickListener(Lorg/telegram/ui/Components/RecyclerListView$OnItemClickListener;)V

    iget-object v0, p0, Lorg/telegram/ui/ActionBar/cOm7;->fragmentView:Landroid/view/View;
    return-object v0
.end method

# Accessor methods
.method static synthetic access$getGhostModeRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostModeRow:I
    return p0
.end method

.method static synthetic access$getNoReadRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noReadRow:I
    return p0
.end method

.method static synthetic access$getNoOnlineRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noOnlineRow:I
    return p0
.end method

.method static synthetic access$getNoTypingRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noTypingRow:I
    return p0
.end method

.method static synthetic access$getNoUploadRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->noUploadRow:I
    return p0
.end method

.method static synthetic access$getOfflineAfterOnlineRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->offlineAfterOnlineRow:I
    return p0
.end method

.method static synthetic access$getMarkReadAfterSendRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->markReadAfterSendRow:I
    return p0
.end method

.method static synthetic access$getGhostAlertStoriesRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostAlertStoriesRow:I
    return p0
.end method

.method static synthetic access$getHeaderRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->headerRow:I
    return p0
.end method

.method static synthetic access$getGhostShadowRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->ghostShadowRow:I
    return p0
.end method

.method static synthetic access$getFeaturesHeaderRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->featuresHeaderRow:I
    return p0
.end method

.method static synthetic access$getFeaturesShadowRow(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->featuresShadowRow:I
    return p0
.end method

.method static synthetic access$getRowCount(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)I
    .locals 0
    iget p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->rowCount:I
    return p0
.end method

.method static synthetic access$getListAdapter(Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;)Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
    .locals 0
    iget-object p0, p0, Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity;->listAdapter:Lcom/radolyn/ayugram/preferences/GhostModePreferencesActivity$ListAdapter;
    return-object p0
.end method
